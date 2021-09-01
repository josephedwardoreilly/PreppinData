CREATE TABLE menu (
  "Pizza" VARCHAR(20),
  "Pizza Price" INTEGER,
  "Pizza ID" INTEGER,
  "Pasta" VARCHAR(24),
  "Pasta Price" INTEGER,
  "Pasta ID" INTEGER,
  "House Plates" VARCHAR(22),
  "House Plates Prices" INTEGER,
  "House Plates ID" INTEGER
);

INSERT INTO menu
  ("Pizza", "Pizza Price", "Pizza ID", "Pasta", "Pasta Price", "Pasta ID", "House Plates", "House Plates Prices", "House Plates ID")
VALUES
  ('Margherita', '10', '10101', 'Top Truffle Tagliatelle', '14', '20101', 'house fried chicken', '11', '30113'),
  ('Vegan Viking', '13', '10102', 'Rock Star Rigatoni', '15', '20102', 'vegan fried chicken', '11', '30112'),
  ('green god', '12', '10103', 'Slow Beef Rigatoni', '14', '20103', 'feta &watermelon salad', '12', '30111'),
  ('rock star margherita', '13', '10104', 'Spicy Ragu Tagliatelle', '12', '20104', 'fried chicken salad', '12', '30110'),
  ('samson', '14', '10105', 'Beetroot Gnocchi (Vegan)', '13', '20105', NULL, NULL, NULL),
  ('london field', '14', '10106', 'Chefs Meatballs', '11', '20106', NULL, NULL, NULL),
  ('the hot don', '15', '10107', NULL, NULL, NULL, NULL, NULL, NULL),
  ('Truffle Hound', '14', '10108', NULL, NULL, NULL, NULL, NULL, NULL),
  ('Bianco', '12', '10109', NULL, NULL, NULL, NULL, NULL, NULL),
  ('Smokey Bandit', '13', '10110', NULL, NULL, NULL, NULL, NULL, NULL);

CREATE TABLE orders (
  "Customer Name" VARCHAR(19),
  "Order Date" VARCHAR(10),
  "Customer_Order" VARCHAR(23)
);

INSERT INTO orders
  ("Customer Name", "Order Date", "Customer_Order")
VALUES
  ('Sallyanne Antonsen', '23/02/2020', '10101-30111-20104'),
  ('Mordecai Lehrle', '10/02/2021', '20105-30112-10109-30111'),
  ('Bee Masser', '23/12/2020', '20103-10103'),
  ('Casey Ballintyne', '20/04/2020', '10107'),
  ('Hadrian Rizzolo', '30/12/2020', '20102-20104'),
  ('Leonidas Jackalin', '06/06/2020', '30113-10108'),
  ('Barnett Hambling', '30/10/2020', '30113-20105-20104'),
  ('Osbert Sandercock', '31/08/2020', '10102'),
  ('Nikoletta Turle', '10/05/2020', '20105'),
  ('Elfrida Syrett', '25/09/2020', '20106-30113-30111'),
  ('Lexi Summerell', '12/01/2021', '20105-10105'),
  ('Burke Joscelyn', '16/08/2020', '30113-10108'),
  ('Wenda Beese', '14/04/2020', '30113-10105-10107'),
  ('Kerrill De Witt', '29/02/2020', '30112'),
  ('Nalani Danet', '15/02/2020', '30111-20101'),
  ('Janifer Cabel', '05/03/2020', '30110'),
  ('Renato Jerrems', '11/05/2020', '30113-20106-10108'),
  ('Kelwin Kincey', '11/08/2020', '30112'),
  ('Frederick Artindale', '12/03/2020', '30111'),
  ('Dionisio Youthead', '09/02/2021', '30110'),
  ('Alys Ball', '12/03/2020', '20105'),
  ('Joey Marciskewski', '21/10/2020', '20106'),
  ('Brant Clines', '19/07/2020', '30113-10108'),
  ('Rahel Backe', '28/04/2020', '30113'),
  ('Carver McCorry', '11/04/2020', '10102'),
  ('Farris Nend', '11/07/2020', '10108'),
  ('Brenden Ventom', '27/07/2020', '10104'),
  ('Jenny Guiraud', '02/05/2020', '30110'),
  ('Marabel Rubinlicht', '13/11/2020', '10106'),
  ('Robbyn Dinsmore', '15/09/2020', '10107-30112'),
  ('Maria Lenden', '26/08/2020', '10108-10109-20104'),
  ('Thalia Menichelli', '11/12/2020', '10108'),
  ('Leonore Heater', '15/06/2020', '10104'),
  ('Vaclav Spinige', '19/08/2020', '30110'),
  ('Lewiss Skeene', '19/02/2020', '10106-20105'),
  ('Mata McKeighen', '16/07/2020', '10107-30112'),
  ('Aidan Keems', '19/05/2020', '10108'),
  ('Blondell Ringham', '30/09/2020', '10109-30111'),
  ('Neilla Scott', '16/06/2020', '10110'),
  ('Cesare Matuszyk', '17/10/2020', '20104-10104-30113');