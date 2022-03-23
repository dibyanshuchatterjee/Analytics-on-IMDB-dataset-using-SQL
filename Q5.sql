SELECT person.id, count(genre.name LIKE 'drama')
FROM person
JOIN actor on (actor.pid = person.id)
JOIN moviegenre on (actor.mid = moviegenre.mid)
JOIN genre on (genre.id = moviegenre.gid)
WHERE dyear is NULL AND person.id IN 
(
SELECT person.id
FROM person
WHERE person.name LIKE binary '% Patel' OR person.name LIKE binary '% Raj'
) 
AND person.id NOT IN 
(
SELECT person.id
FROM person
JOIN actor on (actor.pid = person.id)
JOIN moviegenre on (actor.mid = moviegenre.mid)
JOIN genre on (genre.id = moviegenre.gid)
WHERE genre.name LIKE "comedy"
)
AND genre.name LIKE 'drama'
GROUP BY person.id
HAVING count(genre.id) >= 5