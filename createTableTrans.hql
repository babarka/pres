-- (c) 2015 copyright brad barker - sample code not supported
-- all rights reserved may not be copied or published without permission

DROP TABLE default.trans;

CREATE EXTERNAL TABLE default.trans (
  id   STRING ,
  pres STRING ,
  me   INT    ,
  we   INT    ,
  tot  INT    )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE
LOCATION '/user/cloudera/trans';


DROP TABLE default.dates;

CREATE EXTERNAL TABLE default.dates (
  pres STRING ,
  dte   INT )
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/cloudera/dates';

DROP TABLE defaults.transd;
CREATE TABLE default.transd AS
SELECT
   t.id,
   t.pres,
   d.dte,
   t.me,
   t.we,
   t.tot
FROM
   default.trans t
JOIN
   default.dates d
ON 
   t.pres = d.pres



