CREATE TABLE cocktail (
  "Cocktail" VARCHAR(20),
  "Price (£)" FLOAT,
  "Recipe (ml)" VARCHAR(74)
);

INSERT INTO cocktail
  ("Cocktail", "Price (£)", "Recipe (ml)")
VALUES
  ('Raspberry Lemon Drop', '8.5', 'Citroen Vodka:45ml; Chambord:20ml; Triple Sec:20ml'),
  ('Bay Breeze', '7.2', 'Plain Vodka:60ml; Cranberry Juice:90ml; Pineapple Juice:30ml'),
  ('Alabama Slammer', '8.25', 'Southern Comfort:15ml; Sloe Gin:15ml; Amaretto:15ml; Orange Juice:120ml'),
  ('Watermelon Man', '7', 'Plain Vodka:60ml; Watermelon Schapps:30ml; Cointreau:30ml; Lime Soda:200ml'),
  ('Orange Blossom', '8.7', 'London Dry Gin:30ml; Cointreau:10ml; Orange Juice:30ml');

CREATE TABLE conversion (
  "Currency" VARCHAR(6),
  "Conversion Rate £" FLOAT
);

INSERT INTO conversion
  ("Currency", "Conversion Rate £")
VALUES
  ('Euro', '1.14'),
  ('Dollar', '1.38'),
  ('Pound', '1');

CREATE TABLE sourcing (
  "Ingredient" VARCHAR(18),
  "Price" FLOAT,
  "ml per Bottle" INTEGER,
  "Currency" VARCHAR(6)
);

INSERT INTO sourcing
  ("Ingredient", "Price", "ml per Bottle", "Currency")
VALUES
  ('Citroen Vodka', '19.25', '500', 'Euro'),
  ('Chambord', '22.85', '450', 'Euro'),
  ('Triple Sec', '12', '400', 'Dollar'),
  ('Plain Vodka', '15.24', '500', 'Euro'),
  ('Cranberry Juice', '1.33', '1000', 'Pound'),
  ('Pineapple Juice', '1.8', '1000', 'Pound'),
  ('Southern Comfort', '20.99', '750', 'Dollar'),
  ('Sloe Gin', '22.99', '500', 'Euro'),
  ('Amaretto', '16.6', '500', 'Euro'),
  ('Orange Juice', '1.42', '1000', 'Pound'),
  ('Watermelon Schapps', '19.79', '500', 'Euro'),
  ('Cointreau', '15.59', '500', 'Dollar'),
  ('Lime Soda', '0.98', '750', 'Pound'),
  ('London Dry Gin', '15.29', '750', 'Pound');