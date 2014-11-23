## 
## 
## load emissions data, merge, do some analysis
##
## from the assignment:
##
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## confirmed, it does take a while...
##
## plot5: 
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
## Baltimore City, Maryland (fips == 24510)
## Use any plotting system.
##
## fips is loaded as character, not numeric.
##
## may use aggregate or something from plyr
##
##

## remember to install.packages("ggplot2") before use
library(ggplot2)


BaltOnly <- NEI[NEI$fips == "24510", ]

BaltMerged <- merge(BaltOnly, SCC, by = "SCC")

BaltMobile <- BaltMerged[BaltMerged$SCC.Level.One == "Mobile Sources",]

BaltMobByYear <- aggregate(BaltMobile$Emissions ~ BaltMobile$year , FUN = sum)

names(BaltMobByYear) <- c("Year", "Emissions")

BaltMobByYear[, "Year"] <- as.factor(BaltMobByYear[, "Year"])

ggplot(data = BaltMobByYear, aes(x=Year, y=Emissions)) + geom_bar(stat="identity")

ggsave(filename = "plot5.png", height = 4.5, width = 4.5, dpi=100)