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
## plot6: 
## Compare emissions from motor vehicle sources in Baltimore City with emissions from 
## motor vehicle sources in Los Angeles County, California (fips == 06037).
## Which city has seen greater changes over time in motor vehicle emissions?
## Baltimore City, Maryland (fips == 24510)
## Los Angeles County, California (fips == 06037)
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
LAOnly <- NEI[NEI$fips == "06037", ]

BaLa <- rbind(BaltOnly, LAOnly)

BaLaSCC <- merge(BaLa, SCC, by = "SCC")

BaLaMobile <- BaLaSCC[BaLaSCC$SCC.Level.One == "Mobile Sources",]

BaLaMobByYear <- aggregate(BaLaMobile$Emissions ~ BaLaMobile$year + BaLaMobile$fips, FUN = sum)

names(BaLaMobByYear) <- c("Year", "fips", "Emissions")

BaLaMobByYear[, "Year"]<- as.factor(BaLaMobByYear[, "Year"])

BaLaMobByYear$fips[BaLaMobByYear$fips == "06037"] <- "Los Angeles"

BaLaMobByYear$fips[BaLaMobByYear$fips == "24510"] <- "Baltimore"

BaLaMobByYear[, "fips"]<- as.factor(BaLaMobByYear[, "fips"])

ggplot(data = BaLaMobByYear, aes(x=Year, y=Emissions, fill=fips)) + geom_bar(stat="identity",position = position_dodge())

ggsave(filename = "plot6.png", height = 4.5, width = 4.5, dpi=100)