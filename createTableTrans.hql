-- (c) 2015 copyright brad barker - sample code not supported
-- all rights reserved may not be copied or published without permission

DROP TABLE default.trans;

CREATE EXTERNAL TABLE default.trans (
  id   STRING ,
  pres STRING ,
  yr   INT    ,
  me   INT    ,
  we   INT    ,
  tot  INT    )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE
LOCATION '/user/cloudera/trans';
