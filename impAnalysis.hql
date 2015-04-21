-- brad barker - 4/21/2015

INVALIDATE METADATA default.transd;

SELECT pres,yr,SUM(we)/SUM(we+me) weme_index
FROM default.trans
WHERE me > 0 AND we > 0
GROUP BY pres, yr
ORDER BY yr;

