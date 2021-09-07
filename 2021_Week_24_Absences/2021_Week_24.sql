-- Build a temp table covering all possible dates
CREATE TEMPORARY TABLE "days_all" AS
(SELECT day::date 
FROM   generate_series(timestamp '2021-04-01'
                     , timestamp '2021-05-31'
                     , interval  '1 day') AS day);

-- For each date, who is absent on that given date
CREATE TEMPORARY TABLE "days_off" AS 
(SELECT 
	"Name", 
  GENERATE_SERIES(
    TO_DATE("Start Date", 'DD/MM/YYYY'),
    TO_DATE("Start Date", 'DD/MM/YYYY') + "Days Off" * INTERVAL '1 day',
    INTERVAL '1 day') AS "absent_date"
FROM Reasons);

-- Merge all possible days with the absences
-- count the number of absences per date
SELECT 
  day, 
  COUNT(DISTINCT "Name") AS "number_absent"
FROM "days_all"
LEFT JOIN "days_off"
ON days_all.day = days_off.absent_date
GROUP BY "day";
