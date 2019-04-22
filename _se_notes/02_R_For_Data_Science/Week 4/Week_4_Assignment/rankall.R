rankall <- function(outcome, num = 'best'){
  
  # Read the outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # Check to see if the provided outcome is valid
  outcome_listing <- c('HEART ATTACK', 'HEART FAILURE', 'PNEUMONIA') #possible outcomes to select from
  outcome <- trimws(toupper(outcome)) #trim leading/trailling white space and convert all to uppper
  if (outcome %in% outcome_listing == 'FALSE'){
    stop("invalid outcome")
  }
  
  #create new dataframe using only selected outcome and hospital name
  if(outcome == 'HEART ATTACK'){
    cols <- c(2,7,11)
    outcome_data <- outcome_data[,cols]
  } else if(outcome == 'HEART FAILURE'){
    cols <- c(2,7,17)
    outcome_data <- outcome_data[,cols]
  } else if(outcome == 'PNEUMONIA'){
    cols <- c(2,7,23)
    outcome_data <- outcome_data[,cols]
  }
  
  # Clean the data
  suppressWarnings(outcome_data[,3] <- as.numeric(outcome_data[,3])) #Set outcome to a number
  outcome_data <- outcome_data[complete.cases(outcome_data),] #remove NA
  
  # Loop through each state and get the selected ranking
  state_listing <- c(unique(outcome_data$State)) #get a charactor vector of all states in the dataframe
  state_listing <- sort(state_listing)
  row_num <- 1 #used for looping
  df_results <- data.frame('hospital' = 'hospital', 'state' = 'state', stringsAsFactors = FALSE)
  
  for (state in state_listing){
    
    #only include outcomes from selected state
    df_temp <- outcome_data[outcome_data$State == state,]
    
    # Add a ranking column
    df_temp$Rank <- NA
    df_temp$Rank[order(df_temp[3], df_temp[1])] <- 1:nrow(df_temp)
    
    #special case handling: (1) num = best/worst, (2) num outside of data range, (3) else return requested rank
    if(num == 'best'){
      temp_result <- (df_temp[df_temp$Rank == 1,])
      
    } else if (num == 'worst'){
      temp_result <- (df_temp[df_temp$Rank == max(df_temp$Rank),])
      
    } else if(num > max(df_temp$Rank)){
      
      temp_result <- data.frame('hospital' = 'hospital', 'state' = 'state', stringsAsFactors = FALSE) 
      
      temp_result[1,1] <- (NA)
      temp_result[1,2] <- state
      
      #Return the requested rank
    } else{
      temp_result <- (df_temp[df_temp$Rank == num,])}
    
    #Append the results to final data
    
    df_results[row_num,1] <- temp_result[1,1]
    df_results[row_num,2] <- state
    
    row_num <- row_num + 1
    
    #rm(temp_result)
    #rm(df_temp)
    
  } 
  return(df_results)
}


