#Number 1
#create Excel file comparing Height and Shoe size, then save this as a csv file
HSSdata = read.table("C:/Users/15135/Desktop/Exercise9/Biocomputing-Exercise9/HeightShoesize.csv", header=TRUE, sep =',')
#assume "ggplot2" is installed, then load the package
library(ggplot2)
ggplot(data=HSSdata, aes(x=Height, y=ShoeSize)) + geom_point() +   stat_smooth(method="lm") + theme_classic()
#Created the plot of the two variable data with an added trend line


#Number 2
#make the bar plot
#first read in the values
data = read.table("C:/Users/15135/Desktop/Exercise9/Biocomputing-Exercise9/data.txt", header=TRUE, sep =',')
ggplot(data, aes(x=region, y=observations)) + stat_summary(geom="bar", fun="mean") + stat_summary(geom="errorbar", fun.data = "mean_se", width = .3)

#make the scatter plot
ggplot(data, aes(x=region, y=observations)) + geom_jitter()


#Answer: DO the bar and scatter plots tell you different stories?
#I would say yes the plots do tell different stories. The barplot with the means of the four regions are extremely similar (as seen in the graph). I also chose to display the standard deviations in the graph, and on the bar plot, these deviations do not seem to be too large or different from another. Thus, the bar plot displays that the data for each region is the same/very similar.
#In contrast, the scatterplot shows much greater ranges in values. East and west have large ranges, with east more concentrated. South is separated into two different groups of observations (which cannot be seen by the barplot). Finally, north is very concentrated around 15. Thus, the differences in the data between regions (by range and deviations) are not shown in the barplot.

