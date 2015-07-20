--1
SELECT name, continent, population FROM world

/*2 Show the name for the countries that have a population of 
at least 200 million. 200 million is 200000000, there are eight zeros.*/
SELECT name FROM world
WHERE population>200000000


/*3 Give the name and the per capita GDP for those countries with a population of at least 200 million.*/
select name, gdp/population from world
where population >= 200000000


/*4.Show the name and population in millions for the countries of the continent 'South America'. 
Divide the population by 1000000 to get population in millions.*/
select name, population/1000000 from world
where continent = 'South America'

--5 Show the name and population for France, Germany, Italy
select name, population from world
where name in ('France','Germany','Italy')

--6 Show the countries which have a name that includes the word 'United'
select name from world
where name like 'United%' or name like '%United'

/*7 Two ways to be big: A country is big if it has an area of more than 3 million sq km or it 
has a population of more than 250 million. Show the countries that are big by area or big by population. 
Show name, population and area.*/
select name, population, area from world
where area > 3000000 or population > 250000000

/*8 USA and China are big in population and big by area. Exclude these countries.
Show the countries that are big by area or big by population but not both. Show name, population and area.*/
select name, population, area from world
where name not in ('United States', 'China','India') and ((area > 3000000) or (population > 250000000))

/*9 Show the name and population in millions and the GDP in billions for the countries of the continent 
'South America'. Use the ROUND function to show the values to two decimal places.
For South America show population in millions and GDP in billions to 2 decimal places.*/
select name, round(population/1000000,2), round(gdp/1000000000,2) from world
where continent = 'South America'

/*10 Show the per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; 
that is 12 zeros). Round this value to the nearest 1000.
Show per-capita GDP for the trillion dollar countries to the nearest $1000.*/
select name, round(gdp/population/1000)*1000 from world
where gdp > 1000000000000

/*11 The CASE statement shown is used to substitute North America for Caribbean in the third column.
Show the name and the continent - but substitute Australasia for Oceania - for countries beginning with N.*/
SELECT name, 
       CASE WHEN continent='Oceania' THEN 'Australasia'
            ELSE continent END
  FROM world
 WHERE name LIKE 'N%'

 /*12 Show the name and the continent - but substitute Eurasia for Europe and Asia; substitute 
 America - for each country in North America or South America or Caribbean. Show countries beginning 
 with A or B*/
select name,
case when continent='Asia'  then 'Eurasia'   
     when continent='Europe' then 'Eurasia'
     when continent='North America' or continent='South America' or continent='Caribbean' then 'America'  
     else continent 
end
from world
where name like 'A%' or name like 'B%'



/*13
Put the continents right...
Oceania becomes Australasia
Countries in Eurasia and Turkey go to Europe/Asia
Caribbean islands starting with 'B' go to North America, other Caribbean islands go to South America
Show the name, the original continent and the new continent of all countries. */














