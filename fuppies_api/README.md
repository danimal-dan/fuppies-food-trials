# Fuppies API

This is small rest API to that uses DynamoDB as a datastore. It supports the Fuppies Mobile App.

# Running Locally

Build

```bash
mvn clean install
```

Initialize Services

```bash
docker compose up -d
```

Create DynamoDB `fuppies_event` Table

```bash
aws dynamodb create-table --attribute-definitions AttributeName=childId,AttributeType=S AttributeName=timestamp,AttributeType=N --table-name fuppies_event --key-schema AttributeName=childId,KeyType=HASH AttributeName=timestamp,KeyType=RANGE --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --endpoint-url http://localhost:8000
```

Verify table exists

```bash
aws dynamodb describe-table --table-name fuppies_event --no-cli-pager --endpoint-url http://localhost:8000
```