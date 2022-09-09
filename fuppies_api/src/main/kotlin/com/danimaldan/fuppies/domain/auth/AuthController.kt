package com.danimaldan.fuppies.domain.auth

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("auth")
class AuthController {
    @GetMapping
    fun validateAuthToken() {
        // returns 200 if auth is valid
    }
}