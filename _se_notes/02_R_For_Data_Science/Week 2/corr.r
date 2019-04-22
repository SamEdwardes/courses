corr <- function(directory, threshold = 1){
  
  #get list of all CSV files in directory
  file_names <-  list.files(path = directory, pattern="\\.csv$",full.names = T) #get list of files from directory
  
  #create an empty vector
  cor_list <- vector("numeric")
  
  #look through the files
  for (file in file_names){
    monitor_id <- as.integer(substr(file,nchar(file)-6,nchar(file)-4))#returns the integer value of the file name
    
    df_temp <- read_csv(file, col_types = cols(
      nitrate = col_double(),
      sulfate = col_double(),
      Date = col_date(format = "%Y-%m-%d")))
  
    #convert to numeric
    df_temp$nitrate <- as.numeric(as.character(df_temp$nitrate))
    df_temp$sulfate <- as.numeric(as.character(df_temp$sulfate))
    
    #check number of complete observations against the threshold
    num_complete_obs <- sum(complete.cases(df_temp),na.rm = TRUE)
    if(num_complete_obs <= threshold){
      next #skip to next iteration
    }
    else{
      x_cor = cor(x = df_temp$sulfate, y = df_temp$nitrate, use = "complete.obs")
      cor_list <- c(cor_list, x_cor)
    }
  }
  return(cor_list)
}


#############
path <- "C:/Users/sedwardes/OneDrive - Deloitte (O365D)/Documents/Tools/R_Tools/R JHU Course/Week 2/specdata"
x1 <- corr(path)
head(x1)
summary(x1)












