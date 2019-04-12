#!/usr/bin/env bash

cd `dirname $0`

DB=$1
PLACEHOLDER=$2

if [ "${DB}x" == "x" ]; then
    echo "Missing DB arg"
    exit -1
fi

if [ "${PALCEHOLDER}x" == "x" ]; then
    echo "Missing PLACEHOLDER arg"
    exit -1
fi


hive -f hive/build_db.sql --hivevar DB=$DB --hivevar PLACEHOLDER=$PLACEHOLDER

# Cleanup old Data
hdfs dfs -rm -r -f /warehouse/tablespace/external/hive/${DB}_${PLACEHOLDER}.db/BASIC_EXTERNAL

hive -f hive/basic_external.sql  --hivevar DB=$DB --hivevar PLACEHOLDER=$PLACEHOLDER