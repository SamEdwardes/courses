pollutantmean <- function(directory, pollutant, id = 1:332){
  #get list of all CSV files in directory
  file_names <-  list.files(path = directory, pattern="\\.csv$",full.names = T) #get list of files from directory
  
  for (file in file_names){
    monitor_id <- as.integer(substr(file,nchar(file)-6,nchar(file)-4))#returns the integer value of the file name
    
    #Check to see if monitor ID is in the given list
    if(monitor_id %in% id){
      

      #if merged df_pollutant does not exist, create it
      if (!exists("df_pollutant")){
        df_pollutant <- read_csv(file, col_types = cols(Date = col_date(format = "%Y-%m-%d")))
      }
      
      #if merged df_pollutant does not exist
      if(exists("df_pollutant")){
        df_temp <- read_csv(file, col_types = cols(Date = col_date(format = "%Y-%m-%d")))
        df_pollutant <- rbind(df_pollutant, df_temp)
        rm(df_temp)
      }
    }
  }
  
  #convert to numeric
  df_pollutant$nitrate <- as.numeric(as.character(df_pollutant$nitrate))
  df_pollutant$sulfate <- as.numeric(as.character(df_pollutant$sulfate))
  
  #calcualte the mean, remove any values that are NA
  mean(df_pollutant[[pollutant]], na.rm = TRUE)
}

####################################
selected_directory <-  "C:/Users/sedwardes/OneDrive - Deloitte (O365D)/Documents/Tools/R_Tools/R JHU Course/Week 2/specdata"
selected_pollutant <-  "nitrate"
selected_id <-  34

pollutantmean(selected_directory, selected_pollutant)