#Reading Data
#Working Directory
setwd('C:\\Users\\udat\\Desktop\\Rdata\\JHU_EDA')

#Reading Data     

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Extracting Data
table(NEI$type[NEI$fips=="24510"])
table(NEI$fips[NEI$fips=="24510"])


#Subsetting
subsetNEI  <- NEI[NEI$fips=="24510", ]
TotalYear3 <- aggregate(Emissions ~ year + type, subsetNEI, sum)


#Plotting with ggplot2
library("ggplot2")
png("plot3.png")
g <- ggplot(TotalYear3, aes(year, Emissions, color = type))

g <- g + geom_line() +
     xlab("Years") +
     ylab(expression("Total PM 2.5 Emissions")) +
     ggtitle('Total Emissions in Baltimore, Maryland')

print(g)
dev.off()