#!/usr/bin/env bash

cd `dirname $0`

DATA_GEN=/Users/dstreev/projects/david/iot-data-utility/data-utility-generator/target/data-utility-generator-3.0-SNAPSHOT-shaded.jar

mkdir -p data/base data/1 data/2 data/3
java -jar $DATA_GEN -cfg cc_trans-csv.yaml -o data/day=01/cc_trans.csv -c 10000
java -jar $DATA_GEN -cfg cc_trans-csv.yaml -o data/day=02/cc_trans.csv -c 10000
java -jar $DATA_GEN -cfg cc_trans-csv.yaml -o data/day=03/cc_trans.csv -c 10000
java -jar $DATA_GEN -cfg cc_trans-csv.yaml -o data/day=04/cc_trans.csv -c 10000
