package com.danimaldan.fuppies.config

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.boot.context.properties.ConstructorBinding

@ConstructorBinding
@ConfigurationProperties(prefix = "aws.dynamo-db")
data class DynamoDbConfigurationProperties(var endpoint: String?)
