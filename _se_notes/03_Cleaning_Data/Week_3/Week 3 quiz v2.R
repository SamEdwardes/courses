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
library(readr)

#GDP
df_gdp <- as_data_frame(fread("getdata_data_GDP (1).csv",
                skip = 4,
                nrows = 190,
                select = c(1,2,4,5),
                col.names = c('CountryCode', 'rank', 'country_long','gdp')
                )); df_gdp

#clean up GPD
df_gdp <- df_gdp %>%
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

df_join %>%
select(CountryCode, rank, gdp, Income.Group) %>%
filter(Income.Group == "High income: OECD") %>%
summarise(mean(rank))
# anwer = 32.96667

df_join %>%
select(CountryCode, rank, gdp, Income.Group) %>%
filter(Income.Group == "High income: nonOECD") %>%
summarise(mean(rank))
# answer = 91.91

################################
# QUESTION 5
################################  

# Cut the GDP ranking into 5 separate quantile groups. 
# Make a table versus Income.Group. 
# How many countries are Lower middle income but among the 38 nations with highest GDP?

breaks <- quantile(df_join$rank, 
                   probs = seq(0, 1, 0.2),
                   na.rm = TRUE
)

df_join$quant_group <- cut(df_join$rank,  breaks = breaks); select(df_join, CountryCode, rank, quant_group)

df_join['Income.Group' == 'Lower middle income', 'Income.Group']


table(df_join$Income.Group, df_join$quant_group)

#v2
breaks <- quantile(mergedDT[, Rank], probs = seq(0, 1, 0.2), na.rm = TRUE)
df_join$quantileGDP <- cut(df_join$rank, breaks = breaks); select(df_join, CountryCode, rank, quantileGDP)

df_join[df_join$Income.Group == "Lower middle income",]
df_join[df_join$Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]
