setwd("~/Desktop/class materials/biocomputing/R_Unit/Biocomputing-Exercise9/")

library(ggplot2)
library(cowplot)

# QUESTION 1

# read in data
data <- read.table(file = 'bread_milk_prices.tsv', sep = '\t', header = TRUE)

# plot data with two different y variables
ggplot(data, aes(x=Year)) +
  geom_point(aes(y=milk_price, color="red")) +
  geom_point(aes(y=bread_price, color="blue")) +
  scale_color_manual(labels = c("bread", "milk"), values = c("blue", "red")) +
  theme_classic() +
  geom_smooth(method = "lm", aes(y=(milk_price+bread_price)/2)) +
  ylab("Prices of Milk and Bread Accounting for Inflation")



# QUESTION 2  
data2 <- read.table(file='data.txt', sep = ',', header = TRUE)

# bar plot

#  calculate means
north_mean = mean(data2[data2$region=="north",]$observations)
south_mean = mean(data2[data2$region=="south",]$observations)
east_mean  = mean(data2[data2$region=="east" ,]$observations)
west_mean  = mean(data2[data2$region=="west" ,]$observations)

#  add the means to a data fram
means = data.frame(region=c("north", "south", "east", "west"), 
                   mean=c(north_mean, south_mean, east_mean, west_mean))

#  plot with bar plot
ggplot(data=means, aes(x=region, y=mean)) + geom_bar(stat = "identity", width=0.5,fill="steelblue" ) + 
  theme_classic()


# scatter plot
ggplot(data=data2, aes(x=region, y=observations)) + geom_point() + theme_minimal() + geom_jitter()


# The bar and scatter plots do tell different stories.
# The bar graph leads us to beleive that all the averages are about the same, meaning there is nothing
# really significant to learn about the observations in the different regions.
# On the other hand, the scatter plot shows how variable the observations are, each reagion having a unique
# set of clusters that is lost when they are averaged.






