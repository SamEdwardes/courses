# QUESTION:
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips=="06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Read data
NEI <- readRDS("data\\summarySCC_PM25.rds")
SCC <- readRDS("data\\Source_Classification_Code.rds")

# Clean the data
library(dplyr)
NEI_Q <- NEI %>% filter(fips == "24510" |  fips == "06037") #filter on Baltimore only

# Join the SCC data
NEI_Q <- left_join(x = NEI_Q, 
                    y = select(SCC, SCC, SCC.Level.Two), 
                    by = c("SCC", "SCC"))

# Filter on motor vehicles only
NEI_Q <- NEI_Q[grepl('vehicle', NEI_Q$SCC.Level.Two, ignore.case = TRUE), ]

# Summarise the results
NEI_Q <- NEI_Q %>%
    mutate(city = case_when(fips == "06037" ~ 'LA',
                            fips == "24510" ~ 'Baltimore')) %>%
    group_by(year,city) %>%
    summarise(Emissions = sum(Emissions))

#plot the results
library(ggplot2)
plot_it <- function(){
    qplot(year, Emissions, data = NEI_Q,
          geom = 'line',
          colour = city,
          main = "PM2.5 Emissions in over Time by Type") + 
        scale_x_continuous(name = 'Year', breaks = NEI_Q$year,  labels = NEI_Q$year) +
        geom_point()
}

# Show plot and save to png
plot_it()
png(filename = 'Plot_6.png')
plot_it()
dev.off()