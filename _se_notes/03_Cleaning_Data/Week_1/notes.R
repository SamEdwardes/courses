####################################
# DOWNLOADING FILES
####################################

#\\ windows uses 2 slashes, mac is /

#Create a data directory if does not exist
if(!file.exists("data")){
    dir.create ("data")
}

#download.file()
help("download.file")

fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = ".\\data\\cameras.csv", method = "curl")
# Curl is only needed for https on mac
list.files(".\\data")
dateDownloaded <- date()
dateDownloaded


####################################
# Reading local flat files
####################################

# read.table() is the most common way to open
# reads the data into RAM
# file, header, sep, row.names, nrows

cameraData <- read.table(".\\data\\cameras.csv", sep = ",", header = TRUE)
head(cameraData)
summary(cameraData)

#when having trouble set quote =""


####################################
# Excel files
####################################
download.file(fileURL, destfile = ".\\data\\cameras.xlsx", method = "curl")
dateDownloaded <- date()
list.files(".\\data")

library(xlsx)
cameraData <- read.xlsx(".\\data\\cameras2.xlsx", sheetIndex=1, header=TRUE)
head(cameraData)


####################################
# XML
####################################

library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(".\\data\\simple.xml", useInternal = TRUE)
rooteNode <- xmlRoot(doc)
xmlname(rootNode)


####
# HTML
####

fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl, useInternal = TRUE)
scores <- xpathSApply("''li[@class='score']",xmlValue)


####################################
# JSON
####################################

fileUrl <- "http://api.github.com/users/jtleek/repos"
library(jsonlite)
jsonData <- fromJSON(fileUrl)
jsonData
names(jsonData$owner)

#take dataframes and R and turn into JSON dataset

myjson <- toJSON(iris, pretty=TRUE)
cat(myjson)
iris2 <- fromJSON(myjson)
head(iris2)
