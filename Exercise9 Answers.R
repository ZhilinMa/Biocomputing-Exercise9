#create Excel file comparing Height and Shoe size, then save this as a csv file
HSSdata = read.table("C:/Users/15135/Desktop/Exercise9/Biocomputing-Exercise9/HeightShoesize.csv", header=TRUE, sep =',')
#assume "ggplot2" is installed, then load the package
library(ggplot2)
ggplot(data=HSSdata, aes(x=Height, y=ShoeSize)) + geom_point() + stat_smooth(method="lm") +theme_classic()
