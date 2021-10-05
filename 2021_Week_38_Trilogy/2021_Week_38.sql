CREATE TEMP TABLE ordered AS (
SELECT 
*,
--Average rating within trilogy, spread across rows
AVG("Rating") 
  OVER(PARTITION BY "Trilogy Grouping") as avg_rating,
--max rating, as above
MAX("Rating") 
  OVER(PARTITION BY "Trilogy Grouping") as max_rating,
--Get the trilogy entry
SPLIT_PART("Number in Series", '/', 1) AS film_order,
SPLIT_PART("Number in Series", '/', 2) AS in_series
from films);

SELECT 
    trilogy_trim.*,
    round(tmp.avg_rating::numeric, 1), -- round the rating to 1dp
    tmp.film_order,
    tmp."Title",
    tmp."Rating",
    tmp.in_series
-- subquery to do the ranking
-- rank by average trilogy rating, break matches with maximum rating
-- within the trilogy
FROM (
  SELECT 
  	*,
  	DENSE_RANK() 
  		OVER(ORDER BY avg_rating DESC, max_rating DESC) AS rank
FROM ordered) as tmp
-- Join on the trilogies table, with the word trilogy stripped from titles
LEFT JOIN (
  SELECT 
  	TRIM("Trilogy", 'trilogy') as trilogy,
	"Trilogy Ranking"
FROM trilogies) as trilogy_trim
-- join on the ranking value from the two tables
ON tmp.rank=trilogy_trim."Trilogy Ranking"
-- Clean up ordering
ORDER BY "Trilogy Ranking";

