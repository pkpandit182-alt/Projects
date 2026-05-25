create DATABASE banking_analytics_db;
use banking_analytics_db;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    join_date DATE
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(12,2),
    open_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(12,2),
    loan_type VARCHAR(50),
    interest_rate DECIMAL(5,2),
    loan_status VARCHAR(20),
    issue_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE Loan_Payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_amount DECIMAL(10,2),
    payment_date DATE,
    payment_status VARCHAR(20),
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

INSERT INTO customers 
(customer_id, first_name, last_name, age, gender, city, join_date) 
VALUES
(1,'Rahul','Sharma',34,'Male','Kolkata','2021-03-12'),
(2,'Priya','Das',29,'Female','Kolkata','2022-01-18'),
(3,'Amit','Verma',41,'Male','Delhi','2020-11-03'),
(4,'Neha','Gupta',31,'Female','Mumbai','2023-02-10'),
(5,'Arjun','Patel',45,'Male','Ahmedabad','2019-09-14'),
(6,'Ananya','Roy',27,'Female','Kolkata','2022-07-09'),
(7,'Rohan','Singh',36,'Male','Delhi','2021-05-22'),
(8,'Kavya','Nair',30,'Female','Kochi','2023-01-11'),
(9,'Suresh','Reddy',48,'Male','Hyderabad','2018-12-05'),
(10,'Pooja','Iyer',33,'Female','Chennai','2022-04-21'),
(11,'Deepak','Mehta',38,'Male','Mumbai','2020-06-14'),
(12,'Sneha','Chatterjee',26,'Female','Kolkata','2023-03-18'),
(13,'Vikram','Singh',44,'Male','Jaipur','2019-08-10'),
(14,'Simran','Kaur',32,'Female','Amritsar','2021-09-29'),
(15,'Nikhil','Agarwal',37,'Male','Delhi','2020-02-20'),
(16,'Tanya','Banerjee',28,'Female','Kolkata','2022-12-15'),
(17,'Rajesh','Yadav',46,'Male','Patna','2019-10-08'),
(18,'Isha','Kapoor',31,'Female','Mumbai','2021-06-25'),
(19,'Manish','Saxena',40,'Male','Delhi','2018-11-12'),
(20,'Ritu','Mishra',35,'Female','Varanasi','2022-08-19'),
(21,'Karan','Malhotra',39,'Male','Delhi','2021-01-13'),
(22,'Divya','Menon',27,'Female','Kochi','2023-04-10'),
(23,'Harsh','Trivedi',34,'Male','Ahmedabad','2020-09-05'),
(24,'Aisha','Khan',30,'Female','Mumbai','2022-02-18'),
(25,'Prakash','Nayak',47,'Male','Bhubaneswar','2019-07-22'),
(26,'Sonal','Jain',29,'Female','Indore','2021-11-11'),
(27,'Ashok','Joshi',50,'Male','Pune','2017-06-15'),
(28,'Riya','Saha',24,'Female','Kolkata','2023-05-04'),
(29,'Sachin','Pandey',42,'Male','Delhi','2019-03-27'),
(30,'Nidhi','Singhal',33,'Female','Gurgaon','2021-10-16'),
(31,'Ravi','Choudhary',36,'Male','Jaipur','2020-01-07'),
(32,'Pallavi','Patil',28,'Female','Pune','2022-06-30'),
(33,'Sunil','Naidu',45,'Male','Hyderabad','2018-08-19'),
(34,'Meera','Shah',31,'Female','Ahmedabad','2021-12-02'),
(35,'Anil','Kulkarni',48,'Male','Pune','2017-09-23'),
(36,'Swati','Bose',27,'Female','Kolkata','2023-02-15'),
(37,'Mohit','Arora',35,'Male','Delhi','2020-04-12'),
(38,'Juhi','Saxena',30,'Female','Noida','2021-08-08'),
(39,'Ajay','Thakur',41,'Male','Shimla','2019-12-19'),
(40,'Kritika','Soni',26,'Female','Indore','2023-03-03'),
(41,'Devendra','Rathore',44,'Male','Jaipur','2018-05-28'),
(42,'Shalini','Tiwari',32,'Female','Lucknow','2022-07-12'),
(43,'Ramesh','Gowda',49,'Male','Bangalore','2017-11-14'),
(44,'Preeti','Seth',34,'Female','Delhi','2021-05-06'),
(45,'Gaurav','Kapoor',37,'Male','Chandigarh','2020-09-17'),
(46,'Payal','Desai',28,'Female','Surat','2022-11-20'),
(47,'Abhishek','Tripathi',39,'Male','Kanpur','2019-02-11'),
(48,'Komal','Arora',31,'Female','Delhi','2021-06-27'),
(49,'Sanjay','Sinha',46,'Male','Patna','2018-10-03'),
(50,'Rekha','Nair',33,'Female','Kochi','2022-03-22');
select * from customers;

