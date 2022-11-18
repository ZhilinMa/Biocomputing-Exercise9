# Exercise 9 - Carol Moreira

# Find some data on two variables that you would expect to be related to each
# other. These data can come from your own research, your daily life, or the 
# internet. Enter those data into a text file or Excel and then save a text file,
# and write a script that loads this text file and produces a scatter plot of 
# those two variables that includes a trend line.

# First I found the data on Wikipedia and created my data frame with the Year and
# TotalSales_US variables. Then I used the function write.table to create my txt
# file.

> Year <- c("2016", "2014", "2013", "2020", "2018", "2009", "2011", "2008")
TotalSales_US <- c('628,00', '763,000','776,000', '1,132,000','1,148,000', 
                   '1,640,000', '2,420,000', '4,900,000')
> LadyGagaSales <- data.frame(Year, TotalSales_US)
> write.table(LadyGagaSales, file='~/Desktop/LGsales.txt')

# Now, I'm loading my txt file and the ggplot package

> LGsales <- read.table("LGsales.txt")
> library(ggplot2)

# Producing the sccatter plot of my two variables and including a trend line
> ggplot(LGsales_sorted, aes(x=Year, y=TotalSales_US)) +
        geom_point(size=2, shape=23) +
        geom_smooth(method=lm)

# Given the data in “data.txt”. Write a script that generates two figures that 
# sumamrize the data. First, show a barplot of the means of the four populations. 
# Second, show a scatter plot of all of the observations. You may want to “jitter”
# the points (geom_jitter()) to make it easier to see all of the observations 
# within a population in your scatter plot. Alternatively, you could also try 
# setting the alpha argument in geom_scatterplot() to 0.1. 
# Answer the following questions as a comment in your R script - 
# Do the bar and scatter plots tell you different stories? Why?


> library(ggplot2)
> data <- read.delim("data.txt", sep = ',')
> table(data$region)
> reg1 <- data[1:1000,]
> reg2 <- data[1001:2000,]
> reg3 <- data[2001:3000,]
> reg4 <- data[3001:4000,]
> > north <- mean(reg1$observations)
> east <- mean(reg2$observations)
> south <- mean(reg3$observations)
> west <- mean (reg4$observations)
> > region <- c("east", "north", "south", "west")
> popmean <- c("15.2785277917794", "14.9952172311338", "15.0346337727659",
               "14.9944251014502")
> meansdf <- data.frame(region, popmean)
> ggplot(data=meansdf, aes(x=region, y=popmean)) +
  +     geom_bar(stat="identity", width=0.5)
> ggplot(data, aes(x=region, y=observations)) +
  +         geom_point(size=2, shape=20) +
  +     geom_jitter()

# Answer: Yes, the plots tell different stories. When we plot the mean, we're 
# seeing only the central number of a set of observtions. With the scatter plot
# of all observations, we have a better idea of the big picture.