use Project_1;
describe retail_sales_analysis;

select * from retail_sales_analysis;

/* Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05. */

select * from retail_sales_analysis 
where sale_date = '2022-11-05';

/* Q.2 Write a SQL query to retrieve all transactions where the category is 
'Clothing' and the quantity sold is more than 10 in the month of Nov-2022 $$
*/

select * from project_1.retail_sales_analysis 
where category = "clothing" 
and quantiy>3 
and sale_date > '2022-11-01'
and sale_date <= '2022-11-30'
order by sale_date asc;

/*
Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
*/

select 
	category, sum(total_sale) 
from retail_sales_analysis 
group by category ;

/* Q.4 Write a SQL query to find the average
 age of customers who purchased items from the 'Beauty' category. 
 */

select 
	category,
    avg(age)  
from project_1.retail_sales_analysis 
where category = 'Beauty';

/* 
Q.5 Write a SQL query to find all transactions 
where the total_sale is greater than 1000.
*/

select * from project_1.retail_sales_analysis 
where total_sale > 1000;

/* Q.6 Write a SQL query to find the total number of 
transactions (transaction_id) made by each gender in each category.
*/

select 
	gender,
    category,
    sum(transactions_id) 
from project_1.retail_sales_analysis
group by gender, category 
order by category; 

/* Q.7 Write a SQL query to calculate the average sale 
for each month. Find out best selling month in each year
*/
select * from project_1.retail_sales_analysis;

select 
year(sale_date) as Year_name, 
month(sale_date) as Month_name, 
avg(total_sale) as Avg_Sale 
from project_1.retail_sales_analysis 
group by Year_name, Month_name 
order by year_name asc, avg_sale desc;


/* Q.8 Write a SQL query to find the top 5 customers based on the highest total sales. */

select customer_id, sum(total_sale) as total_sales
from project_1.retail_sales_analysis
group by 1 
order by 2 desc
limit 5;


/* Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
*/
select 
	category,
    count(distinct customer_id) as Unique_Customer
from project_1.retail_sales_analysis
group by 1;

/* Q.10 Write a SQL query to create each shift and number of 
orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
*/

select *,
	(case
    when sale_time then "Morning"
    when sale_time then "Afternoon"
    else "evening"
    end) as Shift
 from project_1.retail_sales_analysis;