INSERT INTO accounts
(account_id, customer_id, account_type, balance, open_date)
VALUES
(101,1,'Savings',54000,'2021-03-15'),
(102,2,'Savings',32000,'2022-01-20'),
(103,3,'Current',87000,'2020-11-05'),
(104,4,'Savings',45000,'2023-02-12'),
(105,5,'Current',92000,'2019-09-18'),
(106,6,'Savings',27000,'2022-07-11'),
(107,7,'Savings',61000,'2021-05-25'),
(108,8,'Savings',38000,'2023-01-14'),
(109,9,'Current',120000,'2018-12-08'),
(110,10,'Savings',49000,'2022-04-23'),
(111,11,'Savings',56000,'2020-06-18'),
(112,12,'Savings',23000,'2023-03-20'),
(113,13,'Current',99000,'2019-08-13'),
(114,14,'Savings',47000,'2021-10-01'),
(115,15,'Current',76000,'2020-02-23'),
(116,16,'Savings',34000,'2022-12-18'),
(117,17,'Savings',51000,'2019-10-11'),
(118,18,'Savings',45000,'2021-06-28'),
(119,19,'Current',88000,'2018-11-15'),
(120,20,'Savings',39000,'2022-08-22'),
(121,21,'Current',67000,'2021-01-16'),
(122,22,'Savings',25000,'2023-04-13'),
(123,23,'Savings',52000,'2020-09-08'),
(124,24,'Savings',41000,'2022-02-20'),
(125,25,'Current',83000,'2019-07-25'),
(126,26,'Savings',30000,'2021-11-14'),
(127,27,'Current',95000,'2017-06-18'),
(128,28,'Savings',21000,'2023-05-07'),
(129,29,'Savings',64000,'2019-03-30'),
(130,30,'Savings',47000,'2021-10-18'),
(131,31,'Savings',53000,'2020-01-10'),
(132,32,'Savings',28000,'2022-07-02'),
(133,33,'Current',102000,'2018-08-22'),
(134,34,'Savings',36000,'2021-12-05'),
(135,35,'Current',110000,'2017-09-26'),
(136,36,'Savings',24000,'2023-02-17'),
(137,37,'Savings',55000,'2020-04-15'),
(138,38,'Savings',42000,'2021-08-11'),
(139,39,'Current',79000,'2019-12-22'),
(140,40,'Savings',26000,'2023-03-06'),
(141,41,'Current',91000,'2018-05-31'),
(142,42,'Savings',35000,'2022-07-15'),
(143,43,'Current',118000,'2017-11-17'),
(144,44,'Savings',46000,'2021-05-09'),
(145,45,'Savings',58000,'2020-09-20'),
(146,46,'Savings',31000,'2022-11-23'),
(147,47,'Current',72000,'2019-02-14'),
(148,48,'Savings',39000,'2021-06-30'),
(149,49,'Current',84000,'2018-10-06'),
(150,50,'Savings',44000,'2022-03-25');
select * from accounts;

