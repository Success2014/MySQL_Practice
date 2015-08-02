/*
The Table Tennis Olympics Database
The table ttms shows the Olympic medal winners for Table Tennis (Men's Singles). The country of each winner is given by a three letter code. 
To get the actual country name you must JOIN this table to the country table.

The two tables country and ttms are ONE TO MANY. One country has many winners, each winner has only one country.

<img src='pics/ttms.png'/>
ttms
games	color	who	country
1988	gold	Yoo Nam-Kyu	KOR
1988	silver	Kim Ki Taik	KOR
..	..	..	..
country
id	name
ALG	Algeria
ARG	Argentina
...	...
KOR	Korea
..	..

*/


/*
1. Show the athelete (who) and the country name for medal winners in 2000.

ttms(games,color,who,country)
country(id,name)   
*/
SELECT who, country.name
  FROM ttms JOIN country
         ON (ttms.country=country.id)
 WHERE games = 2000

/*
2. Show the who and the color of the medal for the medal winners from 'Sweden'.
*/
select who, color
from ttms join country
on ttms.country = country.id
where country.name = 'Sweden'


--3. Show the years in which 'China' won a 'gold' medal.
select games
from ttms join country
on ttms.country = country.id
where name = 'China' and color = 'gold'


/*
Women's Singles Table Tennis Olympics Database
The Summer Olympic games are held every four years in a different city. The table games shows which city the games were held in. The Women's Single's winners are in the table ttws.

<img src='pics/ttws.png'/>
ttws
games	color	who	country
1988	gold	Jing Chen	CHN
1988	silver	Li Hui-Fen	CHN
..	..	..	..
games
yr	city	country
1988	Seoul	KOR
1992	Barcelona	ESP
..	..	..


4.
Show who won medals in the 'Barcelona' games.


ttws(games,color,who,country)
games(yr,city,country)   

*/
SELECT who
  FROM ttws JOIN games
            ON (ttws.games=games.yr)
  WHERE city = 'Barcelona'


--5 Show which city 'Jing Chen' won medals. Show the city and the medal color.
select city, color
from ttws join games 
on ttws.games=games.yr
where who='Jing Chen'

--6 Show who won the gold medal and the city.
select who, city
from ttws join games
on ttws.games=games.yr
where color='gold'

/*
Table Tennis Mens Doubles
 The Table Tennis Mens Double teams are stored in the table team.
 Each team has an arbitrary number that is referenced from the table ttmd.
<img src='pics/ttmd.png'/>
ttmd
games	color	team	country
1988	gold	1	CHN
1988	silver	2	YUG
..	..	..	..
team
id	name
1	Long-Can Chen
1	Qing-Guang Wei
2	Ilija Lupulesku
2	Zoran Primorac
..	..

*/


/*
7.
Show the games and color of the medal won by the team that includes 'Yan Sen'.

ttmd(games,color,team,country)
team(id,,name)   
*/

select games, color
from ttmd join team 
on ttmd.team=team.id
where team.name='Yan Sen'

--8 Show the 'gold' medal winners in 2004.
select name 
from ttmd join team
on ttmd.team = team.id
where color='gold' and games=2004

--9 Show the name of each medal winner country 'FRA'.
select name
from ttmd join team
on ttmd.team = team.id
where country='FRA'







