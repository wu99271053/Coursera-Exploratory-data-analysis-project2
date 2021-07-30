library(dplyr)
library(ggplot2)

SCC <- readRDS("~/Desktop/data/Source_Classification_Code.rds")
NEI <- readRDS("~/Desktop/data/summarySCC_PM25.rds")

a<-group_by(NEI,year,type)
b<-summarise(a,sum(Emissions))
colnames(b)[3]<-"Emissions"
b<-as.data.frame(b)

png("plot3.png",width=450,height=450)
g<-ggplot(b,aes(year,Emissions))
g+geom_point(aes(color=type))+geom_line(aes(color=type))
dev.off()