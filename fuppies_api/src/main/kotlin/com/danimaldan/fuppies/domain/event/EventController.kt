package com.danimaldan.fuppies.domain.event

import com.danimaldan.fuppies.domain.child.Child
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("event")
class EventController(private val eventRepository: EventRepository) {
    @GetMapping("{id}")
    fun get(@PathVariable id: String): Event<*> {
        val event = eventRepository.findById(id, Child.MILLIE.uuid);

        return event ?: throw IllegalArgumentException("$id not found");
    }

    @DeleteMapping("{id}")
    fun delete(@PathVariable id: String) {
        val event = get(id)

        eventRepository.delete(event);
    }
}