-----------* Show all tables as a Unified Dataset *------------

SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$']

-----------* Find out Total Revenue Breakdown by Hotel type and Year-wise *------------
WITH hotels AS (
	SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$'])

SELECT
arrival_date_year,
hotel,
ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr),2)
AS Revenue
FROM hotels
GROUP BY arrival_date_year, hotel


-----------* Find out Total Revenue Breakdown by Hotel type and Year-wise *------------
WITH hotels AS (
	SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$'])
SELECT * FROM 
 hotels
 LEFT JOIN dbo.market_segment$
 ON hotels.market_segment = dbo.market_segment$.market_segment
 LEFT JOIN dbo.meal_cost$
 ON meal_cost$.meal = hotels.meal
