WITH 
-- Correctly formatted dishes data
dishes AS(
SELECT 
	"Pizza" As "Dish_Name",
    "Pizza ID" AS "dish_id",
    "Pizza Price" AS "Price",
    'Pizza' AS dish
FROM menu
WHERE "Pizza" IS NOT NULL
UNION ALL
SELECT 
	"Pasta" As "Dish_Name",
	"Pasta ID" AS "dish_id",
	"Pasta Price" AS "Price",
	'Pasta' AS dish
FROM menu
WHERE "Pasta" IS NOT NULL
UNION ALL
SELECT 
	"House Plates" As "Dish_Name",
	"House Plates ID" AS "dish_id",
	"House Plates Prices" AS "Price",
	'House Plate' AS dish
FROM menu
WHERE "House Plates" IS NOT NULL),

-- Correctly formated order data, JOINed onto the customer data 
"All_Orders" AS(
SELECT *
FROM dishes
JOIN (SELECT 
        "Customer Name",
        "Order_Date",
         EXTRACT('dow' FROM to_date("Order_Date", 'DD/MM/YYYY')) AS "dow",
        unnest(string_to_array("Customer_Order", '-')) AS "order_id"
      FROM orders) AS order_info
ON order_info.Order_ID=dishes.dish_id::text),

-- Discount applied on mondays (could have been done in an earlier step) 
"complete_prices" AS (SELECT *,
      CASE WHEN "dow"::varchar = '1' THEN "Price"::float/2
      ELSE "Price"
      END AS "Discount_Price"
FROM "All_Orders"),

-- Output 1, total sold by day of the week                         
"Output_1" AS (SELECT 
    "dow",
	sum("Discount_Price")
FROM "complete_prices"
GROUP BY "dow"), 

-- Summarise the number of orders per customer
"Loyal" AS (SELECT "Customer Name" , 
        COUNT("Customer Name")
from "complete_prices"
GROUP BY "Customer Name"),
 
 -- Select the customer(s) with the most orders (could have been a subquery)
"Output_2" AS (SELECT * FROM "Loyal" 
WHERE "count" = (SELECT max("count") FROM "Loyal"));


