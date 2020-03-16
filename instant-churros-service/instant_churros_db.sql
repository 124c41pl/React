USE instantchurros;
CREATE TABLE MenuItem (
  menu_item_id INT NOT NULL, 
  menu_item_name VARCHAR(255),
  date_created DATETIME, 
  date_maint DATETIME, 
  disabled BIT, 
  PRIMARY KEY (menu_item_id)
);
CREATE TABLE MenuItemPrice (
  menu_item_price_id INT NOT NULL, 
  menu_item_id INT,
  menu_item_price DECIMAL(6, 2),
  meal_combo_id INT,
  market_id INT, 
  date_created DATETIME,
  date_maint DATETIME,
  disabled BIT, 
  CONSTRAINT FOREIGN KEY (menu_item_id) REFERENCES MenuItem(menu_item_id) ON DELETE RESTRICT
);

CREATE TABLE Promotions (
  promotion_id INT NOT NULL, 
  promotion_code VARCHAR(255), 
  market_id INT, 
  meal_combo_id INT, 
  menu_item_id INT, 
  flat_percentage BIT, 
  flat_value BIT, 
  promotion_rate DECIMAL (6, 2), 
  promotion_begin_date DATETIME, 
  promotion_end_date DATETIME,
  date_created DATETIME,
  date_maint DATETIME,
  disabled BIT
);

CREATE TABLE NutritionData -- unit of measurement is grams.
(
  nutrition_data_id INT NOT NULL, 
  menu_item_id INT, 
  betaine DECIMAL(10, 6), 
  calcium DECIMAL(10, 6), 
  calories DECIMAL(10, 6), 
  carbohydrates DECIMAL(10, 6), 
  cholesterol DECIMAL(10, 6), 
  choline DECIMAL(10, 6), 
  colate DECIMAL(10, 6), 
  copper DECIMAL(10, 6), 
  fiber DECIMAL(10, 6), 
  fluoride DECIMAL(10, 6), 
  iron DECIMAL(10, 6), 
  magnesium DECIMAL(10, 6), 
  manganese DECIMAL(10, 6), 
  niacin DECIMAL(10, 6), 
  pantothenic_acid DECIMAL(10, 6), 
  phosphorus DECIMAL(10, 6), 
  potassium DECIMAL(10, 6), 
  protein DECIMAL(10, 6), 
  riboflavin DECIMAL(10, 6), 
  saturated_fat DECIMAL(10, 6), 
  selenium DECIMAL(10, 6), 
  sodium DECIMAL(10, 6), 
  sugar DECIMAL(10, 6), 
  thiamin DECIMAL(10, 6), 
  transfat DECIMAL(10, 6), 
  vitamin_a DECIMAL(10, 6), 
  vitamin_b12 DECIMAL(10, 6), 
  vitamin_b6 DECIMAL(10, 6), 
  vitamin_c DECIMAL(10, 6), 
  vitamin_e DECIMAL(10, 6), 
  vitamin_k DECIMAL(10, 6), 
  zinc DECIMAL(10, 6), 
  date_created DATETIME,
  date_maint DATETIME,
  disabled BIT
);
CREATE TABLE Market (
  market_id INT NOT NULL, 
  city VARCHAR(255), 
  state VARCHAR(2), 
  zipcode INT, 
  country VARCHAR(255),
  date_created DATETIME,
  date_maint DATETIME
);
CREATE TABLE Location (
  location_id INT NOT NULL, 
  market_id INT, 
  address_1 VARCHAR(255), 
  address_2 VARCHAR(255), 
  city VARCHAR(255), 
  state VARCHAR(255), 
  zip INT, 
  country VARCHAR(255), 
  phone VARCHAR (20),
  date_created DATETIME,
  date_closed DATETIME,
  date_maint DATETIME,
  disabled BIT
);
CREATE TABLE Orders (
  order_id INT NOT NULL, 
  sales_tax DECIMAL(5, 2) CHECK (
    sales_tax >=.01 
    AND sales_tax <= 100
  ),
  location_id INT,
  order_date DATETIME,
  date_maint DATETIME
);
CREATE TABLE OrderItem (
  order_id INT NOT NULL, 
  item_id INT,
  current_price DECIMAL(6, 2)
);
