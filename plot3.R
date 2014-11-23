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
## plot3: Of the 4 types of emissions in Baltimore City, Maryland (fips == 24510),
## which have increased and decreased from 1999 to 2008?
## Use ggplot2 plotting system.
##
## fips is loaded as character, not numeric.
##
## may use aggregate or something from plyr
##
##

## remember to install.packages("plyr") before use
## library("plyr")

## remember to install.packages("ggplot2") before use
library(ggplot2)


BaltOnly <- NEI[NEI$fips == "24510", ]

BaltByTypeYear <- aggregate(BaltOnly$Emissions ~ BaltOnly$type + BaltOnly$year, FUN = sum)

names(BaltByTypeYear) <- c("Type", "Year", "Emissions")

BaltByTypeYear[, "Year"] <- as.factor(BaltByTypeYear[, "Year"])
BaltByTypeYear[, "Type"] <- as.factor(BaltByTypeYear[, "Type"])

## position_dodge makes it line up, not stack
## stacked bar is neat but not quite right.
## Adding factor call above made it discrete.
ggplot(data = BaltByTypeYear, aes(x=Year, y=Emissions, fill=Type)) + geom_bar(stat="identity", position = position_dodge())

ggsave(filename = "plot3.png", height = 5, width = 5, dpi=100)