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
## We want to graph the total particulate matter PM25 for each year
## and see if it is increasing or otherwise.
##
## fips is loaded as character, not numeric.
##
## may use aggregate or something from plyr
##
##
##
EmByYear <- aggregate(NEI$Emissions ~ NEI$year, FUN = sum)

names(EmByYear) <- c("Year", "Emissions")
## line or bar?

plot(EmByYear$Emissions ~ EmByYear$Year, 
     main = "PM-25 Concentrations in 1999, 2002, 2005, 2008",
     type = "b",
     xlab = "Year", ylab = "",
     ylim = c(2500000,7500000),
     lty = "12",
     xaxp = c(1999, 2008, 9),
     yaxp = c(2500000,7500000, 5),
     las=1)
