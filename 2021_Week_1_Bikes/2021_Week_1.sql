SELECT  
	SPLIT_PART("Store_Bike", ' - ', 2) AS "Bike",
	SPLIT_PART("Store_Bike", ' - ', 1) AS "Store",
  EXTRACT('Day' FROM TO_DATE("Date", 'DD/MM/YYY')) AS "DOM",
  EXTRACT('Quarter' FROM TO_DATE("Date", 'DD/MM/YYY')) AS "Quarter",
  "Order ID",
	"Customer Age",
	"Bike Value",
	"Existing Customer?"
FROM 
	bikes
WHERE 
	SPLIT_PART("Store_Bike",' - ',2) IN('Mountain', 'Gravel', 'Road')
    AND "Order ID" > 10
;