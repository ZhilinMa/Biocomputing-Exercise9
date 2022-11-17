setwd("~/Desktop/biocomputing/git_exercises/Biocomputing-Exercise9")
install.packages("ggplot2")
library(ggplot2)
#Part 1
#Data Sources: https://www.uspto.gov/web/offices/ac/ido/oeip/taf/us_stat.htm
#https://www.thebalancemoney.com/us-gdp-by-year-3305543
#I thought that GDP and patent applications might have some relation from year to year, so 
#we're going to find out

#load the data into R dataframe
gdppa <- read.csv("GDP_vs_Patents.csv")

#plot the data as a scatter plot with a trend line
ggplot(gdppa, aes (x=Total.Patent.Applications, y=GDP.Growth.Rate)) + geom_point() + 
  xlab("Total Patent Applications (Thousands)") + ylab("GDP Growth Rate (%)") +
  ggtitle("Part 1: GDP Growth vs. Total Patent Applications Each Year") + stat_smooth(method="lm") 


#Part 2 - bar plot of means

#read in data
datadf <- read.csv("data.txt")
#find means for each region
means_list <-c(mean(datadf[datadf[,1]=="north",]$observations), mean(datadf[datadf[,1]=="south",]$observations), mean(datadf[datadf[,1]=="east",]$observations), mean(datadf[datadf[,1]=="west",]$observations))

#list region names (to use as x value)
regionnames <- c("north", "south", "east", "west")

#turn the means of the data into a data frame
plotdata <- data.frame(row.names = regionnames, mean_observations = means_list)

#plot the data frame of the means as a bar graph by region
ggplot(data=plotdata, aes(x=regionnames, y = mean_observations)) +
  geom_bar(fill = "#000000", width = 0.8, stat = "identity") + xlab("Region") + ylab("Average") +
  ggtitle("Part 2 Bar: Average of Observations in Each Region") +
  coord_cartesian(ylim = c(14, 15.5))

#Part 2 - scatter plot of data
#go back to the original data frame and plot the data as a scatter plot by region, using
#jitter to make everything visible even though there is a lot of overlapping data
ggplot(data=datadf, aes(x=region, y = observations)) +
  geom_jitter(fill = "#D6B3F9") + xlab("Region") + ylab("Observation") +
  ggtitle("Part 2 Scatter: Observations in Each Region")

#The bar and scatter plots tell very different stories about the data.  Based on the bar plot,
#you would assume that the data was roughly similar in all regions, since the means are almost
#identical.  The scatter plot shows that the distribution, however, is hugely different from
#region to region.  The bar plot of means gives you no information about distribution.
