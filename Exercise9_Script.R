#set working directory
setwd("~/Desktop/biocomputing-2022/Biocomputing-Exercise9")

#1. Create a scatter plot of a dataset with two variables that produces a trend line
#load file
chicago<-read.csv(file="chicago.csv", header=TRUE)

#create scatter plot that includes a trend line
ggplot(data=chicago,
       mapping=aes(x=Fires.per.1000.Housing.Units, y=Thefts.per.1000.population.within.same.zip.code.area) ) +
  geom_point()+
  xlab("Fires.per.1000.Housing.Units") +
  ylab("Thefts.per.1000.population.within.same.zip.code.area") +
  stat_smooth(method="lm") +
  theme_classic()

#2. Write a script that generates two figures that summarize the data in data.txt

#load file
population_data<-read.table(file="data.txt",header=TRUE)

#show a barplot of the means of the four populations
ggplot(data=population_data,mapping=aes(x=region, y=observations)) +
  stat_summary(fun.data=mean_sdl,geom="bar") +
  xlab("region") + ylab("mean of observations") +
  theme_classic()

#show a scatter plot of all the observations
ggplot(data=population_data,
       mapping=aes(x=region, y=observations)) +
  geom_point() +
  geom_jitter() + 
  xlab("region") + ylab("observations") +
  stat_smooth(method="lm") +
  theme_classic()

##do the bar and scatter plots tell you different stories? why?
#Yes - the bar plot only displays the means for each region, while the scatter plot displays all the observations
#The bar plot only shows the data summed up in one point per region, which shows they are more similar to each other than they actually are
#The scatter plot shows the actual variation that occurs among the points, telling a different story
#Overall shows how bar plots can graph only one data point for a region while a scatter plot can graph many
  




