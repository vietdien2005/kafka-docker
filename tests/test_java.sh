#!/bin/bash

set -e

CMD=(
	'java -version'
)

for i in "${CMD[@]}"
do
	echo $i
	eval 'docker exec -it kafka' $i 
	echo '======================================================'
done