# Read data
NEI <- readRDS("data\\summarySCC_PM25.rds")
SCC <- readRDS("data\\Source_Classification_Code.rds")


# Join SCC data to NEI file
library(dplyr)
NEI_mini <- left_join(x = NEI_mini, 
                      y = select(SCC, SCC, Short.Name, EI.Sector, SCC.Level.One:SCC.Level.Four), 
                      by = c("SCC", "SCC"))




NEI_Q4$EI.Sector[, NEI_Q4$EI.Sector==grepl(pattern = '^Fuel Comb*Coal', #starts with fuel comb and contains coal
                                           x = NEI_Q4$EI.Sector )]

unique(SCC$EI.Sector)
grepl(pattern = '^Fuel Comb','Coal', #starts with fuel comb and contains coal
      x = SCC$EI.Sector )


SCC %>% filter(grepl(pattern = '^Fuel Comb','Coal', EI.Sector))


unique(SCC[grepl('^Fuel Comb.*Coal', SCC$EI.Sector), 'EI.Sector'])
