create database house_price_db;
use house_price_db;
rename table house_price to houseprice;
select * from houseprice;
describe houseprice;
  -- Data cleaning using SQL-- 
  -- Check NULL Values
select * from houseprice where price='null';
  -- Remove Null Rows
delete from houseprice where price is null;
-- Average price by location
select 
round(avg(price),2) as `Average Price`,
city from houseprice group by city order by avg(price) desc;
-- Top 5 expensive areas
select 
round(avg(price),2) as `Average Price` 
from houseprice group by city order by avg(price) desc limit 5;
-- Price by Bedrooms
SELECT bedrooms,
    COUNT(*) AS total_houses,
    ROUND(AVG(price), 2) AS avg_price FROM houseprice 
    WHERE bedrooms IS NOT NULL GROUP BY bedrooms ORDER BY bedrooms;
    
-- City vise Price per SQFT
select city, price,sqft_living,round((price/sqft_living),2) as `Price Per Sqft` 
from houseprice where sqft_living>0;

-- Year Vise price Trend
select yr_built,round(avg(price),2) as `Avg Price` 
from houseprice group by yr_built order by yr_built;

-- Top 10 Expensive Houses
select price,sqft_living from houseprice order by price desc limit 10;

-- VIEWS
-- --1. avg_price_by_location
create view avg_price_by_location as select round(avg(price),2) as `Average Price` 
from houseprice group by city order by avg(price) desc;

-- --2.pric_by_bedrooms
create view price_by_bedrooms as SELECT 
bedrooms,COUNT(*) AS `Total Houses`,
ROUND(AVG(price), 2) AS avg_price FROM houseprice WHERE bedrooms IS NOT NULL 
GROUP BY bedrooms ORDER BY bedrooms;

-- --3. price_per_sqft
create view price_per_sqft as 
select city, price,sqft_living,round((price/sqft_living),2) as `Price Per Sqft` 
from houseprice where sqft_living>0;

-- --4. Year_Vice_price_trend 
create view Year_Vice_price_trend as select yr_built,round(avg(price),2) as `Avg Price` 
from houseprice group by yr_built order by yr_built;

-- --5.Top_10_expensive_houses
create view Top_10_expensive_houses as select price,sqft_living 
from houseprice order by price desc limit 10;
 




