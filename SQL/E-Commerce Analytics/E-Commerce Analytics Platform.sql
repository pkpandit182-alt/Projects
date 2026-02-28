-- ============================================
-- SQL PROJECT: E-Commerce Analytics Platform
-- ============================================
-- LEARNING OBJECTIVES:
-- 1. Complex JOINs and subqueries
-- 2. Window functions and ranking
-- 3. CTEs (Common Table Expressions)
-- 4. Date/time manipulation
-- 5. Aggregations and grouping
-- 6. Query optimization
-- ============================================

-- SAMPLE DATA CREATION
-- ============================================

-- Create tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    registration_date DATE,
    country VARCHAR(50),
    customer_segment VARCHAR(20)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    unit_price DECIMAL(10,2),
    supplier_id INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    discount DECIMAL(5,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data
INSERT INTO customers VALUES
(1, 'John Smith', 'john.smith@email.com', '2023-01-15', 'USA', 'Premium'),
(2, 'Emma Wilson', 'emma.w@email.com', '2023-02-20', 'UK', 'Standard'),
(3, 'Carlos Rodriguez', 'carlos.r@email.com', '2023-01-10', 'Spain', 'Premium'),
(4, 'Li Wei', 'li.wei@email.com', '2023-03-05', 'China', 'Standard'),
(5, 'Sarah Johnson', 'sarah.j@email.com', '2023-02-15', 'USA', 'Premium'),
(6, 'Ahmed Hassan', 'ahmed.h@email.com', '2023-04-01', 'UAE', 'Standard'),
(7, 'Marie Dubois', 'marie.d@email.com', '2023-01-25', 'France', 'Premium'),
(8, 'Yuki Tanaka', 'yuki.t@email.com', '2023-03-15', 'Japan', 'Standard'),
(9, 'Anna Kowalski', 'anna.k@email.com', '2023-02-28', 'Poland', 'Standard'),
(10, 'Michael Brown', 'michael.b@email.com', '2023-01-20', 'Canada', 'Premium');

INSERT INTO products VALUES
(101, 'Laptop Pro 15', 'Electronics', 'Computers', 1299.99, 1),
(102, 'Wireless Mouse', 'Electronics', 'Accessories', 29.99, 1),
(103, 'Office Chair Deluxe', 'Furniture', 'Chairs', 349.99, 2),
(104, 'Standing Desk', 'Furniture', 'Desks', 599.99, 2),
(105, 'USB-C Hub', 'Electronics', 'Accessories', 49.99, 1),
(106, 'Monitor 27"', 'Electronics', 'Displays', 399.99, 1),
(107, 'Bookshelf Oak', 'Furniture', 'Storage', 199.99, 2),
(108, 'Mechanical Keyboard', 'Electronics', 'Accessories', 129.99, 1),
(109, 'Desk Lamp LED', 'Office Supplies', 'Lighting', 45.99, 3),
(110, 'Notebook Set', 'Office Supplies', 'Stationery', 19.99, 3);

INSERT INTO orders VALUES
(1001, 1, '2024-01-05', '2024-01-08', 'Express'),
(1002, 2, '2024-01-07', '2024-01-12', 'Standard'),
(1003, 3, '2024-01-10', '2024-01-13', 'Express'),
(1004, 1, '2024-01-15', '2024-01-20', 'Standard'),
(1005, 4, '2024-01-18', '2024-01-25', 'Standard'),
(1006, 5, '2024-01-20', '2024-01-23', 'Express'),
(1007, 2, '2024-01-25', '2024-01-30', 'Standard'),
(1008, 6, '2024-02-01', '2024-02-06', 'Standard'),
(1009, 7, '2024-02-05', '2024-02-08', 'Express'),
(1010, 3, '2024-02-10', '2024-02-15', 'Standard'),
(1011, 8, '2024-02-12', '2024-02-17', 'Standard'),
(1012, 5, '2024-02-15', '2024-02-18', 'Express'),
(1013, 9, '2024-02-20', '2024-02-25', 'Standard'),
(1014, 10, '2024-02-22', '2024-02-25', 'Express'),
(1015, 1, '2024-03-01', '2024-03-06', 'Standard');

INSERT INTO order_items VALUES
(1, 1001, 101, 1, 0.00),
(2, 1001, 102, 2, 0.10),
(3, 1002, 103, 1, 0.05),
(4, 1002, 109, 1, 0.00),
(5, 1003, 104, 1, 0.15),
(6, 1003, 106, 1, 0.10),
(7, 1004, 102, 3, 0.20),
(8, 1004, 105, 1, 0.00),
(9, 1005, 110, 5, 0.10),
(10, 1006, 101, 1, 0.05),
(11, 1006, 108, 1, 0.05),
(12, 1007, 107, 2, 0.10),
(13, 1008, 109, 2, 0.15),
(14, 1009, 106, 2, 0.20),
(15, 1009, 105, 2, 0.10),
(16, 1010, 103, 1, 0.00),
(17, 1011, 110, 3, 0.05),
(18, 1012, 104, 1, 0.10),
(19, 1013, 102, 1, 0.00),
(20, 1013, 108, 1, 0.15),
(21, 1014, 101, 2, 0.10),
(22, 1015, 106, 1, 0.00);

-- ============================================
-- PROJECT TASKS
-- ============================================

-- TASK 1: Revenue Analysis
-- Calculate total revenue, average order value, and total orders per customer segment
-- Include discount impact analysis😕😕

-- YOUR SOLUTION HERE
--Ans.
select c.customer_segment, round(sum(p.unit_price * oi.quantity),2) as Total_Revenue, 
round(sum(p.unit_price * oi.quantity)/count(oi.order_id),2) as Average_Order_Value,
round(sum((p.unit_price * oi.quantity)* oi.discount),2) as Discount,
round((sum(p.unit_price * oi.quantity)) - (sum((p.unit_price * oi.quantity)* oi.discount)), 2) as Total_Revenue_with_Discount,
ROUND(((SUM(p.unit_price * oi.quantity)- SUM((p.unit_price * oi.quantity) * oi.discount))
    - SUM(p.unit_price * oi.quantity)) / SUM(p.unit_price * oi.quantity) * 100,2) AS Revenue_Change_percentage, 
ROUND((((SUM(p.unit_price * oi.quantity)- SUM((p.unit_price * oi.quantity) * oi.discount)) / COUNT(DISTINCT oi.order_id))
    - (SUM(p.unit_price * oi.quantity) / COUNT(DISTINCT oi.order_id)))
  / (SUM(p.unit_price * oi.quantity) / COUNT(DISTINCT oi.order_id)) * 100,2) AS Avg_Order_Val_Change_per,
count(distinct oi.order_id) as Total_Orders
from order_items oi
inner join products p
on p.product_id = oi.product_id 
inner join orders o
on o.order_id = oi.order_id
inner join customers c
on c.customer_id = o.customer_id
group by c.customer_segment
;


-- TASK 2: Product Performance
-- Rank products by total revenue within each category
-- Use window functions to show each product's contribution to category revenue

-- YOUR SOLUTION HERE
--Ans.
with revenue_total as (
select p.product_name, p.category, sum(p.unit_price * oi.quantity) as revenue
from products p
inner join order_items oi
on p.product_id = oi.product_id 
group by p.product_name, p.category
)
select product_name, revenue, category, rank() over (partition by category order by revenue desc) as rnk,
(revenue * 100 / sum(revenue) over()) as product_contri
from revenue_total
group by product_name, category
order by revenue desc
;

-- TASK 3: Customer Cohort Analysis
-- Analyze customer retention by registration month
-- Calculate how many customers from each registration month made repeat purchases

-- YOUR SOLUTION HERE
--Ans.
with jan_customer as (
select c.customer_id
from orders o
join customers c
on c.customer_id = o.customer_id
where o.order_date between '2024-01-01' and '2024-01-31'
),
feb_customer as (
select distinct(c.customer_id)
from orders o
join customers c
on c.customer_id = o.customer_id
where o.order_date between '2024-02-01' and '2024-02-29'
),
mar_customer as (
select distinct(c.customer_id)
from orders o
join customers c
on c.customer_id = o.customer_id
where o.order_date between '2024-03-01' and '2024-03-31'
)
select (
select (count(distinct j.customer_id) * 100) / (select count(*) from jan_customer)
from jan_customer j
where j.customer_id in (
select customer_id from feb_customer)
) as Retension_rate_jan_to_feb,
(
select (count(distinct f.customer_id) * 100) / (select count(*) from feb_customer)
from feb_customer f 
where f.customer_id in (select customer_id from mar_customer)
) as Retension_rate_feb_to_mar
;

select extract(MONTH from c.registration_date) as reg_month, count(distinct c.customer_id ) as customer_repet
from customers c 
join orders o
on c.customer_id = o.customer_id
group by extract(MONTH from c.registration_date)
having count(o.order_id) >= 2
;

-- TASK 4: Shipping Performance
-- Calculate average shipping time by ship mode
-- Identify orders that took longer than average to ship

-- YOUR SOLUTION HERE
--Ans.
select ship_mode, round(avg(datediff(ship_date, order_date)) , 2) as Avg_Ship_Time
from orders
group by ship_mode
;

with Avg_Ship_Time as (
select round(avg(datediff(ship_date, order_date)) , 2) as Avg_Time
from orders
),
diff_time as (
select order_id, order_date, round(datediff(ship_date, order_date), 2) as Actual_Time
from orders
)
select dt.order_id, dt.order_date, dt.Actual_Time, ast.Avg_Time
from diff_time dt
join Avg_Ship_Time ast
where dt.Actual_Time > ast.Avg_Time
;
-- TASK 5: Sales Trends
-- Create a CTE to calculate monthly sales trends
-- Show month-over-month growth percentage

-- YOUR SOLUTION HERE
--Ans.
with sale as (
select month(order_date)as months , sum( unit_price * quantity) as total_sale
from order_items oi
inner join products p
on p.product_id = oi.product_id 
inner join orders o
on o.order_id = oi.order_id
inner join customers c
on c.customer_id = o.customer_id
group by month(order_date) 
)
select total_sale, lag(total_sale, 1) over (order by months) as previous_month_sale, 
(total_sale - lag(total_sale, 1) over (order by months)) as difference,
round(((total_sale - lag(total_sale, 1) over (order by months)) / lag(total_sale, 1) over (order by months) * 100), 2) as month_over_month_growth_percentage
from sale
;

-- TASK 6: Top Customer Analysis
-- Identify top 5 customers by total revenue
-- Show their order frequency, average order value, and preferred product categories

-- YOUR SOLUTION HERE
--Ans.
with Revenue as (
select c.customer_id, c.customer_name, p.category , round(sum(p.unit_price * oi.quantity),2) as Total_Revenue,
(count(o.order_id) / count(distinct c.customer_id)) as order_frequency,
round(sum(p.unit_price * oi.quantity)/count(oi.order_id),2) as Average_Order_Value
from order_items oi
inner join products p
on p.product_id = oi.product_id 
inner join orders o
on o.order_id = oi.order_id
inner join customers c
on c.customer_id = o.customer_id
group by c.customer_id,p. category
order by Total_Revenue  desc
)
select customer_id, customer_name, Total_Revenue, order_frequency, Average_Order_Value, category
from Revenue
limit 5


-- TASK 7: Discount Effectiveness
-- Analyze correlation between discount levels and order quantity
-- Identify which product categories benefit most from discounts

-- YOUR SOLUTION HERE
--Ans.
with categories_benefited as(
select category, 
case when discount  = 0.00 then "No" 
when discount > 0.00 and discount <= 0.05 then "Low" 
when discount > 0.05 and discount <= 0.10 then "Medium" 
when discount > 0.10 and discount <= 0.15 then "High" 
else "Very High" end as discount_bucket,
round((sum(quantity) / count(discount)), 2) as avg_orders
from order_items oi
inner join products p 
on p.product_id = oi.product_id
group by category, discount_bucket
)
select * 
from categories_benefited
order by discount_bucket
;


-- TASK 8: Complex Query - Customer Lifetime Value
-- Calculate customer lifetime value (CLV) using:
-- - Total revenue per customer
-- - Number of orders
-- - Average time between orders
-- - Customer tenure (days since registration)
-- Rank customers by CLV and segment them into quartiles

-- YOUR SOLUTION HERE
--Ans.
with CLV as(
select c.customer_id, round(sum(p.unit_price * oi.quantity),2) as Total_Revenue,
count(oi.order_id) as No_of_order,
(count(o.order_id) / count(distinct c.customer_id)) as order_frequency,
datediff(max(o.order_date), c.registration_date) as Customer_tenure
from order_items oi
inner join products p
on p.product_id = oi.product_id 
inner join orders o
on o.order_id = oi.order_id
inner join customers c
on c.customer_id = o.customer_id
group by c.customer_id
)
select round(((Total_Revenue / No_of_order) * order_frequency * Customer_tenure), 2) as customer_lifetime_value, 
RANK() OVER (ORDER BY ROUND((Total_Revenue / No_of_order) * order_frequency * Customer_tenure, 2) DESc) AS clv_rank,
case
	when ntile(4) OVER (ORDER BY ROUND((Total_Revenue / No_of_order) * order_frequency * Customer_tenure, 2) DESc) = 1 then "High Value"
    when ntile(4) OVER (ORDER BY ROUND((Total_Revenue / No_of_order) * order_frequency * Customer_tenure, 2) DESc) = 1 then "Moderate Value"
    when ntile(4) OVER (ORDER BY ROUND((Total_Revenue / No_of_order) * order_frequency * Customer_tenure, 2) DESc) = 1 then "Medium Value"
    else "Low Value"
    end as clv_rank_quartiles
from CLV
;
-- ============================================
-- BONUS CHALLENGES
-- ============================================

-- BONUS 1: Create a view that shows daily sales summary
-- BONUS 2: Write a stored procedure to get top N products by revenue for any date range
-- BONUS 3: Optimize the slowest query from above (explain your optimization strategy)

