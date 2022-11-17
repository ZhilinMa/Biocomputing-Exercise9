setwd("~/Desktop/biocomputing/Biocomputing-Exercise9")
library(ggplot2)

# Problem 1
# produce scatter plot of my two variables with a trend line
vars = read.csv(file = "sleep_vs_grades.csv", header=TRUE)
ggplot(data = vars, aes(x = Sleep, y = GPA)) + 
        geom_point() +
        xlab("Sleep (hours)") + ylab("GPA") +
        stat_smooth(method="lm") +
        theme_classic()

# Problem 2
region_data = read.table("data.txt", header=TRUE, sep=",")

# barplot of means of each region
ggplot(data = region_data, aes(x = region, y = observations, fill = region)) +
        geom_bar(stat = "summary", fun = "mean") + 
        xlab("Region") + ylab("Observation Mean") + 
        theme_classic()

# scatter plot of all observations
ggplot(data = region_data, aes(x = region, y = observations)) + 
  geom_point() +
  xlab("Region") + ylab("Observations") + 
  geom_jitter() +
  theme_classic()

# The scatter and the bar plots tell different stories
# Since the bar plot only displays the mean for each region, it doesn't tell you anything about the variability within each region.
# The means of each region are very similar, so the bar plot does not give you much information
# The scatter plot allows you to see all of the individual observations within each region
# Therefore, the scatter plot allows you to see the variability within a region and gives a more complete picture of the data 