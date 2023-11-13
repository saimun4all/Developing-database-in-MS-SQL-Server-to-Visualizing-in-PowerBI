-----------* Show all tables as a Unified Dataset *------------

SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$']

-----------* Find out Total Revenue Breakdown Year-wise *------------
WITH hotels AS (
	SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$'])

SELECT
arrival_date_year,
SUM((stays_in_weekend_nights + stays_in_week_nights)*adr)
AS Revenue
FROM hotels
GROUP BY arrival_date_year