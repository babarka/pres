-- (c) 2015 copyright brad barker - sample code not supported
-- all rights reserved may not be copied or published without permission

INVALIDATE METADATA default.transd;
SELECT
   *
FROM
   (SELECT
      pres                ,
      AVG(dte)            dte,
      SUM(me)             me,
      SUM(we)             we,
      SUM(we)/SUM(we+me) team_index,
      AVG(tot)            tot
   FROM
      default.transd
   WHERE
      me > 0 AND we > 0
   GROUP BY
      pres) a
ORDER BY
    dte
