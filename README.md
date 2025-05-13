# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `Project_1`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyse retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `Project_1`.
- **Table Creation**: A table named `retail_sales_analysis` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.


```sql
CREATE DATABASE Project_1;

CREATE TABLE retail_sales_analysis
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total sale FLOAT
);
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM retail_sales_analysis;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales_analysis;
SELECT DISTINCT category FROM retail_sales_analysis;

SELECT * FROM retail_sales_analysis
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales_analysis
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

'''sql
use Project_1;
describe retail_sales_analysis;

select * from retail_sales_analysis;
'''

/* Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05. */

'''sql
select * from retail_sales_analysis 
where sale_date = '2022-11-05';
'''

/* Q.2 Write a SQL query to retrieve all transactions where the category is 
'Clothing' and the quantity sold is more than 10 in the month of Nov-2022 $$
*/
'''sql
select * from project_1.retail_sales_analysis 
where category = "clothing" 
and quantiy>3 
and sale_date > '2022-11-01'
and sale_date <= '2022-11-30'
order by sale_date asc;
'''

/*
Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
*/

'''sql
select 
	category, sum(total_sale) 
from retail_sales_analysis 
group by category ;
'''

/* Q.4 Write a SQL query to find the average
 age of customers who purchased items from the 'Beauty' category. 
 */

'''sql
select 
	category,
    avg(age)  
from project_1.retail_sales_analysis 
where category = 'Beauty';
'''

/* 
Q.5 Write a SQL query to find all transactions 
where the total_sale is greater than 1000.
*/

'''sql
select * from project_1.retail_sales_analysis 
where total_sale > 1000;
'''

/* Q.6 Write a SQL query to find the total number of 
transactions (transaction_id) made by each gender in each category.
*/

'''
select 
	gender,
    category,
    sum(transactions_id) 
from project_1.retail_sales_analysis
group by gender, category 
order by category; 
'''

/* Q.7 Write a SQL query to calculate the average sale 
for each month. Find out best selling month in each year
*/

'''
select * from project_1.retail_sales_analysis;

select 
year(sale_date) as Year_name, 
month(sale_date) as Month_name, 
avg(total_sale) as Avg_Sale 
from project_1.retail_sales_analysis 
group by Year_name, Month_name 
order by year_name asc, avg_sale desc;
'''

/* Q.8 Write a SQL query to find the top 5 customers based on the highest total sales. */

'''sql
select customer_id, sum(total_sale) as total_sales
from project_1.retail_sales_analysis
group by 1 
order by 2 desc
limit 5;
'''

/* Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
*/

'''sql
select 
	category,
	count(distinct customer_id) as Unique_Customer
from project_1.retail_sales_analysis
group by 1;
'''

/* Q.10 Write a SQL query to create each shift and number of 
orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
*/

'''sql
select *,
	(case
    when sale_time then "Morning"
    when sale_time then "Afternoon"
    else "evening"
    end) as Shift
 from project_1.retail_sales_analysis;
'''

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behaviour, and product performance.

## How to Use

1. **Clone the Repository**: Clone this project repository from GitHub.
2. **Set Up the Database**: Run the SQL scripts provided in the `database_setup.sql` file to create and populate the database.
3. **Run the Queries**: Use the SQL queries provided in the `analysis_queries.sql` file to perform your analysis.
4. **Explore and Modify**: Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.

