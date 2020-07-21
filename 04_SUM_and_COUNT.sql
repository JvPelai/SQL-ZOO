--01 Total world population
SELECT SUM(population)
FROM world

--02 List of continents
SELECT DISTINCT continent FROM world

--03
SELECT SUM(gdp) FROM world
WHERE continent = 'Africa'

--04 Count the big countries
SELECT COUNT(*) from world
WHERE area >= 1000000

--05 Baltic states population
SELECT SUM(population) FROM world
WHERE name IN ('Estonia','Latvia','Lithuania')

--06 Counting the countries of each continent
SELECT continent, count(continent) FROM world
GROUP BY continent

--07 Counting big countries in each continent
SELECT continent, COUNT(continent) FROM world
WHERE population >= 10000000 GROUP BY continent

--08 Counting Big Continents
SELECT continent FROM world
GROUP BY continent HAVING SUM(population) >= 100000000

