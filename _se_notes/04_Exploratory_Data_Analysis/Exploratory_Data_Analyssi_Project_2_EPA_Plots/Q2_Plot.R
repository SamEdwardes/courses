# QUEStION:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Read data
NEI <- readRDS("data\\summarySCC_PM25.rds")
SCC <- readRDS("data\\Source_Classification_Code.rds")

# Clean the data
library(dplyr)
NEI_Q <- NEI %>% 
    filter(fips == "24510") %>% #filter on Baltimore only
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))

# Plot the data to see if emissions have decreased over time
plot_it <- function(){
    barplot(NEI_Q$Emissions,
            names = NEI_Q$year,
            main = "PM2.5 Emissions in Baltimore over Time", 
            ylab = "Emissions (PM2.5)",
            xlab = "Year")
}

# Show plot and save to png
plot_it()
png(filename = 'Plot_2.png')
plot_it()
dev.off()

# ANSWER:
# Yes emissions have decreased over time in Baltimore