# chips data analysis

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

