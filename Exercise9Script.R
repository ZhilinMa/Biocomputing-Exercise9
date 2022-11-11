#this script is my work for Biocomputing Exercise 9

####Importing Data and libraries####
setwd("/Users/kevinbuck/Desktop/Biocomputing/Exercises/Biocomputing-Exercise9")
library(ggplot2)
deerData <- read.table(file="deerData.txt",sep=",",dec=".")
prob2Data <- read.table(file="data.txt", sep=",",header=T)

####Problem 1: Plotting my Deer Data w Trendline####
ggplot(data=deerData,aes(y=deer.pop,x=island.size)) +geom_point(col="blue") +
  theme_classic() + xlab("Island Size (Mi^2)") + stat_smooth(method="lm",col="green") +
  ylab("Deer Population (# of Individuals)") + ggtitle("Island Deer Subpopulations")
####Problem 2: Plot info from Data.txt in a bar plot and a scatter plot####

#plotting barplot with means
Prob2Means <- c("north"=mean(prob2Data[prob2Data[,"region"]=="north","observations"]),
                "south"= mean(prob2Data[prob2Data[,"region"]=="south","observations"]),
                "east" = mean(prob2Data[prob2Data[,"region"]=="east","observations"]),
                "west" = mean(prob2Data[prob2Data[,"region"]=="west","observations"])
                )
regions.list <- c("north","south","east","west")
means.df <- data.frame(region=regions.list,mean=Prob2Means)
ggplot(data=means.df,aes(y=mean,x=region))+geom_bar(stat="identity")

#plotting boxplot that shows means (not sure if this is what you meant)
ggplot(data=prob2Data,aes(y=observations,x=region))+geom_boxplot()

#making a scatterplot of the data 2 different ways
ggplot(data=prob2Data,aes(y=observations,x=region))+geom_jitter()
ggplot(data=prob2Data,aes(y=observations,x=region))+geom_point(alpha=0.1)

# the bar plot and boxplot tell a different story than the scatterplot, because they show the mean
# which makes the data look very similar when only mean is compared. However, the data, particularly
#the north and south data, has great variation with distribution and standard deviation, which is why
# also viewing the jitter and scatter plots is the best way to see the data here (you get to witness
# the dispersion)

