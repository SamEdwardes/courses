################################################################
# 3 - Rank the best hospital in a state
################################################################

state <- 'MD'
outcome <- 'HEART ATTACK'
num <- 'worst'

rankhospital <- function(state, outcome, num = 'best'){
  
  # Read the outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # Check that the state provided is valid
  state <- trimws(toupper(state)) #change characters to all uppercase and trim whitespace
  state_listing <- c(unique(outcome_data$State)) #get a charactor vector of all states in the dataframe
  if (state %in% state_listing == 'FALSE') {
    stop("invalide state")
  }
  
  # Check to see if the provided outcome is valid
  outcome_listing <- c('HEART ATTACK', 'HEART FAILURE', 'PNEUMONIA') #possible outcomes to select from
  outcome <- trimws(toupper(outcome)) #trim leading/trailling white space and convert all to uppper
  if (outcome %in% outcome_listing == 'FALSE'){
    stop("invalid outcome")
  }
  
  #only include outcomes from selected state
  outcome_data <- outcome_data[outcome_data$State == state,] #only include outcomes from selected state
  
  #create new dataframe using only selected outcome and hospital name
  if(outcome == 'HEART ATTACK'){
    cols <- c(2,11)
    sel_outcome_data <- outcome_data[,cols]
  } else if(outcome == 'HEART FAILURE'){
    cols <- c(2,17)
    sel_outcome_data <- outcome_data[,cols]
  } else if(outcome == 'PNEUMONIA'){
    cols <- c(2,23)
    sel_outcome_data <- outcome_data[,cols]
  }
  
  # Clean the data
  suppressWarnings(sel_outcome_data[,2] <- as.numeric(sel_outcome_data[,2])) #Set outcome to a number
  sel_outcome_data <- sel_outcome_data[complete.cases(sel_outcome_data),] #remove NA
  
  # Add a ranking column
  sel_outcome_data$Rank <- NA
  sel_outcome_data$Rank[order(sel_outcome_data[2], sel_outcome_data[1])] <- 1:nrow(sel_outcome_data)
  
  #special case handling: (1) num = best/worst, (2) num outside of data range, (3) else return requested rank
  if(num == 'best'){
    return(sel_outcome_data[sel_outcome_data$Rank == 1,1])
    stop()
  } else if (num == 'worst'){
    return(sel_outcome_data[sel_outcome_data$Rank == max(sel_outcome_data$Rank),1])
    stop()
  } else if(num > max(sel_outcome_data$Rank)){
    return(NA)
    stop()
    #Return the requested rank
  } else{return(sel_outcome_data[sel_outcome_data$Rank == num,1])}

}

  
  