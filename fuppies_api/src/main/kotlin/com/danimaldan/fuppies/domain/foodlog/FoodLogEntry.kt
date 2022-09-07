package com.danimaldan.fuppies.domain.foodlog

import com.danimaldan.fuppies.domain.event.EventDetails
import com.fasterxml.jackson.annotation.JsonTypeName
import java.time.ZonedDateTime
import java.util.*

@JsonTypeName(FoodLogEntry.TYPE_NAME)
data class FoodLogEntry(
    override val id: String = UUID.randomUUID().toString(),
    override val date: ZonedDateTime,
    val food: Food?,
    val volumeAmount: Double,
    val volumeUnit: VolumeUnit,
    val reaction: FoodReaction,
) : EventDetails {
    companion object {
        const val TYPE_NAME = "FOOD_LOG_ENTRY";
    }
}

