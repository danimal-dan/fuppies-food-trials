package dev.danimal.fuppies.domain.foodlog

import dev.danimal.fuppies.domain.child.Child
import dev.danimal.fuppies.domain.event.Event
import dev.danimal.fuppies.domain.event.EventRepository
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