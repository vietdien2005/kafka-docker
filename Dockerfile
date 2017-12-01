FROM alpine:3.6

MAINTAINER Dam Viet "vietdien2005@gmail.com"

ENV LANG C.UTF-8

ENV JAVA_VERSION 8u131
ENV JAVA_ALPINE_VERSION 8.131.11-r2
ENV KAFKA_VERSION 1.0.0
ENV SCALA_VERSION 2.12

RUN apk add --no-cache openjdk8="$JAVA_ALPINE_VERSION" \
	openjdk8-jre tini su-exec bash coreutils curl ca-certificates jq

# Install Kafka
RUN mkdir -p /opt \
	&& mirror=$(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | jq -r '.preferred') \
	&& curl -sS -k "${mirror}kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" | tar -xzf - -C /opt \
	&& mv /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka \
	&& rm -rf /opt/kafka/bin/windows \
	&& adduser -DH -s /sbin/nologin kafka \
	&& chown -R kafka:kafka /opt/kafka

COPY config/server.properties /opt/kafka/config/
COPY config/zookeeper.properties /opt/kafka/config/
COPY config/producer.properties /opt/kafka/config/
COPY config/consumer.properties /opt/kafka/config/

RUN rm -rf /var/cache/apk/*

ENV PATH /sbin:/opt/kafka/bin/:$PATH

WORKDIR /opt/kafka

EXPOSE 9092

CMD ["bin/kafka-server-start.sh", "config/server.properties"]
