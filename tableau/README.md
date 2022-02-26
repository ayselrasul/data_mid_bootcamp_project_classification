  ## **Tableau-Classification questions and answers**
  **Questions**:

1. Convert the necessary measures to dimensions (the variables that are categorical in nature)

**Credit cards hold,Homes owned,Bank accounts open,Household size** columns are converted to dimension.

**Average balance,Q1 balance,Q2 balance,Q3 balance and Q4 balance** columns are converted to continious

2. Check the imbalance in the dataset by looking at the number of people who accepted the offer vs. people who did not accept the offer. Add the counts as labels on the plots

Do a quick table calculation on the previous plot to check percentage of total for both yes and no.

Now we will try to analyze certain characteristics / the differences between the people who accepted the offer vs people who did not accept the offer. Use different sheets for each of the plots below.

Plot average Q1 balance vs Offer Accepted. Provide the values of averages as labels.
Plot average Q2 balance vs Offer Accepted. Provide the values of averages as labels.
Plot average Q3 balance vs Offer Accepted. Provide the values of averages as labels.
Plot average Q4 balance vs Offer Accepted. Provide the values of averages as labels.
You used different sheets to create the individual plots mentioned before. Now we want to see all the four plots together on the same sheet. The plots should have the same detail as before. Do you observe any trend here.

Now for all the plots, change the style of the plot from bar chart to a line chart. Do you think it improves the visibility of the data.
Consider a similar analysis for Household Size vs average balances for each quarter. You would observe a huge jump in average balance from Q1 to Q2 for households with size 8.

Try and explain that jump. Hint: Check the number of records we have for such customers. Do you see any anomaly.
Now we want to see how some of the other features In the data might have affected responses from the people. For these we will first start by creating a cross tab. A cross tab is simply a table between two categorical features with some metric of importance filling up the table.

Create a cross tab between Offer Accepted and Overdraft Protection and fill the table with number of records. Do you observe any trend here?
Create a cross tab between Offer Accepted and Mailer Type and fill the table with number of records. Do you observe any trend here?
Create a cross tab between Offer Accepted and Credit Rating and fill the table with number of records. Rearrange the column credit rating from low to high. Do you observe any trend here?
Based on the average balance for each customer, create four buckets : Category A, Category B, Category C, and Category C. Conduct a further deep dive into each of the categories and identify the possible trends.
(my_image)[../images/acceptance-count.png]  
