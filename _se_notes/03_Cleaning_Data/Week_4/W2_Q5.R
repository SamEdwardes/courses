# Read this data set into R and report the sum of the numbers in the fourth of the nine columns. (Hint this is a fixed width file format)

url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for'
if (!file.exists('q5.for')) {download.file(url, 'q5.for')}

library(data.table)

df <- as_data_frame(fread('q5.for'))


col4 <- sapply(df[,4], as.numeric)

sum(col4[!is.na(col4)])


#Correct answer...

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
lines <- readLines(url, n = 10)
w <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
colNames <- c("filler", "week", "filler", "sstNino12", "filler", "sstaNino12", 
              "filler", "sstNino3", "filler", "sstaNino3", "filler", "sstNino34", "filler", 
              "sstaNino34", "filler", "sstNino4", "filler", "sstaNino4")
d <- as_data_frame(read.fwf(url, w, header = FALSE, skip = 4, col.names = colNames))
d <- d[, grep("^[^filler]", names(d))]
sum(d[, 4])