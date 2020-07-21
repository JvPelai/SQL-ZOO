--01 Bigger than Russia
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--02 Richer than UK
SELECT name FROM world
WHERE gdp/population >
(SELECT gdp/population FROM world WHERE name = 'United Kingdom')
AND Continent = 'Europe'

--03 Argentina and Australia Neighbours
SELECT name,continent FROM world
WHERE continent IN (SELECT continent FROM world WHERE Name IN ('Argentina','Australia'))

--04 Between Canada and Poland
SELECT name,population FROM world
WHERE population >
(SELECT population FROM world WHERE name = 'Canada')
AND population <
(SELECT population FROM world WHERE name = 'Poland')

--05 Percent of germany
SELECT 
  name,CONCAT(ROUND((population / (SELECT population FROM world WHERE name = 'germany')) * 100,0),'%')
FROM world
WHERE continent = 'europe';

--06 Bigger than every country in Europe
SELECT name FROM world WHERE gdp > (SELECT MAX(gdp)FROM world WHERE continent = 'Europe')

--07 Largest in each continent
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
--08 First country of each continent(alphabetically)
SELECT continent, name FROM world x 
WHERE name <= ALL(SELECT name FROM world y WHERE x.continent = y.continent)

