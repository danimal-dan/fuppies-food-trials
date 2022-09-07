package com.danimaldan.fuppies.domain.foodlog

import org.junit.jupiter.api.Test
import java.time.ZonedDateTime
import java.util.*

internal class FoodLogEntryKtTest {

    @Test
    fun wat_why() {
        val entry = FoodLogEntry(
            UUID.randomUUID().toString(),
            ZonedDateTime.now(),
            Food.BLUEBERRIES,
            10.0,
            VolumeUnit.TEASPOON,
            FoodReaction.DISLIKED
        )


    }
}