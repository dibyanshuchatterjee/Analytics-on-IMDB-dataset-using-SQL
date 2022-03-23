select person.id,count(movie.id)
from person
join actor on (actor.pid=person.id)
join movie on (movie.id=actor.mid) 
where (dyear is NULL) and (runtime > 90) and (year = 2016) and actor.pid not in 
(
SELECT actor.pid
FROM actor
JOIN movie ON (actor.mid = movie.id)
WHERE movie.year >= 2017
)
GROUP BY pid
HAVING count(movie.id) > 3


