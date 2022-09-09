package dev.danimal.fuppies.domain.event

import com.fasterxml.jackson.annotation.JsonSubTypes
import com.fasterxml.jackson.annotation.JsonTypeInfo
import dev.danimal.fuppies.domain.foodlog.FoodLogEntry
import java.time.ZonedDateTime

@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.PROPERTY, property = "@type")
@JsonSubTypes(JsonSubTypes.Type(value = FoodLogEntry::class, name = FoodLogEntry.TYPE_NAME))
interface EventDetails {
    val id: String
    val date: ZonedDateTime
}