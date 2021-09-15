-- Union all the data 
CREATE TEMP TABLE stores AS
SELECT 
  *, 'leeds' AS location
FROM leeds
UNION ALL
SELECT 
  *, 'london' AS location
FROM london
UNION ALL
SELECT 
  *, 'manchester' AS location
FROM manchester
UNION ALL
SELECT 
  *, 'birmingham' AS location
FROM birmingham
UNION ALL
SELECT 
  *, 'york' AS location
FROM york;

-- split out the type of customer from the product they bought
CREATE TEMP TABLE stores_types AS
SELECT 
  "New - Saddles" AS "Saddles",
  "New - Mudguards" AS "Mudguards",
  "New - Wheels" AS "Wheels",
  "New - Bags" AS "Bags",
  'New' AS "Type",
  "Date",
  -- convert date to quarter
  EXTRACT('Quarter' FROM TO_DATE("Date", 'DD/MM/YYYY')) AS "Quarter",
  location
FROM stores
UNION ALL
SELECT 
  "Existing - Saddles" AS "Saddles",
  "Existing - Mudguards" AS "Mudguards",
  "Existing - Wheels" AS "Wheels",
  "Existing - Bags" AS "Bags",
  'Existing' AS "Type",
  "Date",
  -- convert date to quarter
  EXTRACT('Quarter' FROM TO_DATE("Date", 'DD/MM/YYYY')) AS "Quarter",
  location
FROM stores
;

-- Pivot the data to have a single product type column
CREATE TEMP TABLE pivot_stores AS
SELECT 
  "Saddles" AS "Sold",
  'Saddles' AS "Product",
  "Type",
  "Quarter",
  "location"
FROM stores_types
UNION ALL 
SELECT 
  "Mudguards" AS "Sold",
  'Mudguards' AS "Product",
  "Type",
  "Quarter",
  "location"
FROM stores_types
UNION ALL 
SELECT 
  "Bags" AS "Sold",
  'Bags' AS "Product",
  "Type",
  "Quarter",
  "location"
FROM stores_types
UNION ALL 
SELECT 
  "Wheels" AS "Sold",
  'Wheels' AS "Product",
  "Type",
  "Quarter",
  "location"
FROM stores_types;

-- Output 1 - sales by product and quarter
SELECT 
	"Product",
	"Quarter",
	SUM("Sold")
FROM pivot_stores
GROUP BY "Product", "Quarter"
ORDER BY "Product", "Quarter";

-- Output 2   - sales by location, product, and customer new/existing status                        
SELECT 
	"Product",
	"location",
    "Type",
	SUM("Sold")
FROM pivot_stores
GROUP BY "Product", "Type", "location"
ORDER BY "location", "Product";