

-- DATA VALIDATION AND CLEANING--


-- NULL CHECK --

SELECT 

  SUM(CASE WHEN State is null then 1 else 0 end) as null_state,
  SUM(case when city is null then 1 else 0 end) as null_city,
  SUM(case when Order_date is null then 1 else 0 end) as null_order_date,
  SUM(case when restaurant_name is null then 1 else 0 end) as null_restaurant_name,
  SUM(case when location is null then 1 else 0 end) as null_location,
  SUM(case when Category is null then 1 else 0 end) as null_category,
  SUM(case when Dish_Name is null then 1 else 0 end) as null_dishname,
  SUM(case when Price_INR is null then 1 else 0 end) as null_price_inr,
  SUM(case when Rating is null then 1 else 0 end) as null_rating,
  SUM(case when rating_count is null then 1 else 0 end) as null_rating_count
from Swiggy_Data;



--BLANK OR EMPTY STRINGS---

select * 
from Swiggy_Data
where state = '' or city = '' or restaurant_name = '' 



-- DUPLICATE RECORDS --

Select state, city, restaurant_name, location, category, order_date, Dish_name,Price_INR, Rating, rating_count, count(*) 
from Swiggy_Data
group by state, city, restaurant_name, location, category, order_date, Dish_name,Price_INR, Rating, rating_count
having count(*) > 1



-- DUPLICATE RECORDS DELETE --

with cte as (
select *, ROW_NUMBER() over ( partition by state, city, restaurant_name, location, category, order_date, 
Dish_name,Price_INR, Rating, rating_count 
order by (select null)
) as rn 
from Swiggy_Data
)
delete from cte where rn > 1;