INSERT INTO loans
(loan_id, customer_id, loan_amount, loan_type, interest_rate, loan_status, issue_date)
VALUES
(201,1,50000,'Personal',11.5,'Active','2022-05-10'),
(202,2,75000,'Home',8.2,'Active','2023-01-11'),
(203,3,120000,'Car',9.5,'Closed','2021-07-15'),
(204,4,60000,'Personal',12.1,'Active','2023-04-18'),
(205,5,200000,'Home',7.9,'Active','2020-09-22'),
(206,6,45000,'Personal',11.8,'Closed','2022-10-05'),
(207,7,80000,'Car',9.2,'Active','2021-12-17'),
(208,8,35000,'Personal',12.5,'Closed','2023-02-20'),
(209,9,150000,'Business',10.0,'Active','2019-11-25'),
(210,10,55000,'Personal',11.0,'Active','2022-06-19'),
(211,11,67000,'Car',9.8,'Closed','2021-03-08'),
(212,12,30000,'Personal',12.3,'Active','2023-05-01'),
(213,13,180000,'Home',7.5,'Active','2020-01-12'),
(214,14,62000,'Personal',11.6,'Closed','2022-02-14'),
(215,15,90000,'Car',9.1,'Active','2020-08-10'),
(216,16,42000,'Personal',12.0,'Active','2023-01-21'),
(217,17,50000,'Personal',11.2,'Closed','2019-12-05'),
(218,18,73000,'Car',9.4,'Active','2021-09-29'),
(219,19,110000,'Business',10.3,'Active','2018-10-14'),
(220,20,48000,'Personal',11.9,'Closed','2022-12-02'),
(221,21,85000,'Car',9.6,'Active','2021-03-30'),
(222,22,39000,'Personal',12.4,'Active','2023-04-12'),
(223,23,60000,'Personal',11.3,'Closed','2020-10-19'),
(224,24,72000,'Car',9.0,'Active','2022-01-05'),
(225,25,160000,'Business',10.1,'Active','2019-08-28'),
(226,26,45000,'Personal',12.2,'Closed','2021-11-20'),
(227,27,210000,'Home',7.8,'Active','2018-07-07'),
(228,28,32000,'Personal',12.6,'Active','2023-05-08'),
(229,29,78000,'Car',9.7,'Closed','2019-04-01'),
(230,30,54000,'Personal',11.4,'Active','2021-12-15'),
(231,31,65000,'Car',9.3,'Active','2020-02-12'),
(232,32,38000,'Personal',12.1,'Closed','2022-07-25'),
(233,33,140000,'Business',10.2,'Active','2018-09-17'),
(234,34,50000,'Personal',11.5,'Closed','2021-12-30'),
(235,35,230000,'Home',7.7,'Active','2017-10-05'),
(236,36,31000,'Personal',12.4,'Active','2023-03-01'),
(237,37,72000,'Car',9.1,'Closed','2020-05-18'),
(238,38,55000,'Personal',11.8,'Active','2021-08-22'),
(239,39,98000,'Car',9.6,'Active','2019-12-29'),
(240,40,27000,'Personal',12.7,'Closed','2023-04-09'),
(241,41,130000,'Business',10.0,'Active','2018-06-11'),
(242,42,48000,'Personal',11.9,'Active','2022-07-18'),
(243,43,200000,'Home',7.6,'Active','2017-12-01'),
(244,44,56000,'Personal',11.4,'Closed','2021-05-20'),
(245,45,76000,'Car',9.2,'Active','2020-09-25'),
(246,46,42000,'Personal',12.3,'Active','2022-12-01'),
(247,47,89000,'Car',9.5,'Closed','2019-03-14'),
(248,48,51000,'Personal',11.7,'Active','2021-07-10'),
(249,49,97000,'Car',9.4,'Active','2018-11-07'),
(250,50,61000,'Personal',11.6,'Closed','2022-04-28');
select * from loans;

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES
(1001,101,'Deposit',10000,'2023-01-10'),
(1002,102,'Withdrawal',5000,'2023-01-11'),
(1003,103,'Deposit',20000,'2023-01-12'),
(1004,104,'Deposit',15000,'2023-01-13'),
(1005,105,'Withdrawal',10000,'2023-01-14'),
(1006,106,'Deposit',8000,'2023-01-15'),
(1007,107,'Withdrawal',6000,'2023-01-16'),
(1008,108,'Deposit',12000,'2023-01-17'),
(1009,109,'Deposit',25000,'2023-01-18'),
(1010,110,'Withdrawal',7000,'2023-01-19'),
(1011,111,'Deposit',9000,'2023-01-20'),
(1012,112,'Deposit',6000,'2023-01-21'),
(1013,113,'Withdrawal',11000,'2023-01-22'),
(1014,114,'Deposit',13000,'2023-01-23'),
(1015,115,'Deposit',17000,'2023-01-24'),
(1016,116,'Withdrawal',4000,'2023-01-25'),
(1017,117,'Deposit',10000,'2023-01-26'),
(1018,118,'Deposit',14000,'2023-01-27'),
(1019,119,'Withdrawal',9000,'2023-01-28'),
(1020,120,'Deposit',7000,'2023-01-29'),
(1021,121,'Deposit',16000,'2023-01-30'),
(1022,122,'Withdrawal',3000,'2023-02-01'),
(1023,123,'Deposit',8000,'2023-02-02'),
(1024,124,'Deposit',9000,'2023-02-03'),
(1025,125,'Withdrawal',12000,'2023-02-04'),
(1026,126,'Deposit',6000,'2023-02-05'),
(1027,127,'Deposit',15000,'2023-02-06'),
(1028,128,'Withdrawal',2000,'2023-02-07'),
(1029,129,'Deposit',11000,'2023-02-08'),
(1030,130,'Deposit',9500,'2023-02-09'),
(1031,131,'Withdrawal',4500,'2023-02-10'),
(1032,132,'Deposit',7000,'2023-02-11'),
(1033,133,'Deposit',21000,'2023-02-12'),
(1034,134,'Withdrawal',5000,'2023-02-13'),
(1035,135,'Deposit',25000,'2023-02-14'),
(1036,136,'Deposit',4000,'2023-02-15'),
(1037,137,'Withdrawal',6000,'2023-02-16'),
(1038,138,'Deposit',10000,'2023-02-17'),
(1039,139,'Deposit',12000,'2023-02-18'),
(1040,140,'Withdrawal',3000,'2023-02-19'),
(1041,141,'Deposit',20000,'2023-02-20'),
(1042,142,'Deposit',9000,'2023-02-21'),
(1043,143,'Withdrawal',15000,'2023-02-22'),
(1044,144,'Deposit',11000,'2023-02-23'),
(1045,145,'Deposit',14000,'2023-02-24'),
(1046,146,'Withdrawal',5000,'2023-02-25'),
(1047,147,'Deposit',18000,'2023-02-26'),
(1048,148,'Deposit',9500,'2023-02-27'),
(1049,149,'Withdrawal',8000,'2023-02-28'),
(1050,150,'Deposit',12000,'2023-03-01');
select * from transactions;

