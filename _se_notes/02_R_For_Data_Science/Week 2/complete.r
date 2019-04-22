complete <- function(directory, id = 1:332){

  #Create a dataframe from id
  df_obs <- data.frame(id = id, nobs = NA)
  
  #get list of all CSV files in directory
  file_names <-  list.files(path = directory, pattern="\\.csv$",full.names = T) #get list of files from directory
  
  row_num <- 1  
  for (file in file_names){
    
    monitor_id <- as.integer(substr(file,nchar(file)-6,nchar(file)-4))#returns the integer value of the file name
    
    #Check to see if monitor ID is in the given list
    if(monitor_id %in% id){
      
      #read into dataframe
      df_temp <- read_csv(file, col_types = cols(Date = col_date(format = "%Y-%m-%d")))
      
      #count the number of complete observations
      num_complete_obs <- sum(complete.cases(df_temp),na.rm = TRUE)
      
      #add number of complete observations to dataframe
      df_obs[row_num,1] <- monitor_id
      df_obs[row_num,2] <- num_complete_obs
      
      #delete temp dataframe
      rm(df_temp)
      row_num <- row_num+1
      }
  }
  print(df_obs)
}

###########################################
s_directory <-  "C:/Users/sedwardes/OneDrive - Deloitte (O365D)/Documents/Tools/R_Tools/R JHU Course/Week 2/specdata"
s_id <-   54
complete(s_directory, s_id)