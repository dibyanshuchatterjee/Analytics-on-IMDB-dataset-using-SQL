SELECT m.id, m.otitle, m.runtime
FROM movie AS m
JOIN moviegenre AS mg ON (mg.mid = m.id)
JOIN genre as g ON (mg.gid = g.id)
WHERE (m.year BETWEEN 1980 AND 1999) AND m.rating > 6.5 AND m.totalvotes > 10000 AND g.name = "Comedy"
AND EXISTS
(
SELECT mo.id
FROM movie AS mo
JOIN moviegenre AS mgg ON (mgg.mid = mo.id)
JOIN genre as gg ON (mgg.gid = gg.id)
WHERE mo.otitle LIKE concat(m.otitle,'%') AND gg.name = "Comedy"
 AND mo.year > m.year AND  mo.year <= 1999 )
-- -- -- (
-- -- -- SELECT mo.otitle
-- -- -- FROM movie AS mo
-- -- -- WHERE (m.otitle LIKE CONCAT(mo.otitle, '%')) AND (mo.year <=1999)
-- -- -- )

