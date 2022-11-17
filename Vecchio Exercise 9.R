# Exercise 9
# Joe Vecchio

#Number 1
setwd("~/Desktop") # Set Working directory to path containing data file
bca <- read.csv("Nanosight BCA Western Blot.csv") # Assign variable name to file
write.table(bca, file = "bca.txt", sep = "\t", quote = FALSE) # Renamed filed .txt and separated by tab
read.table("bca.txt") # Read table

library(ggplot2)
ggplot(data = bca,
       aes(x = BSAConc, y = A562)) +
  geom_point() + geom_smooth(se=F)

#Number 2
data <- read.csv("data.txt", header = TRUE, stringsAsFactors = FALSE)
ggplot(data, aes(x = region, y = observations)) + geom_boxplot() + xlab("Region") + ylab("Observations")

ggplot(data, aes(x = region, y = observations)) + geom_jitter() + theme(axis.text.x = element_text(angle=65, vjust=0.6))

# Yes! The scatter plot shows information that would not be gleaned from the box plot, particularly the southern region. 
# The box plot shows an average of observations around 12 while the scatter plot shows two clusterings of the data not reflected in the box plot.
