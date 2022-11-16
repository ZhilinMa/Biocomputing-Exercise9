library(ggplot2)

greek_data<-read.csv(file = "GreekDramaLength.csv", header = TRUE)
ggplot(data=greek_data,aes(x=Year,y=Word.Count)) + geom_point()+
  geom_smooth(method=lm, se=FALSE)

library(ggplot2)
plot_data<-read.table(file = "data.txt",sep=",", header=T, stringsAsFactors=F)
ggplot(plot_data, aes(x = region, y = observations)) +
  geom_bar(stat="identity")

ggplot(data=plot_data,aes(x=region,y=observations)) + geom_point()+
  geom_jitter()

#They actually do tell different stories in a way because 
#each region seems to have about the same amount of 
#observations. But the scatter plot shows how those 
#observations are distributed (east and west are even 
#while north is centralized and south is polarized).
#This is counterintuitive since you would think a bar graph
#would give you a better idea about data where the x-values
#are non-numerical.