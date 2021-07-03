--Merge 12 month of data 
WITH CTE_BIKE AS
(SELECT *
FROM[202004-divvy-tripdata]
UNION ALL
SELECT * 
FROM['202005-divvy-tripdata']
UNION ALL
SELECT *
FROM['202006-divvy-tripdata']
UNION ALL
SELECT *
FROM['202007-divvy-tripdata']
UNION ALL
SELECT * 
FROM['202008-divvy-tripdata']
UNION ALL
SELECT * 
FROM['202009-divvy-tripdata']
UNION ALL
SELECT *
FROM['202010-divvy-tripdata']
UNION ALL
SELECT * 
FROM['202011-divvy-tripdata']
UNION ALL
SELECT * 
FROM['202012-divvy-tripdata']
UNION ALL
SELECT *
FROM[202101-divvy-tripdata]
UNION ALL
SELECT * 
FROM[202102-divvy-tripdata]
UNION ALL
SELECT * 
FROM[202103-divvy-tripdata]
)
-- distinct value of max, mean ,count of ride_length 
--SELECT DISTINCT ROUND(AVG(CAST(ride_length as int)/60),2) AS avg_ride_length,
--MAX(ride_length) as max_ride_length, COUNT(*) num_trips, member_casual 
--from CTE_BIKE
--where  ride_length is not null
--group by member_casual
--order by num_trips

--Bike usage by month and memebers and casual users
select distinct member_casual,(DATENAME(MONTH,started_at)) AS month,
count(*) as num_trips
FROM  CTE_BIKE
group by  member_casual, started_at
order by num_trips desc