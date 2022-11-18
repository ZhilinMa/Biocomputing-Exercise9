#set working directory
setwd("~/Desktop/BIOS60125/Biocomputing-Exercise9/")
library(ggplot2)
#Assiganment1

#Write a table
Days <- 1:7
Sleep_hours <- c("5.2","4.1","5.3","6.2","7.3","7.2","7.6")

DaySleepSheet <- data.frame(Days,Sleep_hours)
write.table(DaySleepSheet,file = 'sleep.txt')

ggplot(data = DaySleepSheet,
        aes(x = Days, y = Sleep_hours)) +
    geom_point() +
    xlab("days count ") +
    ylab("sleep hours (hours/day)") +
    stat_smooth(method="lm")+
    theme_classic()

#Assignment2
population <- read.table("data.txt", header = TRUE, sep = ",")
ggplot(population,
        mapping = aes(x=region, y=observations)) +
  stat_summary(fun="mean",geom ="bar") +
  xlab("Region") +
  ylab("Mean of Observation") +
  theme_classic()

ggplot(population,
        aes(x = region, y = observations)) +
    geom_jitter() +
    xlab("Region") +
    ylab("Observations") +
    theme_classic()

#The bar and scatter plots tell different stories
#Bar plot summarizes data by just giving means of each region, which makes them quite similar
#While the scatter plot shows every observation, which tells a more completed story
#We can easily see the differences based with the scatter plot
    

    