INSERT INTO loan_payments
(payment_id, loan_id, payment_amount, payment_date, payment_status)
VALUES
(3001,201,5000,'2023-01-10','Paid'),
(3002,202,7500,'2023-01-12','Paid'),
(3003,203,10000,'2023-01-15','Paid'),
(3004,204,6000,'2023-01-18','Paid'),
(3005,205,15000,'2023-01-20','Paid'),
(3006,206,4500,'2023-01-22','Paid'),
(3007,207,8000,'2023-01-25','Paid'),
(3008,208,3500,'2023-01-27','Paid'),
(3009,209,12000,'2023-01-30','Paid'),
(3010,210,5500,'2023-02-01','Paid'),
(3011,211,6700,'2023-02-03','Paid'),
(3012,212,3000,'2023-02-05','Paid'),
(3013,213,18000,'2023-02-07','Paid'),
(3014,214,6200,'2023-02-09','Paid'),
(3015,215,9000,'2023-02-11','Paid'),
(3016,216,4200,'2023-02-13','Paid'),
(3017,217,5000,'2023-02-15','Paid'),
(3018,218,7300,'2023-02-17','Paid'),
(3019,219,11000,'2023-02-19','Paid'),
(3020,220,4800,'2023-02-21','Paid'),
(3021,221,8500,'2023-02-23','Paid'),
(3022,222,3900,'2023-02-25','Paid'),
(3023,223,6000,'2023-02-27','Paid'),
(3024,224,7200,'2023-03-01','Paid'),
(3025,225,16000,'2023-03-03','Paid'),
(3026,226,4500,'2023-03-05','Paid'),
(3027,227,21000,'2023-03-07','Paid'),
(3028,228,3200,'2023-03-09','Paid'),
(3029,229,7800,'2023-03-11','Paid'),
(3030,230,5400,'2023-03-13','Paid'),
(3031,231,6500,'2023-03-15','Paid'),
(3032,232,3800,'2023-03-17','Paid'),
(3033,233,14000,'2023-03-19','Paid'),
(3034,234,5000,'2023-03-21','Paid'),
(3035,235,23000,'2023-03-23','Paid'),
(3036,236,3100,'2023-03-25','Paid'),
(3037,237,7200,'2023-03-27','Paid'),
(3038,238,5500,'2023-03-29','Paid'),
(3039,239,9800,'2023-03-31','Paid'),
(3040,240,2700,'2023-04-02','Paid'),
(3041,241,13000,'2023-04-04','Paid'),
(3042,242,4800,'2023-04-06','Paid'),
(3043,243,20000,'2023-04-08','Paid'),
(3044,244,5600,'2023-04-10','Paid'),
(3045,245,7600,'2023-04-12','Paid'),
(3046,246,4200,'2023-04-14','Paid'),
(3047,247,8900,'2023-04-16','Paid'),
(3048,248,5100,'2023-04-18','Paid'),
(3049,249,9700,'2023-04-20','Paid'),
(3050,250,6100,'2023-04-22','Paid');
select * from loan_payments;
select * from customers;
select * from accounts;
select * from transactions;
select * from loans;

