library("data.table")


# Download data and read FGDP data into data.table
FGDP <- as_data_frame(data.table::fread('getdata_data_GDP (1).csv'
                          , skip=5
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
)); FGDP
