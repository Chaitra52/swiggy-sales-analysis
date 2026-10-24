---KPI DEVELOPMENT----

-- TOTAL ORDERS--
select count(*) as total_orders 
from fact_swiggy_orders

-- TOTAL REVENUE (INR MILLION)
select 
FORMAT(SUM(convert(float,price_INR))/1000000,'N2') + ' INR Million' as total_revenue
from fact_swiggy_orders

-- AVERAGE DISH PRICE --
select
FORMAT(avg(convert(float,price_INR)),'N2') + ' INR million' as avg_dish_price
from fact_swiggy_orders;

--AVERAGE RATING---
select AVG(rating) as avg_rating
from fact_swiggy_orders



---DEEP DIVE INTO BUSINESS ANALYSIS----

---MONTHLY ORDER TRENDS---
select
d.year,
d.month,
d.month_name,
count(*) as total_orders
from fact_swiggy_orders f
JOIN dim_date d ON f.date_id=d.date_id
group by d.year,
d.month,
d.month_name
order by total_orders desc


---Quarterly trend---
select 
d.year,
d.quarter,
count(*) as total_orders
from fact_swiggy_orders f 
JOIN dim_date d ON f.date_id = d.date_id
group by d.year, d.Quarter
order by total_orders desc

---YEARLY TRENDS---
select
d.year,
count(*) as total_orders
from fact_swiggy_orders f
JOIN dim_date d ON f.date_id = d.date_id
group by d.year
order by total_orders


--- ORDERS BY DAY OF WEEK (MON-SUN)---
select 
DATENAME(weekday, d.full_date) as day_name,
count(*) as total_orders 
from fact_swiggy_orders f
JOIN dim_date d ON f.date_id = d.date_id
group by DATENAME(weekday, d.full_date), DATEPART(weekday, d.full_date)
order by DATEPART(weekday, d.full_date)


--TOP 10 CITIES BY ORDER VOLUME---
select TOP 10
l.city,
count(*) as total_orders
from fact_swiggy_orders f
JOIN dim_location l ON f.location_id = l.location_id
group by l.city
order by total_orders desc


---TOP 10 CITIES BY REVENUE--
select TOP 10
l.city,
SUM(price_INR) as total_revenue
from fact_swiggy_orders f
JOIN dim_location l ON f.location_id = l.location_id
group by l.city
order by total_revenue desc


---REVENUE CONTRIBUTION BY STATES--
select 
l.state,
SUM(f.price_INR) as total_revenue
from fact_swiggy_orders f
JOIN dim_location l ON f.location_id = l.location_id
group by l.state
order by total_revenue desc


---TOP 10 RESTAURANTS BY ORDERS--
select TOP 10
r.restaurant_name,
sum(f.price_INR) as total_revenue 
from fact_swiggy_orders f 
JOIN dim_restaurant r ON r.Restaurant_id = f.restaurant_id
group by r.restaurant_name
order by total_revenue desc


---TOP CATEGORIES BY ORDER VOLUME---
select 
c.category,
count(*) as total_orders
from fact_swiggy_orders f
JOIN dim_category c ON c.category_id = f.category_id
group by c.category
order by total_orders desc


---MOST ORDERED DISHES---
select 
d.dish_name,
count(*) as total_orders
from fact_swiggy_orders f
JOIN dim_dish d ON d.dish_id = f.dish_id
group by d.dish_name
order by total_orders desc


---CUISINE PERFORMANCE (ORDERS + AVG RATING) ---
Select 
c.category,
count(*) as total_orders,
avg(f.rating) as avg_rating
from fact_swiggy_orders f
JOIN dim_category c ON f.category_id = c.category_id 
group by c.category
order by total_orders desc;



---TOTAL ORDERS BY PRICE RANGE ---

select 
   case 
       when(price_inr)  < 100 then 'under 100'
       when(price_inr)  between 100 and 199 then '100-199'
       when(price_inr)  between 200 and 299 then '200-299'
       when(price_inr)  between 300 and 499 then '300-499'
       else '500+'
    end as price_range,
    count(*) as total_orders
from fact_swiggy_orders
group by 
   case 
       when(price_inr)  < 100 then 'under 100'
       when(price_inr)  between 100 and 199 then '100-199'
       when(price_inr)  between 200 and 299 then '200-299'
       when(price_inr)  between 300 and 499 then '300-499'
       else '500+'
    end
order by total_orders desc



