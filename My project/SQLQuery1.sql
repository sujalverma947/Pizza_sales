create database pizza;
use pizza;
select * from pizza_sales;
select sum(total_price) as Total_revenue from pizza_sales;
select sum(total_price) / count(distinct order_id) as Avg_order_values from pizza_sales;
select sum(quantity) as Total_pizza_sales from pizza_sales;
select count(distinct order_id) as Total_orders from pizza_sales;
select sum(quantity) / count(distinct order_id)  as Avg_sales from pizza_sales;
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);
SELECT DATEPART(HOUR, order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time);
select pizza_category, sum(total_price) as Total_sales, sum(total_price) * 100/
(select sum(total_price) from pizza_sales where month(order_date)=1 ) as PCT
from pizza_sales where month(order_date) =1 group by pizza_category;

select pizza_size,Cast(sum(total_price) as decimal(10,2)) as Total_sales, Cast(sum(total_price) * 100/
(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT from pizza_sales group by
pizza_size order by PCT desc;

select pizza_category, sum(quantity) as Total_pizza_sales from pizza_sales 
group by pizza_category;

select top 5 pizza_name, sum(quantity) as Total_pizza_sold from pizza_sales group by
pizza_name order by Total_pizza_sold desc ; 

select top 5 pizza_name, sum(quantity) as Total_pizza_sold from pizza_sales 
where month(order_date) =8 group by pizza_name order by total_pizza_sold asc;