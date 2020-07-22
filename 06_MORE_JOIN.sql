--01 1962 movies
SELECT id, title
 FROM movie
 WHERE yr=1962

--02 Citizen Kane
SELECT yr FROM movie
WHERE title = 'Citizen Kane'

--03 Star Trek movies
SELECT id,title,yr FROM movie
WHERE title LIKE 'Star Trek%' ORDER BY yr

--04 id of an actor
SELECT id FROM actor WHERE 
name = 'Glenn Close'

--05 id for a movie
SELECT id FROM movie 
WHERE title = 'Casablanca'

--06 Cast list
SELECT name FROM actor 
JOIN casting ON id = actorid
WHERE movieid = 27

--07 Alien cast list
SELECT name FROM actor 
JOIN casting ON id = actorid
WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien')

--08 Harrison Ford movies
SELECT title FROM movie
JOIN casting ON id = movieid
WHERE casting.actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')

--09 Harrison Ford as a supporting actor
SELECT title FROM movie
JOIN casting ON id = movieid
WHERE casting.actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') AND casting.ord > 1

--10 Lead Actors in 1962
SELECT title,name FROM movie JOIN casting
ON id = movieid
JOIN actor ON actorid = actor.id
WHERE yr = 1962 AND ord = 1

--11 Rock Hudson
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

--12 Lead actor in Julie Andrews movies
SELECT title,name FROM casting
JOIN movie ON movieid = id
JOIN actor ON actor.id = casting.actorid
WHERE movieid IN (
  SELECT movieid FROM casting WHERE actorid = (SELECT id FROM actor WHERE name = 'Julie Andrews')) AND ord = 1;

--13 Actors with 15 leading roles
SELECT name FROM actor
JOIN casting ON id = actorid
WHERE  name IN (SELECT name FROM actor WHERE ord = 1) GROUP BY name HAVING COUNT (name) >= 15

--14 Films released in 1978
SELECT title, COUNT(name) FROM movie JOIN casting
ON id = movieid JOIN actor ON actor.id = casting.actorid
WHERE yr = 1978 GROUP BY title ORDER BY COUNT(name) DESC,title

--15 People who have worked with 'Art Garfunkel'
SELECT name FROM actor JOIN casting ON id = actorid
JOIN movie ON casting.movieid = movie.id
WHERE name IN (SELECT movieid FROM casting WHERE actorid = (SELECT id FROM actor WHERE name = 'Art Garfunkel')) AND name != 'Art Garfunkel'

