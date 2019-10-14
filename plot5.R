#Working Directory
setwd('C:\\Users\\udat\\Desktop\\Rdata\\JHU_EDA')

#Reading Data     
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# merging the two data sets 
NEISCC <- merge(NEI, SCC, by="SCC")


# Searching for ON-ROAD 
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
TotalYear5 <- aggregate(Emissions ~ year, subsetNEI, sum)

#Plotting with ggplot 2
library("ggplot2")

png("plot5.png")

g <- ggplot(TotalYear5, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
     xlab("Years") +
     ylab(expression("Total PM2.5 Emissions")) +
     ggtitle('Total Emissions from motor vehicle in Baltimore')
print(g)

dev.off()