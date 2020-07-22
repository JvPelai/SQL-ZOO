--01
SELECT matchid,player FROM goal 
  WHERE teamid = 'GER'

--02
SELECT id,stadium,team1,team2
  FROM game WHERE id = '1012'

--03
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

--04
SELECT team1,team2,player FROM game JOIN goal ON game.id = goal.matchid
WHERE player LIKE 'Mario%'

--05
SELECT player, teamid, coach,gtime
  FROM goal JOIN eteam on teamid = id
 WHERE gtime<=10

--06
SELECT mdate, teamname FROM game JOIN eteam ON team1 = eteam.id
WHERE coach = 'Fernando Santos'

--07
SELECT player FROM goal JOIN game ON id = matchid
WHERE stadium = 'National Stadium, Warsaw'

--08
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND teamid != 'GER'

--09
SELECT teamname, COUNT(teamname)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

--10
SELECT stadium, COUNT(stadium) FROM game
JOIN goal ON id = matchid
GROUP BY stadium

--11
SELECT matchid,mdate, COUNT(*)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY matchid;

--12
SELECT matchid, mdate, COUNT(player) FROM goal
  JOIN game ON game.id = goal.matchid
  WHERE goal.teamid = 'GER'
  GROUP BY matchid;

--13
SELECT DISTINCT mdate, team1,
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game JOIN goal ON matchid = id
GROUP BY mdate,team1,team2
ORDER BY mdate,team1,team2;
