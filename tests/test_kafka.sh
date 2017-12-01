#!/bin/bash

set -e

CMD=(
	'kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1  --partitions 1 --topic testing --if-not-exists'
	'kafka-topics.sh --list --zookeeper zookeeper:2181'
	# 'kafka-topics.sh --delete --zookeeper zookeeper:2181 --topic testing'
)

for i in "${CMD[@]}"
do
	echo $i
	eval 'docker exec -it testkafka_kafka_1' $i 
	echo '======================================================'
done