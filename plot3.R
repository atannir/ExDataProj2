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
library("plyr")

BaltOnly <- NEI[NEI$fips == "24510", ]

BaltByTypeYear <- aggregate(BaltOnly$Emissions ~ BaltOnly$type + BaltOnly$year, FUN = sum)

## not needed (yet)
## BaltSCC <- merge(BaltOnly, SCC, by.x = "SCC", by.y = "SCC")

# BaltByYear <- aggregate(BaltOnly$Emissions ~ BaltOnly$year, FUN = sum)

# names(BaltByYear) <- c("Year", "Emissions")


# png("plot3.png",
#     width = 480,
#     height = 480)

# plot(BaltByYear$Emissions ~ BaltByYear$Year, 
#      main = "Baltimore PM-2.5 Conc. in 1999, 2002, 2005, 2008",
#      type = "b",
#      xlab = "Year", ylab = "",
#      lty = "12",
#      xaxp = c(1999, 2008, 9),
#      cex.axis = 0.7,
#      las=1)

# dev.off()