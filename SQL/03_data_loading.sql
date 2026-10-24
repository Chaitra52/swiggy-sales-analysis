

--INSERT DATA IN TABLES -- 


--dim date--

INSERT INTO dim_date(full_date, Year, Month, Month_name, Quarter, Day, Week)
select distinct 
order_date, 
Year(order_date), 
Month(order_date),
DATENAME(MONTH,order_date),
DATEPART(QUARTER,order_date),
Day(order_date),
DATEPART(Week, order_date)
FROM Swiggy_Data
where order_date is not null;

-- dim location -- 

INSERT INTO dim_location(state, city, location)
SELECT DISTINCT
state,
city,
location
from Swiggy_Data;

-- dim restaurant -- 

INSERT INTO dim_restaurant(restaurant_name)
SELECT DISTINCT 
Restaurant_name
from Swiggy_Data;

-- dim category -- 

INSERT INTO dim_category(category)
SELECT DISTINCT
 category
from Swiggy_Data

-- dim dish -- 

INSERT INTO dim_dish(dish_name)
SELECT DISTINCT
 Dish_name
from Swiggy_Data



-- INSERT INTO FACT TABLE -- 

INSERT INTO fact_swiggy_orders 
(
  date_id,
  Price_INR,
  Rating,
  Rating_count,
  location_id,
  restaurant_id,
  category_id,
  dish_id
)

SELECT 
  dd.date_id,
  s.Price_INR,
  s.Rating,
  s.rating_count,

  dl.location_id,
  dr.restaurant_id,
  dc.category_id,
  dsh.dish_id   
FROM Swiggy_Data s

JOIN dim_date dd on dd.Full_date = s.order_date

JOIN dim_location dl on dl.state = s.state
                  AND dl.city = s.city
                  AND dl.location = s.location

JOIN dim_restaurant dr ON dr.restaurant_name = s.Restaurant_Name

JOIN dim_category dc ON dc.category = s.Category

JOIN dim_dish dsh ON dsh.dish_name = s.Dish_Name


---DISPLAY ALL COULMNS IN OTHER TABLES INTO ONE ----

select * from fact_swiggy_orders f
JOIN dim_date d ON f.date_id = d.date_id
JOIN dim_location l ON f.location_id = l.location_id
JOIN dim_restaurant r ON f.restaurant_id = r.Restaurant_id
JOIN dim_category c ON f.category_id = c.category_id
JOIN dim_dish di ON f.dish_id = di.dish_id;

