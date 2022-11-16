#Exercise 9 work
setwd("~/test/Exercises/Biocomputing-Exercise9/")
library(ggplot2)

#problem 1
#load file containing to related variables
graph=read.table("variable.csv",header=TRUE,sep=",")

#use data to make scatter plot with trendine
ggplot(data=graph,aes(x=Length,y=Resistance))+xlab("Length(cm)")+ylab("Resistance(ohms)")+geom_point()
+stat_smooth(method="lm")+theme_classic()

#problem 2
#make data.txt a variable
data=read.table("data.txt",header=TRUE,sep=",")

#calculate means for each population and store as a vector
#first I split the data into its regions, then took the means separately
North=mean(data[data$region=="north",]$observations)
East=mean(data[data$region=="east",]$observations)
South=mean(data[data$region=="south",]$observations)
West=mean(data[data$region=="west",]$observations)

#make bar plot with means
means=data.frame(region=c("north","east","south","west"),mean=c(14.9952,15.2785,15.0346,14.9944))
ggplot(data=means,aes(x=region,y=mean))+geom_bar(stat="identity")+theme_bw()

#make a scatterplot
ggplot(data=data,aes(x=region,y=observations))+geom_point()+theme_bw()+geom_jitter(width=0.25)

#the bar and scatter plot tell very different stories because the bar plot only shows the mean
#for each population, and since the means are very similar among the different regions this data
#is not very meaningful when comparing the regions.  The scatter plot, especially with the geom_jitter
#function, shows where the clusters of data points are located and gives a better sense of how many
#observations were seen in each region, especially for south where the points are concentrated in
#two different regions, which we would not know from the bar plot.

