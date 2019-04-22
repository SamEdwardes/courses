# QUESTION:
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Read data
NEI <- readRDS("data\\summarySCC_PM25.rds")
SCC <- readRDS("data\\Source_Classification_Code.rds")

# Clean the data
library(dplyr)
NEI_Q <- NEI %>% filter(fips == "24510") #filter on Baltimore only

# Join the SCC data
NEI_Q <- left_join(x = NEI, 
                    y = select(SCC, SCC, SCC.Level.Two), 
                    by = c("SCC", "SCC"))

# Filter on motor vehicles only
NEI_Q <- NEI_Q[grepl('vehicle', NEI_Q$SCC.Level.Two, ignore.case = TRUE), ]

# Summarise the results
NEI_Q <- NEI_Q %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))

#plot the results
library(ggplot2)
plot_it <- function(){
    ggplot(NEI_Q, aes(year, Emissions)) +
        geom_col() + 
        scale_x_continuous(name = 'Year', breaks = NEI_Q$year,  labels = NEI_Q$year) +
        scale_y_continuous(name = 'PM2.5 Emissions', labels = scales::comma) +
        labs(title='PM2.5 Emissions from Vehicles over Time')
}

# Show plot and save to png
plot_it()
png(filename = 'Plot_5.png')
plot_it()
dev.off()
    

