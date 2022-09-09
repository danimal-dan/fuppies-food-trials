package dev.danimal.fuppies

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.boot.runApplication

@SpringBootApplication
@EnableConfigurationProperties
class FuppiesApplication

fun main(args: Array<String>) {
    runApplication<FuppiesApplication>(*args)
}
