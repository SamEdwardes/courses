# In the data set from Question 2 what is a regular expression that would allow you to count the number of countries 
# whose name begins with "United"? Assume that the variable with the country names in it is named countryNames. 
# How many countries begin with United?

# grep("^United",countryNames), 4
# grep("^United",countryNames), 3
# grep("United$",countryNames), 3
# grep("*United",countryNames), 2

# Data from Q2
library(readr)
#GDP
df_gdp <- as_data_frame(fread("data//getdata_data_GDP (2).csv",
                              skip = 5,
                              nrows = 190,
                              select = c(1,2,4,5),
                              col.names = c('CountryCode', 'rank', 'countryNames','gdp')
))

#clean up GPD
df_gdp <- df_gdp %>%
    mutate(rank = as.integer(rank), gdp = as.numeric(parse_number(gdp))) %>% #convert column types
    filter(!is.na(gdp)) #remove NA's


grep("^United", df_gdp$countryNames)