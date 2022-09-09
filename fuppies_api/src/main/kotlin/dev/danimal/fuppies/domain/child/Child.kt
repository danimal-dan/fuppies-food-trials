package dev.danimal.fuppies.domain.child

enum class Child(val uuid: String) {
    MILLIE("a117da36-4a36-41a3-9032-fe6e97bd493b");

    companion object {
        fun fromUuid(uuid: String): Child? = Child.values().find { it.uuid == uuid }
    }
}