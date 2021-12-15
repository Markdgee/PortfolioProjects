
--with popVvac 
--(continent, location, date, population,new_vaccinations, rolling_people_vaccinated)
--as(

CREATE view percent_population_vaccinated as
SELECT d.continent, d.location, d.date, d.population, v.new_vaccinations, 
SUM(convert(int, v.new_vaccinations)) OVER (partition by d.location order by d.location ,d.date)
as rolling_people_vaccinated
--,(rolling_people_vaccinated/population) * 100

FROM deaths d
join vaccination v
on d.location = v.location
AND d.date = v.date 
where d.continent IS NOT NULL
--)

--group by  d.location, d.date, d.continent,d.population, v.new_vaccinations)

--select *, (rolling_people_vaccinated/population)*100
--from popVvac
