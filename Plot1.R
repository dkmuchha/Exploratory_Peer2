## Reading RDS files to fetch data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Aggregate data to plot graph
aggregateDF <- aggregate(NEI$Emissions ~ NEI$year, NEI, sum)
colnames(aggregateDF) <- c("Year", "Emissions")

## Creating png file and plotting graph
png(filename = "plot1.png",width = 480, height = 480, units = "px")
## Do not print scientific notations
options(scipen=999)
## Adjust margin
par(mar=c(6,6,2,1), mgp=c(5,1,0), las=1)
plot(testNew$Year,testNew$Emissions, xaxt="n", pch=20, xlab="Years", ylab="Emission (Ton)", main="Emission Decreased")
axis(1, at=seq(1999,2009,by=3))
## Trend line
abline(lm(testNew$Emissions~testNew$Year), lwd=2)

dev.off()