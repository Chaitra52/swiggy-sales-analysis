

-- CREATING SCHEMA --

-- DIMENSION TABLES -- 

-- DATE TABLE --

CREATE TABLE dim_date (
date_id INT IDENTITY(1,1) PRIMARY KEY,
Full_date DATE,
Year INT,
Month INT,
Month_name varchar(20),
Quarter INT,
Day INT,
Week INT
)


--DIM LOCATION --

CREATE TABLE dim_location (
location_id INT IDENTITY(1,1) PRIMARY KEY,
state varchar(100),
city varchar(100),
location varchar(200)
);


-- DIM RESTAURANT -- 

CREATE TABLE dim_restaurant (
Restaurant_id INT IDENTITY(1,1) PRIMARY KEY,
restaurant_name varchar(200)
)

-- DIM CATEGORY --

CREATE TABLE dim_category (
category_id INT IDENTITY(1,1) PRIMARY KEY,
category varchar(200)
)

-- DIM DISH -- 

CREATE TABLE dim_dish (
dish_id INT IDENTITY(1,1) PRIMARY KEY,
dish_name varchar(200)
)


-- FACT TABLE -- 

CREATE TABLE fact_swiggy_orders (
order_id INT IDENTITY(1,1) PRIMARY KEY,

date_id INT,
Price_INR decimal(10,2),
Rating decimal(4,2),
Rating_count INT,

location_id INT,
restaurant_id INT,
category_id INT,
dish_id INT,

FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
FOREIGN KEY (restaurant_id) REFERENCES dim_restaurant(restaurant_id),
FOREIGN KEY (category_id) REFERENCES dim_category(category_id),
FOREIGN KEY (dish_id) REFERENCES dim_dish(dish_id)

)
