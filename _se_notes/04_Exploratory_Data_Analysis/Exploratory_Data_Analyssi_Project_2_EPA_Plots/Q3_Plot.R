# QUESTION:
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

# Read data
NEI <- readRDS("data\\summarySCC_PM25.rds")
SCC <- readRDS("data\\Source_Classification_Code.rds")


# Clean the data
library(dplyr)
NEI_Q <- NEI %>% 
    filter(fips == "24510") %>%  #filter on Baltimore only
    group_by(year, type) %>%
    summarise(Emissions = sum(Emissions))

# Plot the results
library(ggplot2)
plot_it <- function(){
    qplot(x = year, y = Emissions, data = NEI_Q,
          geom = 'line',
          colour = type,
          main = "PM2.5 Emissions in Baltimore over Time by Type") + 
        scale_x_continuous(name = 'Year', breaks = NEI_Q$year,  labels = NEI_Q$year) +
        geom_point()
}

# Show plot and save to png
plot_it()
png(filename = 'Plot_3.png')
plot_it()
dev.off()

# ANSWER:
# The following types have seen a decrease: NONPOINT, NONROAD, and ON-ROAD
# The following have seen increases: POINT
