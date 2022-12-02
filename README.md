# Quntium-Data-Analytics-Virtual-Internship
Completed this project as a part of Quantium Data Analytics Virtual internship.

Tools used : Excel , RStudio

Chip Data Analysis

Business Task : In order to increase the sale revenue let’s Understand types of customers who are frequent shoppers of chips and their purchasing behavior within the region.

Stakeholders : category manager for chips , manager, analytics team

Goals : 
Increase revenue.
Better understand customer behavior.
Which category of customers buy more chips?

Prepare data for Analysis:
Data Cleaning :

Check for inconsistencies in data. 

Transaction Data : 

Date column is changed from Number to Date format.
Number formatting.

Added a new column WEIGHT_GRAMS separated from the PROD_NAME column.

Excel Formula to separate text new PROD_NAME : 
	=LEFT(F2,MIN(IFERROR(FIND({0,1,2,3,4,5,6,7,8,9},F2),""))-1)
  
Excel Formula to separate WEIGHT_GRAMS : 
	=MID(F2,MIN(IFERROR(FIND({0,1,2,3,4,5,6,7,8,9},F2),"")),3)

VLOOKUP to merge purchase_behavior data into transaction_data

LIFESTAGE column : 

=VLOOKUP(C2,[purchase_behaviour.xlsx]QVI_purchase_behaviour!A2:C72638,2,FALSE)

PREMIUM CUSTOMER:

=VLOOKUP(C2,[purchase_behaviour.xlsx]QVI_purchase_behaviour!A2:C72638,3,FALSE)

Importing Excel dataset into RStudio for analysis.


Conclusion : 

Stock up on the Doritos brand as it is more popular.
Big package sizes have more sales, we should increase production of bigger packages.
Mid-age singles or couples buy more chips, we should target this life stage in advertisements.
Most of the sale comes from the Mainstream type of customer.

