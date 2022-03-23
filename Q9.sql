SELECT person.id, count(DISTINCT movie.id) as dddd,round(avg(movie.rating),2)
FROM person
JOIN knownfor ON (knownfor.pid = person.id)
JOIN movie ON (knownfor.mid = movie.id)
JOIN moviegenre ON (moviegenre.mid = knownfor.mid)
JOIN genre ON (moviegenre.gid = genre.id)
WHERE person.name LIKE BINARY ("Steve%") AND person.dyear is NULL AND 
knownfor.mid IN
(
SELECT movie.id 
FROM movie
JOIN moviegenre ON (moviegenre.mid = movie.id)
JOIN genre ON (moviegenre.gid = genre.id)
WHERE (genre.name LIKE 'Drama' or genre.name LIKE "Thriller")
)
AND knownfor.mid not in
(
SELECT director.mid
FROM director 
group by director.mid 
HAVING count(director.pid) > 1
)
group by person.id
having dddd >= 4
ORDER BY round(avg(movie.rating),2) desc