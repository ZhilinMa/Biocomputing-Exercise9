#Exercise 9 
library(ggplot2)
setwd("~/Desktop/RStudio/Biocomputing-Exercise9")
#1
  #read in table and save as new variable
read.csv("Percent Mass Remaining.csv")->pmr
  #creation of y-values 

  #creation of plot
ggplot(pmr, aes(x=Days, y=Urban.Terrestrial))+
         geom_point()+
         geom_smooth(method= lm, color="black")+
  theme_classic()+
  xlab("Days")+
  ylab("Percent Mass Remaining")
            
#2
  #read in table
data<-read.table("data.txt", header=TRUE)
  #a barplot of the means of the four populations.
ggplot(data, aes(x=region, y=X..observations., color=region))+
  stat_summary(geom="bar", fun="mean")+
  ylab("Mean Observations")+
  xlab("Region")+
  theme_bw()
  #scatter plot 
ggplot(data, aes(x=region, y=X..observations., color=region))+
  geom_jitter()+
  ylab("Mean Observations")+
  xlab("Region")
#the scatter/jitter plot shows where the majority of observations were made for each region, while the bar graph just shows the mean values for each region. Therefore, the graphs tell different stories about the same data and the jitter plot is more informative.