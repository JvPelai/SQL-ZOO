--01.1
SELECT population FROM world
  WHERE name = 'Germany'

--01.2
SELECT name, population FROM world
  WHERE name IN ('Sweden','Norway','Denmark');

--01.3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

--01.2.01 Introduction
SELECT name, continent, population FROM world

--01.2.02 Large Countries
SELECT name FROM world
WHERE population > 200000000

--01.2.03 Per capita GDP
SELECT name,gdp/population FROM world
WHERE population > 200000000

--01.2.04 South America in millions
SELECT name, population/1000000 AS 'pop(millions)'FROM world
WHERE continent = 'South America'

--01.2.05 France, Germany,Italy
SELECT name, population FROM world
WHERE name IN ('France','Germany','Italy')

--01.2.06 United
SELECT name FROM world
WHERE name LIKE '%United%'

--01.2.07 Two ways to be big
SELECT name,population,area FROM world
WHERE area > 3000000 OR population > 250000000

--01.2.08 One or the other(exclusive)
SELECT name, population, area FROM world 
WHERE area > 3000000 XOR population > 250000000

--01.2.09 Rounding
SELECT name, ROUND(population/1000000,2),ROUND(gdp/1000000000,2) FROM world
WHERE continent = 'South America'

--01.2.10 Trillion dollar economies
SELECT name,ROUND(gdp/population,-3) FROM world
WHERE gdp > 1000000000000

--01.2.11 name and capital have the same length
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

--01.2.12 Matching name and capital
SELECT name,capital FROM world
WHERE LEFT(name,1) = LEFT(capital,1)
AND name <> capital

--01.2.13 Vowels
SELECT name FROM world
WHERE name NOT LIKE '% %' AND name LIKE '%u%' AND name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%'AND name LIKE '%o%'
