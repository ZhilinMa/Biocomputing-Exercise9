#set working directory
setwd("~/Desktop/biocomputing-2022/Biocomputing-Exercise9")

#1. Create a scatter plot of a dataset with two variables that produces a trend line
#load file
chicago<-read.csv(file="chicago.csv", header=TRUE)
#create scatter plot that includes a trend line
ggplot(data=chicago,
       aes(x=Fires.per.1000.Housing.Units, y=Thefts.per.1000.population.within.same.zip.code.area) ) +
  geom_point()+
  xlab("Fires.per.1000.Housing.Units") +
  ylab("Thefts.per.1000.population.within.same.zip.code.area") +
  stat_smooth(method="lm") +
  theme_classic()

