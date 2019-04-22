# QUESTION:
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# Read data
NEI <- readRDS("data\\summarySCC_PM25.rds")
SCC <- readRDS("data\\Source_Classification_Code.rds")


# Join SCC data to NEI file
library(dplyr)
NEI_Q <- left_join(x = NEI, 
                      y = select(SCC, SCC, EI.Sector), 
                      by = c("SCC", "SCC"))

# Filter only on EI.Sectors that contain the words "Fuel Comb" and "Coal"
NEI_Q <- NEI_Q %>% 
    filter(grepl('^Fuel Comb.*Coal', EI.Sector)) %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))


# Plot the results
library(ggplot2)
plot_it <- function(){
    qplot(x = year, y = Emissions, data = NEI_Q,
          geom = 'line',
          main = "PM2.5 Emissions from Coal Combustion over Time") + 
        scale_x_continuous(name = 'Year', breaks = NEI_Q$year,  labels = NEI_Q$year) +
        geom_point()
}

# Show plot and save to png
plot_it()
png(filename = 'Plot_4.png')
plot_it()
dev.off()

# ANSWER:
# Coal combustion emmissions are decreasing



