
#Working Directory
setwd('C:\\Users\\udat\\Desktop\\Rdata\\JHU_EDA')

#Reading Data     

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Subsetting and Extracting Data
NEISCC <- merge(NEI, SCC, by="SCC")
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)

subsetNEISCC <- NEISCC[coalMatches, ]

TotalYear4 <- aggregate(Emissions ~ year, subsetNEISCC, sum)


#Plotting with ggplot2
library("ggplot2")

png("plot4.png")

g <- ggplot(TotalYear4, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
     xlab("Years") +
     ylab(expression("Total PM 2.5 Emissions")) +
     ggtitle('Total Emissions from Coal')

print(g)
dev.off()