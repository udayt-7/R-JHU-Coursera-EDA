
#Working Directory
setwd('C:\\Users\\udat\\Desktop\\Rdata\\JHU_EDA')

#Reading Data     

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Extracting resources
subsetNEI  <- NEI[NEI$fips=="24510", ]
TotalYear2 <- aggregate(Emissions ~ year, subsetNEI, sum)

#Plot
png('plot2.png')
barplot(height = TotalYear2$Emissions, 
        names.arg = TotalYear2$year, 
        xlab = "Years", 
        ylab = expression('Total PM 2.5 emissions'),
        main = expression('Total PM 2.5 in Baltimore along years'))
dev.off()