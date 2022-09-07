package com.danimaldan.fuppies.domain.event

import com.danimaldan.fuppies.domain.foodlog.FoodLogEntry
import com.fasterxml.jackson.annotation.JsonSubTypes
import com.fasterxml.jackson.annotation.JsonTypeInfo
import java.time.ZonedDateTime

@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.PROPERTY, property = "@type")
@JsonSubTypes(JsonSubTypes.Type(value = FoodLogEntry::class, name = FoodLogEntry.TYPE_NAME))
interface EventDetails {
    val id: String
    val date: ZonedDateTime
}