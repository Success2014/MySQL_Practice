--1 List each country name where the population is larger than 'Russia'.

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--2 Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
select name from world
where continent = 'Europe'
and gdp/population > 
(select gdp/population from world
where name = 'United Kingdom')

--3 List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

select name, continent from world
where continent in
(select continent from world 
where name in ('Argentina','Australia'))
order by name

--4 Which country has a population that is more than Canada but less than Poland? Show the name and the population.
select name, population from world
where 
population > (select population from world where name = 'Canada')
and 
population < (select population from world where name = 'Poland')

/*5 Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

Decimal places
You can use the function ROUND to remove the decimal places.
Percent symbol %
You can use the function CONCAT to add the percentage symbol.*/

select name, concat(round(population/
(select population from world where name = 'Germany')*100,0),'%')
from world
where continent = 'Europe'

--6 Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
select name
from world
where gdp > all 
(select gdp from world where gdp > 0 and continent = 'Europe')



/*We can refer to values in the outer SELECT within the inner SELECT. We can name the tables so that 
we can tell the difference between the inner and outer versions.*/

--7 Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area >0)


--8 List each continent and the name of the country that comes first alphabetically.
select continent, name from world x 
where name <= All
(select name from world y
where y.continent = x.continent)

