use ${DB}_${PLACEHOLDER};

CREATE EXTERNAL TABLE IF NOT EXISTS basic_append AS
SELECT
  cc_trans ,
  ccn ,
  trans_ts ,
  uuid ,
  mcc ,
  mrch_id ,
  st ,
  amnt
FROM
    basic_external
WHERE
    day='01';
    
INSERT INTO TABLE basic_append
SELECT
  cc_trans ,
  ccn ,
  trans_ts ,
  uuid ,
  mcc ,
  mrch_id ,
  st ,
  amnt
FROM
    basic_external
WHERE
    day='02';
      
INSERT INTO TABLE basic_append
SELECT
  cc_trans ,
  ccn ,
  trans_ts ,
  uuid ,
  mcc ,
  mrch_id ,
  st ,
  amnt
FROM
    basic_external
WHERE
    day='03';      
    
INSERT INTO TABLE basic_append
SELECT
  cc_trans ,
  ccn ,
  trans_ts ,
  uuid ,
  mcc ,
  mrch_id ,
  st ,
  amnt
FROM
    basic_external
WHERE
    day='04';