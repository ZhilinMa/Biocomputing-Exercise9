# Laurel Lown Exercise 9 - Plotting

rm(list = ls())
setwd("/Users/laurellown/Documents/PhD/fall_22/intro_to_biocomputing/exercises/Biocomputing-Exercise9")
library(ggplot2)

# 1. Script to load text file, produce scatter plot with trendline
iris=read.table("iris.csv",header=TRUE,sep=',')
ggplot(iris, aes(x=Sepal.Length,y=Petal.Length))+
  xlab("Sepal Length")+
  ylab("Petal Length")+
  theme_classic()+
  stat_smooth(method='lm')+
  geom_point()
  
# 2. Two figures to summarize data in data.txt
data=read.table("data.txt",header=TRUE,sep=",")

# A. Barplot of means of the 4 populations
ggplot(data, aes(x=region,y=observations))+
  stat_summary(geom="bar",fun="mean")+
  xlab("Region")+
  ylab("Observations")+
  theme_classic()
  
# B. Scatter plot of all the observations
ggplot(data,aes(x=region,y=observations,color=region))+
  geom_jitter()+
  theme_classic()+
  ylim(0,40)
  
# Q. Do the bar and scatter plots tell you different stories? Why?
# The scatter plot shows the individual observations per region, while
# the barplot only shows one data point per region (the mean).



