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
spark-sql -f spark/clean.sql --hivevar DB=$DB --hivevar PLACEHOLDER=$PLACEHOLDER

# Create DB
spark-sql -f spark/build_db.sql --hivevar DB=$DB --hivevar PLACEHOLDER=$PLACEHOLDER

# Cleanup old Data
#hdfs dfs -rm -r -f /warehouse/tablespace/external/hive/${DB}_${PLACEHOLDER}.db/basic_external

spark-sql -f spark/basic_external.sql --hivevar DB=$DB --hivevar PLACEHOLDER=$PLACEHOLDER

#hdfs dfs -copyFromLocal generator/data/* /warehouse/tablespace/external/hive/${DB}_${PLACEHOLDER}.db/basic_external

spark-sql -e "msck repair table ${DB}_${PLACEHOLDER}.basic_external"

spark-sql -f spark/external_append.sql --hivevar DB=$DB --hivevar PLACEHOLDER=$PLACEHOLDER 

spark-sql -f spark/basic_managed.sql --hivevar DB=$DB --hivevar PLACEHOLDER=$PLACEHOLDER 
