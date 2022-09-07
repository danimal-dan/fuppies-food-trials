package com.danimaldan.fuppies.domain.foodlog

import com.danimaldan.fuppies.domain.child.Child
import com.danimaldan.fuppies.domain.event.Event
import com.danimaldan.fuppies.domain.event.EventRepository
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("food-log")
class FoodLogController(private val eventRepository: EventRepository) {
    @GetMapping("{id}")
    fun get(@PathVariable id: String): Event<*> {
        val event = eventRepository.findById(id, Child.MILLIE.uuid);

        return event ?: throw IllegalArgumentException("$id not found");
    }

    @PostMapping
    fun logFood(@RequestBody entry: FoodLogEntry): FoodLogEntry {
        var event = Event.from(Child.MILLIE, entry);

        event = eventRepository.save(event);

        return event.details;
    }

    @DeleteMapping("{id}")
    fun delete(@PathVariable id: String) {
        val event = get(id)

        eventRepository.delete(event);
    }
}