#
#1. Find the number of customers in each city.
select city, count(customer_id) as number_of_customer
from customers
group by city
;
#2. Calculate the total loan amount issued.
select sum(loan_amount) as total_amt
from loans
;
#3. Find average balance for each account type.
select account_type, avg(balance) as avg_balance
from accounts
group by account_type
;
#4. Identify the top 10 richest customers.
select a.customer_id, c.first_name, c.last_name, a.balance
from accounts a 
join customers c 
on c.customer_id = a.customer_id
limit 10
;
#5. Find how many Personal, Car, and Home loans were issued.
select loan_type, count(loan_type) as number_of_loan
from loans
group by loan_type
;
##
#6. Find total loan amount issued to customers in each city.
select c.city, sum(l.loan_amount) as total_loan_amt
from customers c
join loans l
on c.customer_id = l.customer_id
group by city
order by total_loan_amt desc
;
#7. Find customers who have both a loan and an account.
select distinct c.customer_id, c.first_name
from customers c
join accounts a
on c.customer_id = a.customer_id
join loans l
on c.customer_id = l.customer_id
;
#8. Calculate total transaction amount for each customer.
select c.customer_id, sum(t.amount) as total_amt
from transactions t
join accounts a
on a.account_id = t.account_id
join customers c
on c.customer_id = a.customer_id
group by c.customer_id
;
#9. Calculate total transaction amount per month.
select sum(amount) as total_amt, month(transaction_date) as transaction_month
from transactions
group by transaction_month
;
#10. Find customers who took loans but never paid any installment.
select c.customer_id, concat(c.first_name, ' ', c.last_name) as Full_Name
from customers c
where exists (
	select 1 
	from loans l 
	where l.customer_id = c.customer_id
    and not exists(
		select 1
        from loan_payments lp
        where lp.loan_id = l.loan_id
        )
	)
