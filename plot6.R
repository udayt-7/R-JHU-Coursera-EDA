#Working Directory
setwd('C:\\Users\\udat\\Desktop\\Rdata\\JHU_EDA')

#Reading Data     
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# merging the two data sets 
NEISCC <- merge(NEI, SCC, by="SCC")


# ON-ROAD  in NEI
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
TotalYear6 <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
TotalYear6$fips[TotalYear6$fips=="24510"] <- "BALTIMORE"
TotalYear6$fips[TotalYear6$fips=="06037"] <- "LOS ANGELES"

#Plotting with ggplot2
library("ggplot2")

png("plot6.png")
g <- ggplot(TotalYear6, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
     xlab("Years") +
     ylab(expression("Total PM 2.5 Emissions")) +
     ggtitle('Total P.M 2.5 Emissions from motor vehicles')
print(g)
dev.off()