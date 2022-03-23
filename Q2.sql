SELECT pid, count(mid)
FROM actor
join movie on (mid = movie.id)
join person on (pid = person.id)
WHERE dyear is null and year = 2021 and adult = 1 AND pid not in(
SELECT actor.pid
from actor
JOIN movie ON (actor.mid = movie.id)
where year < 2021 and adult = 1)
GROUP BY pid
ORDER BY 
(
count(mid)
) DESC,pid
LIMIT 25
