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

## hist or bar?