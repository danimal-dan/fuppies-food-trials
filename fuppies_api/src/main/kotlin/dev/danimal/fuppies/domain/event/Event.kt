package dev.danimal.fuppies.domain.event

import dev.danimal.fuppies.domain.child.Child
import java.util.*

data class Event<T : EventDetails>(
    val id: String = UUID.randomUUID().toString(),
    val childId: String,
    val timestamp: Long,
    val details: T,
) {
    companion object {
        fun <U : EventDetails> from(child: Child, details: U): Event<U> =
            Event(details.id, child.uuid, details.date.toInstant().toEpochMilli(), details)
    }
}
