/*

1.Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

Answer:-

SELECT matchid,player FROM goal  
  WHERE teamid LIKE 'GER'

2.Show id, stadium, team1, team2 for just game 1012

Answer:-

SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012

3.Modify it to show the player, teamid, stadium and mdate for every German goal.

Answer:-

SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER'

4.Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

Answer:-

SELECT team1,team2,player FROM game JOIN goal 
ON (id=matchid)
WHERE player LIKE 'Mario%'

5.Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

Answer:-

SELECT player, teamid,coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10

6.List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

Answer:-

SELECT mdate, teamname FROM game g JOIN eteam e 
ON (g.team1=e.id)
WHERE e.coach = 'Fernando Santos'

7.List the player for every goal scored in a game WHERE the stadium was 'National Stadium, Warsaw'

Answer:-

SELECT player FROM game g1 JOIN goal g2
ON (g1.id = g2.matchid)
WHERE g1.stadium = 'National Stadium, Warsaw'

8.Instead show the name of all players who scored a goal against Germany.

Answer:-

SELECT DISTINCT player
  FROM game g1 JOIN goal g2 ON (g1.id = g2.matchid) 
    WHERE (g2.teamid NOT LIKE 'GER')AND(g1.team1='GER' OR g1.team2='GER')

9.Show teamname and the total number of goals scored

Answer:-

SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON id=teamid
group by teamname
 ORDER BY teamname

10. Show the stadium and the number of goals scored in each stadium.

Answer:-

SELECT stadium, count(*)
FROM game g1 JOIN goal g2 ON (g1.id = g2.matchid)
group by stadium
order by stadium

11. For every match involving 'POL', show the matchid, date and the number of goals scored.

Answer:- 
SELECT g2.matchid, g1.mdate,count(teamid)
  FROM game g1 JOIN goal g2 ON (g1.id = g2.matchid)  
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by g2.matchid, g1.mdate

12.For every match WHERE 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

Answer:-

SELECT matchid, mdate, count(teamid)
FROM game g1 JOIN goal g2 ON (g1.id = g2.matchid)
WHERE g2.teamid = 'GER'
group by g2.matchid, g1.mdate

13.List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been 
explained in any previous exercises.
mdate	        team1	score1	    team2	    score2
1 July 2012	    ESP	    4	        ITA	        0
10 June 2012	ESP	    1	        ITA	        1
10 June 2012	IRL	    1	        CRO	        l
...


Answer:-

SELECT  mdate,
  team1, SUM (CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1 ,
  team2,SUM (CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2 
  FROM game LEFT JOIN goal ON matchid = id
group by mdate,matchid,team1,team2
*/