--02.1.01 winners from 1950
SELECT yr, subject, winner FROM nobel
WHERE yr = 1950

 --02.1.02 Literature
 SELECT winner FROM nobel
 WHERE yr = 1962 AND subject = 'Literature'

 --02.1.03 Albert Eintein
SELECT yr,subject FROM nobel
WHERE winner = 'Albert Einstein'

 --02.1.04 Recent Peace Prizes
 SELECT winner FROM nobel
WHERE yr >= 2000 AND subject = 'Peace' 
 
 --02.1.05 Literature in the 80's
 SELECT yr, subject, winner FROM nobel
WHERE subject = 'Literature' AND yr >=1980 AND yr <=1989

 --02.1.06 Presidents
 SELECT yr,subject,winner FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                   'Barack Obama')
                  
 --02.1.07 John
 SELECT winner FROM nobel
WHERE winner LIKE 'John%'

 --02.1.08 Chemistry && Physics
 SELECT yr,subject,winner FROM nobel
WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = '1984'

 --02.1.09 Exclude Chemists and Medics
 SELECT yr,subject,winner FROM nobel 
WHERE  subject NOT IN ('Chemistry','Medicine') AND yr = 1980

 --02.1.10 Early Medicine, Late Literature
 SELECT yr, subject,winner FROM nobel
WHERE subject = 'Medicine' AND yr < 1910
OR subject = 'Literature' AND yr >= 2004

 --02.1.11
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG'

 --02.1.12 Apostrophe
 SELECT * FROM nobel 
WHERE winner LIKE '%Eugene O_Neill'

 --02.1.13
 SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner
