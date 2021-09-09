-- Get the weekly mean, stdev, upper limit, lower limit, and limit width 
-- across all deparmtnets by week
-- Store as a temp table 
CREATE TEMPORARY TABLE summary AS (
  SELECT
    mean, 
    stdev, 
    "Week",
    mean + stdev AS ciu,
    mean - stdev AS cil,
    (mean + stdev) - (mean - stdev) AS variability
    -- Subquery to grab the mean and standard deviation of complaints
    -- across all departments by week
  FROM(
   SELECT
  	ROUND(AVG("Complaints"), 3) AS mean,
	  ROUND(STDDEV("Complaints"), 3) AS stdev,
	  "Week"
   FROM "complaints"
   GROUP BY  "Week") 
   -- subquery requires an alias
   AS tmpq);
   

-- Outliers at 1SD 
SELECT * 
FROM complaints
LEFT JOIN summary
ON complaints."Week"=summary."Week"
WHERE "Complaints" > "ciu" OR "Complaints" < "cil";
 
-- Outliers at 2SD 
SELECT * 
FROM complaints
LEFT JOIN summary
ON complaints."Week"=summary."Week"
WHERE "Complaints" > (mean + (stdev*2)) OR "Complaints" < (mean - (stdev*2));
          
-- Outliers at 3SD 
SELECT * 
FROM complaints
LEFT JOIN summary
ON complaints."Week"=summary."Week"
WHERE "Complaints" > (mean + (stdev*3)) OR "Complaints" < (mean - (stdev*3));