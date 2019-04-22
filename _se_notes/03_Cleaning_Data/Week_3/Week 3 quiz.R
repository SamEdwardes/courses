################################
# QUESTION 1
################################

Q1_file <- 'getdata_data_ss06hid.csv'
df_housing <- read.csv(Q1_file)

# Create a logical vector for households where: 
# (1) > 10 acres = df_housing$ACR >= 3, 
# (2) sold > 10K agriculture products = df_housing$AGS >= 6

agricultureLogical <- df_housing$ACR >=3 & df_housing$AGS >=6

# how many rows are true?

which(agricultureLogical)
# Answer = 125, 238, 262


################################
# QUESTION 2
################################
library(jpeg)
pic <- readJPEG('getdata_jeff.jpg', native = TRUE)

# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? 
# (some Linux systems may produce an answer 638 different for the 30th quantile)

quantile(pic, probs = c(0.3, 0.8))
# answer = -15259150 -10575416 



################################
# QUESTION 3
################################
library(dplyr)
library(readr)
library(stringi)
library(data.table)

#GDP
library(readr)
df_gdp <- read_csv("getdata_data_GDP (1).csv", 
                    col_types = cols(X2 = col_integer(), X5 = col_number(), X3 = col_skip(),X6 = col_skip(),X7 = col_skip(),X8 = col_skip(),X9 = col_skip(),X10 = col_skip()), 
                    skip = 4,
                   col_names = c('CountryCode', 'rank', 'country_long','gdp')
                   
                   );df_gdp
df_gdp <- select(df_gdp, CountryCode = X1, rank = X2, country_long = X4, gdp = X5)
df_gdp <- df_gdp[which(df_gdp$CountryCode != 'NA'),]
df_gdp <- df_gdp[which(df_gdp$rank != 'NA'),]
df_gdp$rank <- as.integer(df_gdp$rank)
df_gdp$gdp <- as.numeric(parse_number(df_gdp$gdp))

#GDP version 2
df_gdp <- as_data_frame(fread("getdata_data_GDP (1).csv",
                skip = 4,
                nrows = 190,
                select = c(1,2,4,5),
                col.names = c('CountryCode', 'rank', 'country_long','gdp')
                )); df_gdp

df_gdp %>%
mutate(rank = as.integer(rank), gdp = as.numeric(parse_number(gdp))) %>% #convert column types
filter(!is.na(rank)) #remove NA's



#EDU
df_edu <- as_data_frame(read.csv('getdata_data_EDSTATS_Country (1).csv'))

#Join gdp and edu together
df_join <- left_join(df_gdp, df_edu, by = 'CountryCode')
df_join <- df_join[is.na(df_join$Income.Group)==FALSE,]


#match the data, how many matches are there, what about South Sudan (SSD)
nrow(df_join) #answer = 189
head(arrange(df_join, desc(rank)),13) #13th country is St. Kitts and Nevis


################################
# QUESTION 4
################################         
# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?

select(df_join, CountryCode, rank, gdp)


