![kafka-logo](https://kafka.apache.org/images/kafka_diagram.png)

Docker Kafka
===================

Simple Docker Kafka Image on Alpine Linux

## Version

- Alpine Linux 3.6
- Java 8u131
- Kafka 1.0.0
- Scala 2.12
- Zookeeper 3.4.11

## Build

Command:

    docker-composer build

Or: 
    
    docker build -t vietdien2005/kafka-docker-alpine .

## Running

Command:

    docker-composer up -d

## Configuration

Kafka is installed under /opt/kafka and make use of /opt/kafka/config/server.properties.

You can edit this files in order customize configuration