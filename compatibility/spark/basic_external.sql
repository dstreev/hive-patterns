use ${DB}_${PLACEHOLDER};

CREATE EXTERNAL TABLE IF NOT EXISTS BASIC_EXTERNAL (
  cc_trans STRING,
  ccn STRING,
  trans_ts STRING,
  uuid STRING,
  mcc INT,
  mrch_id STRING,
  st STRING,
  amnt DOUBLE
)
PARTITIONED BY (day STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/warehouse/tablespace/external/hive/${DB}_${PLACEHOLDER}.db/basic_external';
