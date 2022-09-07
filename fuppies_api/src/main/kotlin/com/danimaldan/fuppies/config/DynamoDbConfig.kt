package com.danimaldan.fuppies.config

import mu.KotlinLogging
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import software.amazon.awssdk.services.dynamodb.DynamoDbClient
import java.net.URI

private val logger = KotlinLogging.logger {}

@Configuration
@EnableConfigurationProperties(DynamoDbConfigurationProperties::class)
class DynamoDbConfig(private val properties: DynamoDbConfigurationProperties) {
    @Bean
    fun amazonDynamoDB(): DynamoDbClient {
        val builder = DynamoDbClient.builder()

        if (properties.endpoint?.isNotBlank() == true) {
            logger.info { "Using Dynamo DB with endpoint ${properties.endpoint}" }
            builder.endpointOverride(
                properties.endpoint?.let { URI(it) }
            )
        }

        return builder.build();
    }
}