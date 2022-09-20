select * from noc_regions;
select * from athlete_events;

/* creating view of joining both table */
create view total_detail as
select ath.*, noc.region, noc.notes 
FROM athlete_events ath
left join noc_regions noc
on ath.noc = noc.noc;

/* Indian Athlete Detail */
select * from athlete_events
where team = 'India';

/* Top 10 countries participating */
select team, count(team) as Frequency
from athlete_events
group by team
order by count(team) desc
limit 10;

/* Winter Olympic Sports */
select Distinct(sport) from athlete_events
where season ='Winter';


/* Summer Olympic Sports */
select Distinct(sport) from athlete_events
where season ='Summer';


/* Name, Sex, Age, Sport, Season of Gold Medallist */
select name, sex, age, sport, season
from athlete_events
where medal = 'Gold';


/* Total number of female participation per year */
select year, count(sex) as total_female
from athlete_events
where sex = 'F' and season = 'Summer'
group by year;

/* Total number of male participation per year */
select year, count(sex) as total_male
from athlete_events
where sex = 'M' and season = 'Summer'
group by year;


/* Number of gold medals per country */
select noc.region, count(ath.medal) as gold_medals 
from athlete_events ath
join noc_regions noc
on ath.noc = noc.noc
where medal ='Gold'
group by noc.region
order by count(ath.medal) desc;

/* Multiple Gold Medallist */
select name, sex, team, sport, season, count(medal) as gold_medals
from athlete_events
where  medal = 'Gold'
group by name, sex, team, sport, season
having count(medal) > 1
order by count(medal) desc;


/* Number of olympic sport each olympic */
select year, season, count(distinct sport) as total_sport
from athlete_events
group by year, season
order by year;