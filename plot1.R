library(dplyr)
SCC <- readRDS("~/Desktop/data/Source_Classification_Code.rds")
NEI <- readRDS("~/Desktop/data/summarySCC_PM25.rds")

a<-group_by(NEI,year)
b<-summarise(a,sum(Emissions))
png("plot1.png",width=450,height=450)
plot(b$year,b$`sum(Emissions)`,type='l',xlab="Year",ylab="Total Emissions")
dev.off()