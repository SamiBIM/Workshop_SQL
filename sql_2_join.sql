# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
select name from city where name LIKE "ping%" order by population ASC; 
#
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
select name from city where name LIKE "ran%" order by population desc;
#
# 3: Count all cities
select count(name) from city;
#
# 4: Get the average population of all cities
SELECT AVG(population) FROM city;
#
# 5: Get the biggest population found in any of the cities
select MAX(Population) from city;
#
# 6: Get the smallest population found in any of the cities
select MIN(Population) from city;

#
# 7: Sum the population of all cities with a population below 10000
select SUM(population) from city where population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
select COUNT(name) from city where CountryCode IN ('MOZ','VNM');
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
select CountryCode, count(*) from city where countrycode IN ('MOZ','VNM') group by countrycode;
#
# 10: Get average population of cities in MOZ and VNM
select AVG(population) from city where CountryCode IN ('MOZ','VNM');
#
# 11: Get the countrycodes with more than 200 cities
select countrycode from city GROUP BY countrycode having COUNT(*) > 200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
select countrycode from country where city;
select * from city;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
select cl.LANGUAGE from countrylanguage cl join country c on cl. CountryCode=c.Code where c.Population between 400 and 500; 
#
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
select c.name, l.language from city c 
join countrylanguage cl on c.CountryCode=cl.CountryCode 
join language l on cl.Language=l.Language
where c.Population between 500 and 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
select c.name, c.Population from city c where c.CountryCode= (select countrycode from city where population = 122199);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
select c.name, c.Population from city c where c.CountryCode= (select countrycode from city where population = 122199) and c.population!=122199;
#
# 17: What are the city names in the country where Luanda is capital?
select c.name from city c where c.CountryCode = (select CountryCode from city where name = 'Luanda');
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
select c.name from city c 
JOIN country co ON c.CountryCode=co.Capital
where co.Region = (select region from country where code = (select countrycode from city where name = 'Yaren'));
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
select DISTINCT l.language from city c 
join country con ON c.countrycode = con.code 
join countrylanguage cl ON con.code = cl.countrycode 
join language l ON cl.language = l.language 
where con.region = (select region from country where code = (select countrycode from city where name = 'Riga'));
#
# 20: Get the name of the most populous city
select name from city order by population desc limit 1;
