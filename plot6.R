library(dplyr)
library(ggplot2)

SCC <- readRDS("~/Desktop/data/Source_Classification_Code.rds")
NEI <- readRDS("~/Desktop/data/summarySCC_PM25.rds")

a<-filter(SCC,grepl("^Mobile(.*)Vehicles",EI.Sector),) # filter source data 
b<-as.character(a$SCC)
c<-filter(NEI,SCC%in%b) # mobile data across the country
Baltimore<-filter(c,fips=="24510") # mobile data in Baltimore city
Los<-filter(c,fips=="06037")# mobile data in Los Angeles

Baltimore1<-group_by(Baltimore,year)
Baltimore2<-as.data.frame(summarise(Baltimore1,sum(Emissions)))
colnames(Baltimore2)[2]<-"Emissions"


Los1<-group_by(Los,year)
Los2<-as.data.frame(summarise(Los1,sum(Emissions)))
colnames(Los2)[2]<-"Emissions"

f<-rep(0:1,each=4)
f<-factor(f,labels=c("Baltimore","Los Angeles"))
data<-rbind(Baltimore2,Los2)
data$label<-f

png("plot6.png",height=480,width=480)
qplot(year,Emissions,data=data,facets=.~label,aes(color=label))
dev.off()