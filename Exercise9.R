# Problem 1
# Data for cumulative rushing yards throughout the season so far
# Derrick Henry vs. Nick Chubb
# https://www.espn.com/nfl/player/gamelog/_/id/3043078/derrick-henry
# https://www.espn.com/nfl/player/gamelog/_/id/3128720/nick-chubb
# I chose this data because it can easily be updated as the season continues.

# set working directory
setwd("~/Biocomputing/Biocomputing-Exercise9/")

# Set up libraries for ggplot2 and cowplot
library(ggplot2)
library(cowplot)

# create variable for data
yards <- read.table("rushingyards.txt", header = TRUE, stringsAsFactors = FALSE)

# create scatterplot for data in rushingyards.txt
ggplot(data = yards, aes(x = Week, y = RushingYards, color = as.factor(Player))) + 
  geom_point() + ylab("Total Rushing Yards") + theme_bw() + 
  scale_color_manual(values = c('red','blue')) +
  labs(color = "Players") + stat_smooth(method="lm") +
  ggtitle("Cumulative Rushing Yards")

# I assumed the plot would be more informative if each player had their own trend line.
# This is the scatterplot with just one trend line:
# ggplot(data = yards, aes(x = Week, y = RushingYards)) + 
#  geom_point() + ylab("Total Rushing Yards") + theme_bw() + 
#  labs(color = "Players") + stat_smooth(method="lm") +
#  ggtitle("Cumulative Rushing Yards")

# Problem 2
# set data.txt to a variable
dat <- read.table("data.txt", header = TRUE, stringsAsFactors = FALSE, sep = ",")

# Create barplot for means of the 4 regions
ggplot(data = dat, aes(region,observations,fill=region)) +
  geom_bar(position = "dodge", stat = "summary", fun = "mean") + 
  xlab("Region") + ylab("Observation Mean") + 
  ggtitle("Observation Mean for the 4 Regions") +
  scale_fill_manual(values = c('red','green','blue','purple'))

# Create scatterplot of all observations
ggplot(data = dat, aes(x = region, y = observations, color = as.factor(region))) +
  geom_jitter() + xlab("Region") + ylab("Observations") +
  ggtitle("Observations for 4 Regions") + labs(color = "Regions")

# Based on the bar plot, the mean observations are all right around 15.
# However, the scatter plot makes it seem like the South has a higher mean
# observation because it looks like more data points are in the 20-30 range.
# The scatterplot makes it seem like the means are more spread out since the
# data points are all over the place. East and West have points all the way
# from 0 to 30. North has all of its points in the 10 to 20 range, and South
# has points either around 5 or between 20 and 30. As a result, the barplot
# gives us a better summary when comparing each region while the scatterplot
# highlights the differences in each region in terms of data collected (range).