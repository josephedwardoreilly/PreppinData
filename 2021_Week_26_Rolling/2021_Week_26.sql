-- Ensure the dates are in the correct order for individual locations
CREATE TEMP TABLE table2 AS (
  SELECT
  "Destination",
  "Revenue",
  TO_DATE("Date", 'DD/MM/YYYY') AS "Date"
FROM table1
ORDER BY "Destination", "Date" ASC);

-- Create a temporary table holding the values aggregated across all locations
CREATE TEMP TABLE table3 AS(
  SELECT 
  'All' AS "Destination",
  "Date",
  SUM("Revenue") AS "Revenue",
  AVG("Revenue") AS "Revenue_AVG"
FROM table2
GROUP BY "Date");

-- Query to return the rolling 7-day sum and averrage, using window functions
SELECT 
  "Destination",
  "Date",
  sum("Revenue") OVER(PARTITION BY "Destination" ORDER BY "Date" ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING) AS "Total_Revenue",
  ROUND(AVG("Revenue") OVER(PARTITION BY "Destination" ORDER BY "Date" ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING), 2) AS "Avg_Revenue"
FROM table2

UNION ALL -- UNION with total over all destinations to create a single table
SELECT 
  "Destination",
  "Date",
  sum("Revenue") OVER(PARTITION BY "Destination" ORDER BY "Date" ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING) AS "Total_Revenue",
  ROUND(AVG("Revenue_AVG") OVER(PARTITION BY "Destination" ORDER BY "Date" ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING), 2) AS "Avg_Revenue"
FROM table3;
