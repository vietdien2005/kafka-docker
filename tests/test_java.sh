#!/bin/bash

set -e

CMD=(
	'which javac'
	'which java'
	'java -version'
	'javac -version'
)

for i in "${CMD[@]}"
do
	echo $i
	eval 'docker exec -it kafkadocker_kafka_1' $i 
	echo '======================================================'
done