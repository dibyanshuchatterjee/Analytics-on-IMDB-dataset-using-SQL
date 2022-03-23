SELECT person.id
FROM person
JOIN writer ON (writer.pid = person.id)
JOIN movie ON (movie.id = writer.mid)
WHERE (person.dyear is NULL) AND (MATCH(movie.otitle) AGAINST ("jesus") AND MATCH(movie.otitle) AGAINST ("christ"))
AND writer.mid IN
(
SELECT movie.id
FROM movie
WHERE movie.rating > 
ALL (
SELECT movie.rating
FROM movie
JOIN director ON (director.mid = movie.id)
JOIN person ON (person.id = director.pid)
WHERE person.name LIKE "Edward D. Wood Jr."
)
)

