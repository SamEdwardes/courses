#############################
# QUESTION 4
#############################
library(readr)
library(dplyr)
library(lubridate)

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


#EDU
df_edu <- as_data_frame(read.csv('data//getdata_data_EDSTATS_Country (2).csv'))

#Join gdp and edu together
df_join <- left_join(df_gdp, df_edu, by = 'CountryCode')

#fiscal year end exists in column df_join$Special.Notes
df_join <- df_join %>%
mutate(
    Fiscal_Year_Exist = regexpr("fiscal year", Special.Notes, ignore.case = TRUE),
    Fiscal_Year_End = case_when(Fiscal_Year_Exist == 1 ~ 
                                (substring(Special.Notes, first = Fiscal_Year_Exist+17, last = regexpr(";", Special.Notes, ignore.case = TRUE)-1)))
)

df_join %>%
select(CountryCode, Special.Notes, Fiscal_Year_Exist, Fiscal_Year_End)%>%
filter(!is.na(Fiscal_Year_End)) %>%
filter(Fiscal_Year_End %like% "June") %>%
print(n=15)

     