-- add an end date column
CREATE TEMP TABLE contract AS
SELECT 
"Name",
"Monthly Cost",
"Contract Length (months)",
TO_DATE("Start Date", 'DD/MM/YYYY') AS "Start Date",
TO_DATE("Start Date", 'DD/MM/YYYY') + "Contract Length (months)" * (INTERVAL '1 month') AS "End Date"
FROM phones;

-- cumsum over the rows, by Name
-- use a subquery to time slice the contract length
SELECT *
FROM
  (SELECT
  "Name", "Monthly Cost",
   -- build a row for each month of the contract
  GENERATE_SERIES("Start Date", "End Date", '1 month'::INTERVAL) AS "Payment Date"
  FROM 
  contract) AS sliced;
