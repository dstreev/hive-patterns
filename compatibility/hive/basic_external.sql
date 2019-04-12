use ${DB}_${PLACEHOLDER};

CREATE EXTERNAL TABLE BASIC_EXTERNAL IF NOT EXISTS (
  cc_trans STRING,
  ccn STRING,
  trans_ts STRING,
  uuid STRING,
  mcc INT,
  mrch_id STRING,
  st STRING,
  amnt DOUBLE
);
