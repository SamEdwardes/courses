# QUESTION:
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
# make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Read data
NEI <- readRDS("data\\summarySCC_PM25.rds")
SCC <- readRDS("data\\Source_Classification_Code.rds")

# PM2.5 from all sources by year
NEI_Q <- NEI %>% 
    group_by(year) %>% 
    summarise(Emissions = sum(Emissions))

# Plot the results
plot_it <- function(){
    barplot(NEI_Q$Emissions,
            names = NEI_Q$year,
            main = "PM2.5 Emissions from All Sources over Time", 
            ylab = "Emissions (PM2.5)",
            xlab = "Year")
}

# Show plot and save to png
plot_it()
png(filename = 'Plot_1.png')
plot_it()
dev.off()

# ANSWER:
# Yes emissions have decreased over time