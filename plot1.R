
#Working Directory
setwd('C:\\Users\\udat\\Desktop\\Rdata\\JHU_EDA')

#Reading Data     

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Extracting resources
table(NEI$year)
totalyear <- aggregate(Emissions ~ year, NEI, sum)

#Plot
png('plot1.png')
barplot(height=totalyear$Emissions, 
        names.arg=totalyear$year, 
        xlab="Years", 
        ylab=expression('PM 2.5 emissions'),
        main=expression('Total PM 2.5 emissions along years'))
dev.off()