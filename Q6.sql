SELECT DISTINCT knownfor.pid
FROM knownfor
WHERE knownfor.pid IN 
(
SELECT knownfor.pid
FROM knownfor
JOIN director ON (director.mid = knownfor.mid)
JOIN person ON (director.pid = person.id)
WHERE person.name LIKE "Sofia Coppola"
)
AND 
knownfor.pid IN 
(
SELECT knownfor.pid
FROM knownfor
JOIN actor ON (actor.mid = knownfor.mid)
JOIN person ON (actor.pid = person.id)
WHERE person.name LIKE "Antonio Banderas"
)
