package dev.danimal.fuppies.domain.event

import com.fasterxml.jackson.databind.ObjectMapper
import dev.danimal.fuppies.domain.child.Child
import mu.KotlinLogging
import org.springframework.stereotype.Repository
import software.amazon.awssdk.services.dynamodb.DynamoDbClient
import software.amazon.awssdk.services.dynamodb.model.*


private val logger = KotlinLogging.logger {}

@Repository
class EventRepository(val dynamoDbClient: DynamoDbClient, val objectMapper: ObjectMapper) {
    companion object {
        private const val TABLE = "fuppies_event"
    }

    fun findById(id: String, childId: String): Event<*>? {
        val attributeValues = HashMap<String, AttributeValue>()
        attributeValues[":id"] = AttributeValue.builder()
            .s(id)
            .build()
        attributeValues[":childId"] = AttributeValue.builder()
            .s(childId)
            .build()

        val request = QueryRequest.builder()
            .keyConditionExpression("childId = :childId")
            .expressionAttributeValues(attributeValues)
            .filterExpression("id = :id")
            .tableName(TABLE)
            .build()

        try {
            val response = dynamoDbClient.query(request)

            if (response.count() == 0) {
                return null;
            }

            if (response.count() > 1) {
                throw IllegalStateException("Multiple entities found for findById query")
            }

            return deserialize(response.items()[0])
        } catch (e: DynamoDbException) {
            logger.error(e) { "Error looking up item" }
            throw e
        }
    }

    fun <T : EventDetails> save(event: Event<T>): Event<T> {
        val itemValues = serialize(event);

        val request = PutItemRequest.builder()
            .tableName(TABLE)
            .item(itemValues)
            .build()

        try {
            val response: PutItemResponse = dynamoDbClient.putItem(request)

            logger.info {
                "$TABLE was successfully updated. The request id is ${response.responseMetadata().requestId()}"
            }

            return event
        } catch (e: ResourceNotFoundException) {
            logger.error(e) { "Error: The Amazon DynamoDB table \"$TABLE\" can't be found." }
            throw e
        } catch (e: DynamoDbException) {
            logger.error(e) { "Error saving item" }
            throw e
        }
    }

    fun delete(event: Event<*>) {
        val keyToGet = HashMap<String, AttributeValue>()
        keyToGet["childId"] = AttributeValue.builder()
            .s(event.childId)
            .build()
        keyToGet["timestamp"] = AttributeValue.builder()
            .n(event.timestamp.toString())
            .build()

        val attributeValues = HashMap<String, AttributeValue>()
        attributeValues[":id"] = AttributeValue.builder()
            .s(event.id)
            .build()

        val deleteReq = DeleteItemRequest.builder()
            .tableName(TABLE)
            .key(keyToGet)
            .conditionExpression("id = :id")
            .expressionAttributeValues(attributeValues)
            .build()

        try {
            dynamoDbClient.deleteItem(deleteReq)
        } catch (e: DynamoDbException) {
            logger.error(e) { "Error deleting item" }
            throw e
        }
    }

    private fun <T : EventDetails> serialize(event: Event<T>): Map<String, AttributeValue> {
        val itemValues = HashMap<String, AttributeValue>()

        itemValues["id"] = AttributeValue.builder().s(event.id).build()

        itemValues["childId"] = AttributeValue.builder().s(event.childId).build()

        itemValues["timestamp"] =
            AttributeValue.builder().n(event.timestamp.toString()).build()

        val serializedDetails = objectMapper.writeValueAsString(event.details);
        itemValues["details"] = AttributeValue.builder().s(serializedDetails).build()

        return itemValues;
    }

    private fun deserialize(itemValues: Map<String, AttributeValue>): Event<*> {
        val serializedDetails = itemValues["details"]?.s()
        val eventDetails = objectMapper.readValue(serializedDetails, EventDetails::class.java);

        val childId = itemValues["childId"]?.s()
        val child = childId?.let { Child.fromUuid(it) }

        return Event.from(child!!, eventDetails);
    }
}