#importing data from excel file

library(readxl)
transaction_data <- read_excel("C:/projects_dip/Quantium_internship/transaction_data.xlsx", 
                               col_types = c("numeric", "numeric", "numeric", 
                                             "numeric", "numeric", "text", "numeric", 
                                             "numeric", "text", "numeric", "text", 
                                             "text"))
View(transaction_data)


attach(transaction_data)

head(transaction_data)

min(transaction_data$TOT_SALES)

install.packages("tidyverse")
library(tidyverse)

install.packages("stringr")
library(stringr)

install.packages("dplyr")
library(dplyr)

# creating dataframe to store split columns brandname and chips type

chips_sale <- transaction_data %>% separate(PROD_NAME,c("BRAND_NAME","CHIPS_TYPE")," ")
view(chips_sale)

#summurising data using pipes

chips_summary_brand <- chips_sale %>% 
  group_by(BRAND_NAME) %>% 
  summarise(Average_sale = mean(TOT_SALES),
            Average_package_weight = mean(WEIGHT_GRAMS))
            

view(chips_summary_brand)

chips_summary_customer_type <- chips_sale %>% 
  group_by(PREMIUM_CUSTOMER) %>% 
  summarise(Average_sale = mean(TOT_SALES)) %>% 
  drop_na()

view(chips_summary_customer_type)


chips_summary_lifestage <- chips_sale %>% 
  group_by(LIFESTAGE) %>% 
  summarise(Average_sale = mean(TOT_SALES)) %>% 
  drop_na()

view(chips_summary_lifestage)

# visualizations

install.packages("ggplot2")
library(ggplot2)

# finding popular brand in chips

ggplot(data=chips_summary_brand)+ geom_point(mapping = 
                                               aes(x = BRAND_NAME,
                                               y = Average_sale,
                                               color = Average_sale))+
                                               theme(axis.text.x=element_text(angle=90))+
                                              labs(title = "Popular Brand", y= "Sale")

# finding relation between package size and sale

ggplot(data=chips_summary_brand)+ geom_point(mapping = 
                                               aes(x = Average_package_weight,
                                                   y = Average_sale ,
                                                   color = Average_sale))+
  theme(axis.text.x=element_text(angle=90))+
  labs(title = "Trends between Package size and Sale", x= "Package size", y= "Sale")

# what stage of people buy more chips

ggplot(data=chips_summary_lifestage)+ geom_point(mapping = 
                                               aes(x = LIFESTAGE,y= Average_sale,
                                                   color = Average_sale))+
  theme(axis.text.x=element_text(angle=45))+
  labs(title = "Life Stage vs Sale", y= "Sale")

# Most of the sale is coming form mainstream type of customers.

ggplot(data=chips_summary_customer_type)+ geom_point(mapping = 
                                               aes(x = PREMIUM_CUSTOMER,
                                                   y = Average_sale,
                                                   color = Average_sale))+
  theme(axis.text.x=element_text(angle=45))+
  labs(title = "Customer Type vs Sale", x= "Customer Type", y= "Sale")


# Task 2 
library(lubridate)
ymd("DATE")

glimpse("DATE")

date(DATE)

chip_sale_date <- chips_sale %>%
                  as.Date(DATE)

# summarizing data of stores 77,86,87

head(transaction_data)
colnames(transaction_data)

install.packages("tidyverse")
library(tidyverse)

install.packages("stringr")
library(stringr)

install.packages("dplyr")
library(dplyr)

# creating data frame to store split columns brand name and chips type

chips_sale <- transaction_data %>% separate(PROD_NAME,c("BRAND_NAME","CHIPS_TYPE")," ")

view(chips_sale)

store_77 <- chips_sale %>%
  group_by(STORE_NBR,DATE) %>% 
  summarise(Average_sale = mean(TOT_SALES)) %>% 
  filter(STORE_NBR==77)

view(store_77)

store_86 <- chips_sale %>%
  group_by(STORE_NBR,DATE) %>% 
  summarise(Average_sale = mean(TOT_SALES)) %>% 
  filter(STORE_NBR==86)

view(store_86)


store_87 <- chips_sale %>%
  group_by(STORE_NBR,DATE) %>% 
  summarise(Average_sale = mean(TOT_SALES)) %>% 
  filter(STORE_NBR==87)

view(store_87)

# visualizations

install.packages("ggplot2")
library(ggplot2)

# finding popular brand in chips

ggplot(data=store_77)+ geom_point(mapping =  aes(x = DATE,
                                                 y = Average_sale,
                                                 color = Average_sale))+
  theme(axis.text.x=element_text(angle=90))+
  labs(title = "Store 77", y= "Sale")


ggplot(data=store_86)+ geom_point(mapping =  aes(x = DATE,
                                                 y = Average_sale,
                                                 color = Average_sale))+
  theme(axis.text.x=element_text(angle=90))+
  labs(title = "Store 86", y= "Sale")

ggplot(data=store_87)+ geom_point(mapping =  aes(x = DATE,
                                                 y = Average_sale,
                                                 color = Average_sale))+
  theme(axis.text.x=element_text(angle=90))+
  labs(title = "Store 87", y= "Sale")



summary <- chips_sale %>%
  group_by(STORE_NBR,DATE) %>% 
  summarise(Average_sale = mean(TOT_SALES),minimum_sale = min(TOT_SALES)) 

view(summary)

ggplot(data=summary)+ geom_point(mapping =  aes(x = STORE_NBR,
                                                y = Average_sale,
                                                color = Average_sale))+
  theme(axis.text.x=element_text(angle=90))+
  labs(title = "Popular Brand", y= "Sale")


