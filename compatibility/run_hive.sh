#!/usr/bin/env bash

cd `dirname $0`

DB=$1
PLACEHOLDER=$2

if [ "${DB}x" == "x" ]; then
    echo "Missing DB arg"
    exit -1
fi

if [ "${PLACEHOLDER}x" == "x" ]; then
    echo "Missing PLACEHOLDER arg"
    exit -1
fi

# Clean up
hive -f hive/clean.sql --hivevar DB=$DB --hivevar PLACEHOLDER=$PLACEHOLDER

# Create DB
hive -f hive/build_db.sql --hivevar DB=$DB --hivevar PLACEHOLDER=$PLACEHOLDER

# Cleanup old Data
hdfs dfs -rm -r -f /warehouse/tablespace/external/hive/${DB}_${PLACEHOLDER}.db/basic_external

hive -f hive/basic_external.sql --hivevar DB=$DB --hivevar PLACEHOLDER=$PLACEHOLDER

hdfs dfs -copyFromLocal generator/data/* /warehouse/tablespace/external/hive/${DB}_${PLACEHOLDER}.db/basic_external

hive -e "msck repair table ${DB}_${PLACEHOLDER}.basic_external"

hive -f hive/external_append.sql --hivevar DB=$DB --hivevar PLACEHOLDER=$PLACEHOLDER 

hive -f hive/basic_managed.sql --hivevar DB=$DB --hivevar PLACEHOLDER=$PLACEHOLDER 
