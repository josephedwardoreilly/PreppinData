-- Table 1 
-- CTE with required order info 
WITH orders AS(
select REGEXP_REPLACE("Model", '\d|\/', '', 'g') AS "Brand",
	   "Value per Bike" * "Quantity" AS Value,
  		*
FROM bikes)

-- aggregated outputs 
SELECT 
	"Bike Type", "Brand",
	sum(value) AS "Order_Value",
	sum("Quantity") AS "Quantity_Sold",
    sum(value)/sum("Quantity") AS "Avg_Bike_Value_per_Brand"
FROM orders
GROUP BY "Bike Type", "Brand"
;

-- Table 2 
-- CTE with required order info 
WITH orders AS(
select REGEXP_REPLACE("Model", '\d|\/', '', 'g') AS "Brand",
	   "Value per Bike" * "Quantity" AS "Value",
  		to_date("Shipping Date", 'DD/MM/YYYY') - to_date("Order Date",'DD/MM/YYYY') AS "Days_to_Ship",
  		"Store", "Quantity"
FROM bikes)

-- aggregated outputs 
SELECT 
	"Brand", 
    "Store",
	ROUND(AVG("Days_to_Ship"), 1) AS "Avg_Days_to_Ship",
	SUM("Value") AS "Total_Order_Value",
	SUM("Quantity") AS "Total_Quantity_Sold"
FROM orders
GROUP BY "Brand", "Store"
;
