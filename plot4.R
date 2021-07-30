library(dplyr)
library(ggplot2)

SCC <- readRDS("~/Desktop/data/Source_Classification_Code.rds")
NEI <- readRDS("~/Desktop/data/summarySCC_PM25.rds")

a<-filter(SCC,grepl("^Fuel(.*)Coal",EI.Sector))
b<-as.character(a$SCC)
c<-filter(NEI,SCC%in%b)
d<-group_by(c,year)
e<-summarise(d,sum(Emissions))
e<-as.data.frame(e)
colnames(e)[2]<-"Emissions"

png("plot4.png",width=450,height=450)
g<-ggplot(e,aes(year,Emissions))
g+geom_point(color="steelblue",size=4,alpha=1/2)+geom_line()
dev.off()
