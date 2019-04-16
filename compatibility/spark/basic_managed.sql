use ${DB}_${PLACEHOLDER};

CREATE TABLE IF NOT EXISTS basic_managed AS
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
    
INSERT INTO TABLE basic_managed
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
      
INSERT INTO TABLE basic_managed
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
    
INSERT INTO TABLE basic_managed
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