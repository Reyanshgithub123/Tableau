create database PizzaDB;
use PizzaDB;
select * from pizza_sales;
select sum(total_price) as Total_Revenue from pizza_sales;
select sum(total_price)/count(distinct order_id) as Average_Value from pizza_sales;
select sum(quantity) as Total_Pizzas from pizza_sales;
select count(distinct order_id) as Total_Orders from pizza_sales;
select sum(quantity)/count(distinct order_id) as Average_Pizza from pizza_sales;
SELECT HOUR(order_time) AS order_hours, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY 1
ORDER BY 1;
select week(STR_TO_DATE(order_date, '%d-%m-%Y')) as WeekNumber,year(STR_TO_DATE(order_date, '%d-%m-%Y')) as Year,
count(distinct order_id) as Total_Orders 
from pizza_sales
group by 2,1
order by 2,1;
SELECT pizza_category, SUM(total_price) AS total_revenue,
SUM(total_price) * 100 / NULLIF((SELECT SUM(total_price) FROM pizza_sales), 0) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_size, SUM(total_price) AS total_revenue,
SUM(total_price) * 100 / NULLIF((SELECT SUM(total_price) FROM pizza_sales), 0) AS PCT
FROM pizza_sales
GROUP BY pizza_size
order by PCT DESC;

select pizza_name,sum(total_price) as Revenue from pizza_sales
group by 1
order by 2 desc
limit 5;

select pizza_name,sum(total_price) as Revenue from pizza_sales
group by 1
order by 2 asc
limit 5;

select pizza_name,sum(quantity) as Revenue from pizza_sales
group by 1
order by 2 desc
limit 5;
select pizza_name,sum(quantity) as Revenue from pizza_sales
group by 1
order by 2 asc
limit 5;

select pizza_name,count(distinct order_id) as Revenue from pizza_sales
group by 1
order by 2 desc
limit 5;

select pizza_name,count(distinct order_id) as Revenue from pizza_sales
group by 1
order by 2 asc
limit 5;