;
###
#11. Rank customers based on total transaction value.
select c.customer_id, concat(c.first_name, ' ', c.last_name) as Full_Name, t.transaction_id, t.amount,
dense_rank() over (order by t.amount desc) as Ranking_by_Amount
from customers c
join accounts a 
on a.customer_id = c.customer_id
join transactions t
on t.account_id = a.account_id
;
#12. Calculate running total of transactions ordered by date.
select transaction_id, sum(amount) over (order by transaction_date)
from transactions
;
#13. Find top 3 highest loan customers in each city.
with loan_rank as (
select c.customer_id, concat(c.first_name, ' ', c.last_name) as full_name, l.loan_amount, c.city,
rank() over (partition by c.city order by l.loan_amount desc) as ranking_by_loan_amount
from customers c
inner join loans l
on l.customer_id = c.customer_id
)
select *
from loan_rank
where ranking_by_loan_amount <= 3
-- limit 3
-- where ranking_by_loan_amount<=3
;
#14. Find percentage of loan amount that has been repaid.
select sum(l.loan_amount) as total_loan_amount, sum(lp.payment_amount) as total_amount_paid, round(((sum(lp.payment_amount)/sum(l.loan_amount)) * 100),2) as percentage_of_loan_paid
from loans l 
join loan_payments lp
on lp.loan_id = l.loan_id
;
#15. Identify risky customers. (Criteria: loan_amount > 100000 AND account_balance < 20000)
select c.customer_id, concat(c.first_name, ' ', c.last_name) as full_name, l.loan_amount, a.balance
from customers c
join loans l 
on l.customer_id = c.customer_id
join accounts a
on a.customer_id = c.customer_id
where l.loan_amount > 100000
and a.balance < 20000
;
####
#16. Find highest transaction for each month.
with monthly_rank as(
select transaction_id, transaction_date, monthname(transaction_date) as Month_Name, amount,
rank() over(partition by monthname(transaction_date) order by amount desc) as Highest_Transaction
from transactions
)
select transaction_id, amount, Month_Name
from monthly_rank
where Highest_Transaction = 1
order by month(transaction_date)
;
#17. Detect inactive customers: Customers who did not make transactions in last 6 months.
#18. Calculate percentage of loans that are default.
#19. Average loan amount by age group. Example of age group: 20-30, 30-40, 40-50.
with age_group as(
	select l.loan_amount,
		case
			when c.age between 20 and 30 then 'Young Adults'
            when c.age between 31 and 40 then 'Mid-Adulthood'
            when c.age between 41 and 50 then 'Middle-aged Adults'
            when c.age between 51 and 60 then 'Pre-retirement'
            else 'Senior Citizen'
		end as Age_Group
	from customers c
    inner join loans l 
    on l.customer_id = c.customer_id
)
select Age_Group, concat('₹ ', format(avg(loan_amount),2)) as avg_loan_taken
/*format converts numbers to text, add comma and make 2 decimal place. It follows international number format i.e. 3,3,3 */ 
from age_group
group by Age_Group
;
#20. Total transaction + loan amount.
#####🔥🔥🔥
#21. Find duplicate customers.
select * 
from customers
where (first_name, last_name, city) in (
	select first_name, last_name, city
    from customers
    group by first_name, last_name, city
    having count(*) > 1
);
#22. Find second highest account balance.
/*methon 1*/
select concat('₹ ', format(balance, 2))
from  accounts
order by balance desc
limit 1
offset 1
;
/*method 2 */
select concat('₹ ', format(max(balance),2)) as highest_salary
from accounts
where balance not in (
	select max(balance)
    from accounts
)
;
/* method 3 */
select concat('₹ ', format(balance,2)) as Balance
from (
	select balance, row_number() over (order by balance desc) as rnk
	from accounts
) t
where rnk = 2
;
#23. Top 5 customers contributing highest transactions.
/* method 1 */
select c.customer_id, c.first_name, c.last_name, t.amount
from transactions t
inner join accounts a
on t.account_id = a.account_id
inner join customers c
on a.customer_id = c.customer_id
order by amount desc
limit 5
;
/* method 2 */
select customer_id, concat(first_name, ' ',  last_name) as Full_Name, amount
from(
	select c.customer_id, c.first_name, c.last_name, t.amount, row_number() over(order by t.amount desc) as rnk
	from transactions t
	inner join accounts a
	on t.account_id = a.account_id
	inner join customers c
	on a.customer_id = c.customer_id
) t
where rnk <= 5
;
#24. Customers with multiple loans.
select customer_id, full_name
from (
	select c.customer_id, concat(c.first_name, ' ', c.last_name) as full_name
    from loans l 
    join customers c on c.customer_id = l.customer_id
    group by l.customer_id, c.first_name, c.last_name
    having count(l.customer_id) > 1
)t
;
#25. Average transaction per customer.
/* Average transaction value */
select c.customer_id, concat(c.first_name, ' ', c.last_name) as full_name, format(avg(t.amount),2) as avg_transaction_value
from transactions t
join accounts a on a.account_id = t.account_id
join customers c on c.customer_id = a.customer_id
group by c.customer_id
;
/* average number of transaction */
select (count(t.transaction_id) * 1.0 / count(distinct(c.customer_id))) as number_of_transaction
from transactions t
join accounts a on a.account_id = t.account_id
join customers c on c.customer_id = a.customer_id
;


##
select Customer_id, first_name
from customers
where gender = 'Male'
	and city = 'Mumbai'
;

