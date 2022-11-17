###Exercise 09 Andrew Lupinski 

##Question 1
#I will be using a subset of data I worked with back in undergrad based on hogweed distribution near roads.
hogweed<-read.table("Hogweed_Subset_Biocomputing2022.txt", header = TRUE)
str(hogweed)
colnames(hogweed)
#I will be making a scatterplot comparing the concentration of nitrate to the soil water content.
#This graph presents a logical question to see if there is any trend between these two variables
#with reguards to the hogweed. 

ggplot(data = hogweed,
       aes(x = H2O , y = NO3)) +
  geom_point() +
  ylab("nitrate concentration (mg/l)") +
  xlab("soil water content (%)") +
  stat_smooth(method="lm") +
  theme_classic()
#The presence of a almost horizontal trend line suggests that increases in either variable has no 
#clear effect on the other.
   
##Question 2 

points = read.table("data.txt", header=TRUE, sep=",", stringsAsFactors=FALSE)
points

#First, show a barplot of the means of the four populations

ggplot(points,aes(x=region,y=observations, fill=region))+
  stat_summary(geom="bar",fun="mean")+
  xlab("Region")+
  ylab("Observations")+
  theme_classic()


#Second, show a scatter plot of all of the observations

ggplot(points,aes(region, observations, color=region)) + geom_jitter() + theme_classic() + ylim(0,40)

#- Do the bar and scatter plots tell you different stories? Why?
#The bar and scatter plots tell different stories. With the bar plot, all the information 
#presented is strictly the mean value for each region. So the data visually looks to be the same
#between all four regions. This differs from the scatter plot
#since the scatter plot shows all individual observations for each region. That means
#you are able to look at more specific groups of clustering among observations in the scatter plot.
#It spreads out your data to more clearly see the variation within the data.
#This adds an extra layer of detail to your data compared to only observing means in the bar plot.
