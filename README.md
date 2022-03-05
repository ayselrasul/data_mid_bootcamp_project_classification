
**Data Mid_bootcamp Project Classification**




## Table of contents
- Data.
- General information
- Objectives
- Technologies
- Business analytic approach
- Recommendations

## Data

The data set consists of information on 18,000 current bank customers in the study. These are the definitions of data points provided:

**Customer Number**: A sequential number assigned to the customers.

**Offer Accepted**: Did the customer accept (Yes) or reject (No) the offer 

**Reward**: The type of reward program offered for the card


**Mailer Type**: Letter or postcard
**Income Level**: Low, Medium or High

**#Bank Accounts Open**: How many non-credit-card accounts are held by the customer

**Overdraft Protection**: Does the customer have overdraft protection on their checking account(s) (Yes or No)

**Credit Rating**: Low, Medium or High


**#Credit Cards Held**: The number of credit cards held at the bank

**#Homes Owned**: The number of homes owned by the customer

**Household Size**: Number of individuals in the family

**Own Your Home**: Does the customer own their home? (Yes or No)

**Average Balance**: Average account balance (across all accounts over time)

**Q1, Q2, Q3 and Q4 Balance**: Average balance for each quarter in the last year
## General Information

Situation:

 Apart from the other banking and loan services, the bank also provides credit card services that are a very important source of revenue for the bank. The bank wants to understand the demographics and other characteristics of its customers that accept a credit card offer and that do not accept a credit card.
 
 Usually, the observational data for these kinds of problems is somewhat limited in that often the company sees only those who respond to an offer. To get around this, the bank designs a focused marketing study, with 18,000 current bank customers. This focused approach allows the bank to know who does and does not respond to the offer, and to use existing demographic data that is already available on each customer.



## Objectives

Build a model that will provide insight into why some bank customers accept credit card offers.
There are also other potential areas of opportunities that the bank wants to understand from the data.
Help the senior management to understand their customers better.
## Technologies

- MySQL
- Python
- Tableau

## Business analytic approach

### Data cleaning:

- Column headers were renamed
- There was few (less than 0.01% )Null values in Average Balance,Q1 Balance,Q2 Balance,Q3 Balance and Q4 Balance columns.I have dropped them from Data
- After transforming data to new csv file for SQL and Tableau **customer_number** column was dropped


### Data exploration:

- There was class imbalance in Offer Accepted, in Overdraft Protection, Homes Owned, Bank Accounts Open
- There was high collinearity between Average Balance - Q2 Balance and Average Balance - Q3 Balance
- Acceptance Rate has negative correlation with Income level, Credit Rating and Household size. 
- Whether the customers own their own home or not, have no influence on acceptance rate.
- Average Balance does not affect Acceptance Rate

### Data pre-prossing:

- Data was splitted into categorical and numerical data
- Numerical data was splitted into continious and discrete columns
- Data was splitted into target and features,train and test
- Continious columns were scaled
- Categorical columns were encoded
- Training dataset was balanced

### Data prediction:
- As classifing model Logistic Regression,KNN Classifier,Random Forest,Decision Tree models were used
- Baseline model performance with minimum tranformations was checked
- Collinearity removed and metrics checked,no significant improvement
- Numerical columns were transformed with log transformation,no significant improvement
- Adding some features improved Tree based models,LR remained constant,KNN score dropped a bit 
- Removing outliers decreased auc performance of tree based models,but increased KNN performance
- As final methods,removing outliers,adding features and balancing train data were selected,LR remained constant,KNN classifier and tree models increased

### Observation:

- In all methods LR remained constant,but still has highest score,so it is best model that fits data
-
-
