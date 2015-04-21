-- brad barker - 4/21/2015

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
