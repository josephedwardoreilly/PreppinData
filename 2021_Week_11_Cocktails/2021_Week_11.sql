-- Split recipes to ingredients
CREATE TEMP TABLE "ing" AS 
SELECT 
	"Cocktail",
	"Price (£)" AS cocktail_price,
    -- split and
    -- trim any trailing/leading whitespace
	TRIM(SPLIT_PART(split_string_separate, ':', 1)) AS "Ingredient",
    -- Trim any mention of 'ml', cast to float 
	TRIM(TRAILING 'ml' FROM SPLIT_PART(split_string_separate, ':', 2))::float AS volume
FROM
    -- Subquery to split cocktail ingredients over rows
	(SELECT 
		"Cocktail",
		"Price (£)",
     	-- Split the recipe into constituent parts
		UNNEST(STRING_TO_ARRAY("Recipe (ml)", ';')) AS split_string_separate
	FROM cocktail) AS tmp;


-- Calculate the price, in pounds, for each ingredient       
CREATE TEMP TABLE ing_price AS 
SELECT 
	sourcing.*,
    -- price per ml of ingredient, converted to pounds
	("Price" / "ml per Bottle") / conversion."Conversion Rate £" AS "conv_price"
FROM sourcing
LEFT JOIN "conversion"
ON sourcing."Currency"=conversion."Currency";
          
                          
-- Find the total cost of each cocktail and the profit margin           
SELECT 
	"Cocktail", 
    cocktail_price,
    cost, 
    -- Calculate profit margin
    -- Round only works on numeric type
	ROUND((cocktail_price - cost)::numeric, 2) AS margin
FROM (
  	-- Subquery to calculate cost of each cocktail based on 
  	-- the cost of individual ingredients and their required
  	-- volume in ml
	SELECT 
	ROUND(sum(volume * conv_price)::numeric, 2) AS cost,
	ing."Cocktail",
	ing.cocktail_price             
	FROM ing
	LEFT JOIN ing_price
	ON ing_price."Ingredient"=ing."Ingredient"
GROUP BY ing."Cocktail", ing.cocktail_price) AS tmp3;             
 