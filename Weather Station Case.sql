/*Creating Database*/
create database weather;

/*Making the database default*/
use weather;

/*Task 1 - Create a table "STATION" to store information about weather observation stations*/
create table station (
	ID INT,
    CITY CHAR(20),  
    STATE CHAR(2),  
    LAT_N INT,  
    LONG_W INT,
    CONSTRAINT id_pk PRIMARY KEY (ID)
);
    
/*Task 2 - Insert records in table STATION*/
insert into station(id, city, state, lat_n, long_w)
values(13, "Phoenix", "AZ", 33, 112),
	  (44, "Denver", "CO", 40, 105),
      (66, "Caribou", "ME", 47, 68);

/*Task 3 - Display table STATION in undefined order*/
select id, city, state, lat_n, long_w 
from station;
/*OR*/
select * from station;

/*Task 4 - Select Northern stations (Northern latitude > 39.7)*/
select id, lat_n 
from station
where lat_n > 39.7;

/*Task 5 - Create another table "STATS" to store normalized temperature and precipitation data*/
create table stats (
	ID INT,
    MONTH INT,
    TEMP_F DECIMAL(5,1),
    RAIN_I DECIMAL(5,2),
    CONSTRAINT stats_fk FOREIGN KEY (ID) REFERENCES station (ID)
);

/*Task 6 - Populate the table STATS with some statistics for January and July*/
insert into stats(id, month, temp_f, rain_i)
values(13, 1, 57.4, .31),
	  (13, 7, 91.7, 5.15),
      (44, 1, 27.3, .18),
      (44, 7, 74.8, 2.11),
      (66, 1, 6.7, 2.1),
      (66, 7, 65.8, 4.52);

/*Task 7 - Display temperature stats (from STATS table) for each city (from STATION table)*/
select city, month, temp_f
from station inner join stats using(ID);
/*OR*/
select city, round(avg(temp_f), 1) as temp
from station inner join stats using(ID)
group by city;

/*Task 8 - Display the table STATS, ordered by month and greatest rainfall, with columns rearranged.
It should also show the corresponding cities*/
select s.id, s.city, st.month, st.temp_f, st.rain_i
from station s inner join stats st using(ID)
order by month asc, rain_i desc;

/*Task 9 - Display the temperatures for July from table STATS, lowest temperatures first, picking up city name and latitude*/
select temp_f, city, lat_n 
from stats inner join station using(ID)
where month = 7
order by temp_f asc;

/*Task 10 - Show the MAX and MIN temperatures as well as average rainfall for each city*/
select city, max(temp_f) as MaxTemp, min(temp_f) as MinTemp, round(avg(rain_i), 2) as AvgRainfall
from station inner join stats using(ID)
group by city;

/*Task 11 - Display each city’s monthly temperature in Celcius and rainfall in Centimeter*/
select city, month, round(5/9*(temp_f-32), 2) as TempInCelcius, round(rain_i*2.54, 2) as RainfallInCentimeter
from station inner join stats using(ID);

/*Task 12 - Update all rows of table STATS to compensate for faulty rain gauges known to read 0.01 inches low*/
SET SQL_SAFE_UPDATES = 0;
update stats
set rain_i = rain_i + 0.01;

/*Task 13 - Update Denver's July temperature reading as 74.9*/
update stats
set temp_f = 74.9 
where month = 7 and ID IN (select ID from station where city = "Denver");