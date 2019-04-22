# 1

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, "df_survey.csv")

df_survey <- read.csv("df_survey.csv")

head(df_survey)

# how many houses are worth $1M or more?
count((subset(df_survey, VAL >= 24, select = c("RT","VAL"))))

#answer = 53


#2 FES variable...

df_survey$FES
str(df_survey$FES)
unique(df_survey$FES)

#3 natural gas data
gasURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(gasURL, "gas.xlsx")

library(xlsx)
df_gas <- read.xlsx("gas2.xlsx", sheetIndex = 1, header=TRUE)

head(df_gas)

# rows 18-23
df_contractor <- read.xlsx("gas2.xlsx", 
                           sheetIndex = 1, 
                           rowIndex = 18:23)
head(df_contractor)

# rows 18-23
dat <- read.xlsx("gas2.xlsx", 
                           sheetIndex = 1, 
                           rowIndex = 18:23,
                           colIndex = 7:15)
head(dat)

#what is the value of: sum(dat$Zip*dat$Ext,na.rm=T)
sum(dat$Zip*dat$Ext,na.rm=T)

#####
# 4 - Balitmore resuatrants
#####

library(XML)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
fileName <- ".\\data\\baltimore.xml"
doc <- xmlTreeParse(fileName, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]][[1]]

#how many restaurants have the zipcode 21231

zip_codes <- xpathSApply(rootNode,"//zipcode", xmlValue)
zip_codes

subset(zip_codes, zip_codes=="21231")

length(subset(zip_codes, zip_codes=="21231"))

#####
# 5
#####

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, ".\\data\\housing.csv")

df_housing <- read.csv(".\\data\\housing.csv")
head(df_housing)
str(df_housing)

library(data.table)
DT <- fread(".\\data\\housing.csv")
DT
str(DT)
tables()

rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2] #NO - returns an error
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX])
mean(DT$pwgtp15,by=DT$SEX) #NO - does not breakdown by sex
