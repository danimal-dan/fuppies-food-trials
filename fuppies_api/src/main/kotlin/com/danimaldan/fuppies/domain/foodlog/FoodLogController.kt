package com.danimaldan.fuppies.domain.foodlog

import com.danimaldan.fuppies.domain.child.Child
import com.danimaldan.fuppies.domain.event.Event
import com.danimaldan.fuppies.domain.event.EventRepository
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("event/food-log")
class FoodLogController(private val eventRepository: EventRepository) {
    @PostMapping
    fun logFood(@RequestBody entry: FoodLogEntry): FoodLogEntry {
        var event = Event.from(Child.MILLIE, entry);

        event = eventRepository.save(event);

        return event.details;
    }
}