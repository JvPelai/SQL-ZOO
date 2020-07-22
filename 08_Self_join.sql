--01
SELECT COUNT(*) FROM stops

--02
SELECT id FROM stops WHERE name = 'Craiglockhart'

--03
SELECT stops.id,stops.name
FROM stops INNER JOIN route
ON (stops.id = route.stop)
WHERE (route.company = 'LRT') AND (route.num = 4);

--04
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num HAVING COUNT(*) = 2

--05
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149

--06
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

--07
SELECT
  a.company,
  a.num
FROM route a
JOIN route b
  ON ((a.company = b.company)
     AND
     (a.num = b.num))
JOIN stops stopa
  ON (stopa.id = a.stop)
JOIN stops stopb
  ON (stopb.id = b.stop)
WHERE
  (stopa.name = 'Haymarket')
AND
  (stopb.name = 'Leith')
GROUP BY a.num, a.company;

--08
SELECT
  a.company,
  a.num
FROM route a
JOIN route b
  ON ((a.company = b.company)
     AND
     (a.num = b.num))
JOIN stops stopa
  ON (stopa.id = a.stop)
JOIN stops stopb
  ON (stopb.id = b.stop)
WHERE
  (stopa.name = 'Craiglockhart')
AND
  (stopb.name = 'Tollcross')

--09
SELECT
  stopb.name,
  a.company,
  a.num
FROM route a
JOIN route b
  ON ((a.company = b.company)
     AND
     (a.num = b.num))
JOIN stops stopa
  ON (stopa.id = a.stop)
JOIN stops stopb
  ON (stopb.id = b.stop)
WHERE
  (stopa.name = 'Craiglockhart')
AND
  (a.company = 'LRT')
ORDER BY stopb.name;
