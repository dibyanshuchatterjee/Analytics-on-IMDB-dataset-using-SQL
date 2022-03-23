SELECT producer.pid, count(producer.mid)
FROM producer
JOIN movie ON (producer.mid = movie.id)
JOIN moviegenre ON (moviegenre.mid = movie.id)
JOIN genre ON (genre.id = moviegenre.gid)
WHERE genre.name LIKE "action" AND producer.pid in
(
SELECT pr.pid
FROM producer AS pr
JOIN moviegenre ON (moviegenre.mid = pr.mid)
JOIN genre ON (genre.id = moviegenre.gid)
WHERE genre.name LIKE "action"
group by pr.pid
HAVING count(pr.mid) >= 15 
)
AND
producer.pid IN 
(
SELECT dr.pid
FROM director AS dr
JOIN moviegenre AS mg ON (mg.mid = dr.mid)
JOIN genre AS g ON (g.id = mg.gid)
GROUP BY dr.pid
HAVING count(dr.mid) >= 1
)
AND 
producer.pid NOT IN
(
SELECT pa.pid
FROM producer AS pa
JOIN movie AS ma ON (pa.mid = ma.id)
JOIN moviegenre AS mga ON (mga.mid = ma.id)
JOIN genre AS ga ON (ga.id = mga.gid)
WHERE ga.name LIKE "romance" 
)
GROUP BY producer.pid

