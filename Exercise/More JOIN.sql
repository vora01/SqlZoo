/*

1.List the films WHERE the yr is 1962 [Show id, title]
A:-

SELECT id, title
 FROM movie
 WHERE yr=1962

2.Give year of 'Citizen Kane'.
A:

SELECT yr FROM movie
WHERE title = 'Citizen Kane'

3.List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title).
 Order results by year.

A:

SELECT id, title, yr FROM movie 
WHERE title like '%Star Trek%'

4.What id number does the actor 'Glenn Close' have?

A:

SELECT id FROM actor
WHERE name = 'Glenn Close'

5. What is the id of the film 'Casablanca'

A:
SELECT id FROM movie
WHERE title = 'Casablanca'

6. The cast list is the names of the actors who were in the movie.

Use movieid=11768, (or whatever value you got FROM the previous question)

A:

SELECT name FROM actor a JOIN casting c
ON  a.id = c.actorid
WHERE movieid=11768

7. Obtain the cast list for the film 'Alien'

A:-

SELECT name FROM movie m JOIN casting c
ON  m.id = c.movieid 
JOIN actor a ON a.id = c.actorid
WHERE title ='Alien'

8. List the films in which 'Harrison Ford' has appeared

A:

SELECT title FROM movie m JOIN casting c
ON  m.id = c.movieid 
JOIN actor a ON a.id = c.actorid
WHERE a.name = 'Harrison Ford'

9. List the films WHERE 'Harrison Ford' has appeared - but not in the starring role.
 [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

A:

SELECT title FROM movie m JOIN casting c
ON  m.id = c.movieid 
JOIN actor a ON a.id = c.actorid
WHERE a.name = 'Harrison Ford' And c.ord != 1

10. List the films together with the leading star for all 1962 films.

A:

SELECT title,name FROM movie m JOIN casting c
ON  m.id = c.movieid 
JOIN actor a ON a.id = c.actorid
WHERE c.ord = 1 and m.yr = 1962

11. Which were the busiest years for 'John Travolta', show the year and the number of movies he made each year for
 any year in which he made more than 2 movies.

A:

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title)>2


12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
A:

SELECT title,name FROM movie m JOIN casting c
ON  m.id = c.movieid 
JOIN actor a ON a.id = c.actorid
WHERE m.id in (SELECT m.id FROM movie m JOIN casting c
ON  m.id = c.movieid 
JOIN actor a ON a.id = c.actorid
WHERE a.name ='Julie Andrews') And ord=1

13.Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles.
A:

SELECT Distinct a.name FROM movie m JOIN casting c
ON  m.id = c.movieid 
JOIN actor a ON a.id = c.actorid
WHERE a.name IN (SELECT name FROM movie m JOIN casting c
ON  m.id = c.movieid JOIN actor a ON a.id = c.actorid WHERE ord=1 Group by name having count(title)>=30 ) 
 order by a.name

14.List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
A:

SELECT m.title,count(a.name) FROM movie m JOIN casting c
ON  m.id = c.movieid 
JOIN actor a ON a.id = c.actorid
WHERE m.yr = 1978
group by m.title
order by count(a.name) desc,m.title

15. List all the people who have worked with 'Art Garfunkel'.
A:

SELECT Distinct a.name FROM movie m JOIN casting c
ON  m.id = c.movieid 
JOIN actor a ON a.id = c.actorid
WHERE m.title IN (SELECT m.title FROM movie m JOIN casting c ON  m.id = c.movieid 
                  JOIN actor a ON a.id = c.actorid
                  WHERE a.name = 'Art Garfunkel') AND a.name != 'Art Garfunkel'

*/
