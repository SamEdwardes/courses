library(data.table)
library('sqldf')

#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv', 'data//acs.csv')
acs <- as_data_frame(fread('data//acs.csv'))


# Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?
    
    
sqldf("select pwgtp1 from acs")
sqldf("select * from acs where AGEP < 50 and pwgtp1")
sqldf("select pwgtp1 from acs where AGEP < 50") # Correct answer
sqldf("select * from acs")

# Question 3

#Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP)
unique(acs$AGEP)
sqldf("select distinct pwgtp1 from acs")
sqldf("select distinct AGEP from acs") #Correct answer
sqldf("select unique AGEP from acs")
sqldf("select AGEP where unique from acs")
