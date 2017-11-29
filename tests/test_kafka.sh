#!/bin/bash

set -e

CMD=(
	'kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1  --partitions 1 --topic testing'
	'kafka-topics.sh --list --zookeeper zookeeper:2181'
	# "echo \'Hello World !!!\' | kafka-console-producer.sh --broker-list localhost:9092 --topic testing "
	# 'kafka-console-consumer.sh --zookeeper zookeeper:2181 --topic testing --from-beginning'
	'kafka-topics.sh --delete --zookeeper zookeeper:2181 --topic testing'
)

for i in "${CMD[@]}"
do
	echo $i
	eval 'docker exec -it kafka' $i 
	echo '======================================================'
done