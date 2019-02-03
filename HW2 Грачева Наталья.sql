-- --ДЗ № 2 Грачева Наталья


SELECT 'ФИО: Грачева Наталья Сергеевна';

-- 1.1.

SELECT *
FROM ratings
  
LIMIT 10; 

-- 1.2.

SELECT *
FROM links
  WHERE movieid between 100 and 1000
  AND imdbid LIKE '%42'
LIMIT 10;

--2.1.

SELECT l.imdbId
FROM links l 
	INNER JOIN ratings r
	ON r.movieid= l.movieid
WHERE r.rating = 5
LIMIT 10;

--3.1.

SELECT COUNT(l.movieid) AmountFilms

FROM links l

LEFT JOIN ratings r
	ON l.movieid=r.movieid
WHERE r.movieid IS NULL
;

--3.2.
SELECT r.userid, COUNT(r.userid), AVG(rating)
FROM ratings r
GROUP BY r.userid
HAVING AVG(rating) > 3.5

ORDER BY COUNT(r.userid) DESC
LIMIT 10
;

--4.1.
SELECT l.imdbid, AVG(r.rating)
FROM Links l
INNER JOIN ratings r 
ON l.movieid = r.movieid 
GROUP BY l.imdbid
HAVING AVG(r.rating) > 3.5
LIMIT 10;

--4.2.
WITH tmp
AS
(SELECT r.userid, COUNT (r.rating), AVG (r.rating) rating
FROM ratings r
GROUP BY r.userid
HAVING COUNT (r.rating) > 10
Limit 10)

SELECT AVG(rating)
FROM tmp
;




