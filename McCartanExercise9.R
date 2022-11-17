# set working directory
setwd("/Users/annamccartan/Google Drive/My Drive/School/Fall 2022/Biocomputing/R/Biocomputing-Exercise9")
# load package
library(ggplot2)

# Challenge 1
# load data from twovars.txt file
insta_data=read.table("twovars.txt", header=TRUE, sep="\t")
# create scatter plot
ggplot(data=insta_data, 
       aes(x=instafollowers, y=instaposts)) +
  geom_point() +
  xlab("Number of Instagram Followers") +
  ylab("Number of Instagram Posts") +
  theme_classic() +
  # add linear trendline
  geom_smooth(method="lm")

# Challenge 2
# load data from data.txt file
chal2data=read.table("data.txt", header=TRUE, sep=",")
# find mean observation value for each region
meanvalues=aggregate(chal2data$observations, list(chal2data$region), FUN=mean)
meanvalues
# show barplot of means for 4 populations
ggplot(chal2data, aes(x=region, y=observations)) +
  stat_summary(geom="bar", fun="mean") +
  ylab("Mean Observation") +
  xlab("Region") +
  theme_classic()
# show scatter plot of all observations
ggplot(data=chal2data, 
       aes(x=region, y=observations)) +
  geom_point() +
  geom_jitter()
  theme_classic()
  
# The bar and scatter plots tell different stories.
# Because the mean observations are all very close together, the bar graph provides limited information.
# There is not much variation between the four bars.
# In contrast, the scatter plot displays all of the observations.
# It therefore captures the intrinsic variation in the population, not just the overall mean.
# The scatter plot tells a more complete story than the bar plot.