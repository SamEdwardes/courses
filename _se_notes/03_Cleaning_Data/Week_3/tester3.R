df_gdp <- read_csv("getdata_data_GDP (1).csv", 
                   col_types = cols(X2 = col_integer(), 
                                    X3 = col_skip(), X5 = col_number()), 
                   skip = 4)