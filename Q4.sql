SELECT d.pid, count(m.id),round(avg(m.rating),2)
FROM director AS d
JOIN movie AS m ON (m.id = d.mid)
JOIN moviegenre AS mg ON (m.id = mg.mid)
JOIN genre AS g ON (g.id = mg.gid)
WHERE g.name LIKE "Sci-fi" AND m.totalvotes >= 1000 
GROUP BY d.pid
HAVING count(d.mid) >= 5
ORDER BY 
(
round(AVG(m.rating),2)
) asc
LIMIT 15



 
