create database ecommerce;    -- 1. creating a new databse

use ecommerce;                 -- 2. importing ecommerce file and using 

desc users_data;              -- 3. running the sql command to see the table structure

select * from users_data
limit 100;                   -- 4. Run SQL command to select first 100 rows of the database 


select count(country),count(language) from users_data;    -- 5. How many distinct values exist in table for 
                                                           -- field country and language
                                                           
-- 6.Check whether male users are having maximum followers or female users
select gender, max(socialNBFollowers) as max_followers
from users_data
where gender IN ('M', 'F')
group by gender
order by max_followers desc
limit 10;

-- 7.	Calculate the total users those
-- a.	Uses Profile Picture in their Profile
select count(hasprofilepicture) profile from users_data;
-- b.	Uses Application for Ecommerce platform
select count(hasanyapp) application from users_data;
-- c.	Uses Android app
select count(hasAndroidapp) android from users_data;
-- d.	Uses ios app
select count(hasiosapp) ios from users_data;

-- 8. Calculate the total no of buyers for each country and sort result in desc order of total no of buyers
select country, count(productsBought) as total_buyer
from users_data
group by country
order by total_buyer desc;

-- 9.Calculate the total no of sellers for each country and sort the result in asce order of total no of sellers.
select country, count(productssold) as total_seller
from users_data
group by country
order by total_seller asc;

-- 10.	Display name of top 10 countries having maximum products pass rate
select country, max(productspassrate) as max_rate
from users_data
group by country
order by max_rate desc
limit 10;

-- 11.Calculate the number of users on an ecommerce platform for different language choices
select language, count(*)total_users from users_data
group by language
order by total_users;

-- 12.Check the choice of female users about putting the product in a wishlist or to like socially on an ecom platform
select sum(socialproductsliked) liked,sum(productswished) wished
from users_data
where gender = 'F';

-- 13.	Check the choice of male users about being seller or buyer
select count(gender)
from users_data
where gender ='M' = (select productssold >= productsbought);

-- 14.	Which country is having maximum number of buyers
select max(country)
from users_data
where productsbought = '1';

-- 15.	List the name of 10 countries having zero number of sellers
select distinct country from users_data
where productssold = '0'
limit 10;

-- 16.	Display record of top 110 users who have used ecommerce platform recently
select *from users_data
order by daysSincelastlogin desc
limit 110;

-- 17.	Calculate the number of female users those who have not logged in since last 100 days
select count(gender) from users_data
where gender = 'F'
and daysSincelastlogin > 100;

-- 18.	Display the number of female users of each country at ecommerce platform
select count(gender) female,country from users_data
where gender = 'F'
group by country;

-- 19.	Display the number of male users of each country at ecommerce platform
select count(gender) male,country from users_data
where gender = 'M'
group by country;

-- 20.	Calculate the average number of products sold and bought on ecommerce platform by male users for each country
select avg(productssold), avg(productsbought), country from users_data
where gender = 'M'
group by country;