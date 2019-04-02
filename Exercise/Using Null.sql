/*
1. List the teachers who have NULL for their department.
A:

SELECT name FROM teacher
WHERE dept is null

2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
A:

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

3. Use a different JOIN so that all teachers are listed.
A:

SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

4. Use a different JOIN so that all departments are listed.
A:

SELECT teacher.name, dept.name
 FROM teacher right JOIN dept
           ON (teacher.dept=dept.id)

5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. 
Show teacher name and mobile number or '07986 444 2266'
A:

SELECT name, COALESCE(mobile,'07986 444 2266') AS MobileNumber
  FROM teacher 

6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' WHERE there is no department.
A:

SELECT t.name, COALESCE(d.name,'None') AS Department
  FROM teacher t LEFT JOIN dept d 
  ON t.dept = d.id

7. Use COUNT to show the number of teachers and the number of mobile phones.
A:

SELECT Count(name), Count(mobile) FROM teacher

8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN 
to ensure that the Engineering department is listed.
A:

SELECT d.name,COUNT(t.name) FROM teacher t RIGHT JOIN dept d
ON t.dept = d.id
group by d.name

9.Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
A:

SELECT t.name,
             CASE WHEN dept=1
             THEN 'Sci'
             WHEN dept=2
             THEN 'Sci'
             ELSE 'Art'
             END
FROM teacher t 

10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, 
show 'Art' if the teacher's dept is 3 and 'None' otherwise.
A:

SELECT t.name,
             CASE WHEN dept=1
             THEN 'Sci'
             WHEN dept=2
             THEN 'Sci'
             WHEN dept=3
             THEN 'Art'             
             ELSE 'None'
             END
FROM teacher t 

*/