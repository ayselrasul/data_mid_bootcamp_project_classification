
use credit_card_classification;


# Select all the data from table credit_card_data to check if the data was imported 
# correctly

select * from credit_card_data;  #The dataset was imported correctly

# Use the alter table command to drop the column q4_balance from the database, as we
# would not use it in the analysis with SQL. Select all the data from the table to 
# verify if the command worked. Limit your returned results to 10

Alter  Table credit_card_data
Drop balance_q4;

select * from credit_card_data
Limit 10;

# Use sql query to find how many rows of data you have

select count(*) from credit_card_data;


#Now we will try to find the unique values in some of the categorical columns:

#What are the unique values in the column offer_accepted?

select distinct offer_accepted
from credit_card_data;

#What are the unique values in the column Reward?

select distinct reward
from credit_card_data;

#What are the unique values in the column mailer_type?

select distinct mailer_type
from credit_card_data;

#What are the unique values in the column credit_cards_held?

select distinct credit_cards_held
from credit_card_data;

#What are the unique values in the column household_size? 

select distinct household_size
from credit_card_data;

# Arrange the data in a decreasing order by the average_balance of the house. Return 
# only the customer_number of the top 10 customers with the highest average_balances 
# in your data

select customer_number,average_balance
from credit_card_data 
order by average_balance desc
limit 10;

# What is the average balance of all the customers in your data?

select round(avg(average_balance),2)
from credit_card_data;

# In this exercise we will use simple group by to check the properties of some of the
# categorical variables in our data. Note wherever average_balance is asked, please 
# take the average of the column average_balance:

# What is the average balance of the customers grouped by Income Level? The returned 
# result should have only two columns, income level and Average balance of the customers
# Use an alias to change the name of the second column

select income_level,round(avg(average_balance),2) as avg_balance
from credit_card_data
group by income_level;

# What is the average number of credit cards held by customers for each of the credit
# card ratings? The returned result should have only two columns, rating and average 
# number of credit cards held. Use an alias to change the name of the second column


select credit_rating,avg(credit_cards_held) as avg_count
from credit_card_data
group by credit_rating; 


# Is there any correlation between the columns credit_cards_held and 
# number_of_bank_accounts_open? You can analyse this by grouping the data by one of 
# the variables and then aggregating the results of the other column. Visually check 
# if there is a positive correlation or negative correlation or no correlation 
# between the variables

select bank_accounts_open,sum(credit_cards_held) as total_credit_cards 
from credit_card_data
group by bank_accounts_open
order by bank_accounts_open;

# There is strong negativ correlation between the number of bank accounts of customers and their credit cards.The more bank accounts customers 
# have,the less interested they are in credit cards

#Your managers are only interested in the customers with the following properties:

#Credit rating medium or high
#Credit cards held 2 or less
#Owns their own home
#Household size 3 or more

select *
from credit_card_data 
where credit_rating in ('medium','high')
and credit_cards_held <=2 and own_your_home = 'Yes'
and household_size >=3;

# For the rest of the things, they are not too concerned. Write a simple query to 
# find what are the options available for them? Can you filter the customers who 
# accepted the offers here?

select *
from credit_card_data 
where credit_rating in ('medium','high')
and credit_cards_held <=2 and own_your_home = 'Yes'
and household_size >=3
and offer_accepted like '%Y%';

# Your managers want to find out the list of customers whose average balance is less 
# than the average balance of all the customers in the database. Write a query to show 
# them the list of such customers. You might need to use a subquery for this problem

select customer_number,average_balance
from credit_card_data 
where average_balance < (select avg(average_balance) from credit_card_data);


create or replace view customers_below_avg_balance as
select customer_number,average_balance
from credit_card_data 
where average_balance < (select avg(average_balance) from credit_card_data);


# What is the number of people who accepted the offer vs number of people who did not?

select offer_accepted,count(*) as customer_count
from credit_card_data
group by offer_accepted;

# Your managers are more interested in customers with a credit rating of high or medium. What is the difference
# in average balances of the customers with high credit card rating and low credit card rating?

with 
high_rating as (
select round(avg(average_balance),2) as high_rating_avg_balance
from credit_card_data
where credit_rating = 'High'
),
low_rating as(
select round(avg(average_balance),2) as low_rating_avg_balance
from credit_card_data
where credit_rating = 'Low'
)
select 
high_rating_avg_balance,
low_rating_avg_balance,
round(high_rating_avg_balance - low_rating_avg_balance,2)
from high_rating, low_rating;


#In the database, which all types of communication (mailer_type) were used and with how many customers?

select mailer_type,count(*) as customer_count
from credit_card_data
group by mailer_type;

#Provide the details of the customer that is the 11th least Q1_balance in your database

with rank_of_customers as
(
select *,
dense_rank() over(order by balance_q1 asc) as rnk
from credit_card_data
)
select *
from rank_of_customers
where rnk = 11;














