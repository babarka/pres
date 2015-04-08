-- (c) 2015 copyright brad barker - sample code not supported
-- all rights reserved may not be copied or published without permission


INVALIDATE METADATA default.transd;

SELECT pres,yr,SUM(we)/SUM(we+me) weme_index
FROM default.trans
WHERE me > 0 AND we > 0
GROUP BY pres, yr
ORDER BY yr;

