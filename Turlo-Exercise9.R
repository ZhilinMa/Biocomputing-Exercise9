#Turlo Biocomputing Exercise9
#Reminder to self: set pwd to Biocomputing-Exercise9

library(ggplot2)

#Q1: Find some data on two variables that you would expect to be related to each other
  #from own research, daily life, internet
  #enter data into a text file; save as a text file
  #write a script that loads this text file and produces a scatter plot that includes trend lines
primers=read.csv("primerdata.csv", header=TRUE, sep=',')
write.table(primers, file="primers.txt")

ggplot(primers, aes(x=PCR.f.Length, y=PCR.f.Tm, col=Result))+
  geom_point(shape=20)+
  stat_smooth(method="lm") +
  theme_classic()

#This data is a reflection of PCRs that I ran, referencing the forward primer melting temp
#and length as a function of one another; coloring them by whether or not the PCR was successful,
#and using linear trendlines to display whether or not there are trends in success (it seems lower Tm primers did worse)

#Q2: Given data in "data.txt", write a script that generates two figures
data=read.csv('data.txt', header=TRUE, sep=',')
  #Figure 1: Bar plot of the means of the four populations
ggplot(data, aes(x=region, y=observations)) +
  stat_summary(geom="bar", fun.y="mean") +
  stat_summary(geom="errorbar", fun.data = "mean_se", width=0.3) +
  ylab("Mean Observation") +
  xlab("Regions") +
  theme_bw()

  #Figure 2: Scatter plot of all observations
    #may want to "jitter" (geom_jitter()) points to see all observations
    #alpha argument in geom_scatterplot() to 0.1
ggplot(data=data, aes(x=region, y=observations)) +
  geom_point(shape=22) +
       geom_jitter()

  #As comment: answer this, do the bar and scatter plots tell different stories, why?
      #Yes, they tell different stories because:
          #Bar plot: details the means, and shows that the observations are approximately the same between groups, but loses detailed information about groups
          #Scatter plot: details frequency of different observations within those populations. 