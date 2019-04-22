################################################################
# 2 - Finding the best hospital in the state
################################################################
# Function will determine the best hospital in a selected state for the selected outcome
# Function will return a character vector with the hospital name (Hospital.Name)

# Function takes in two arguments
# 1) Sate - abbreviated two letters
# 2) OUtcome - the selected outcome variable that you would like to test
# In the event there is a tie, the function will return the hospital based on alphabetical order

best <- function(state, outcome){
  
  # Read the outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # Check that the state provided is valid
  state <- toupper(state) #change characters to all uppercase
  state <- trimws(state) #trim leading or trailing white spaces
  state_listing <- c(unique(outcome_data$State)) #get a charactor vector of all states in the dataframe
  
  # Check to see if the provided State is in the dataframe.
  if (state %in% state_listing == 'FALSE') {
    stop("invalide state")
  }
  
  outcome_data <- outcome_data[outcome_data$State == state,] #only include outcomes from selected state
  
  # Check to see if the provided outcome is valid
  outcome_listing <- c('HEART ATTACK', 'HEART FAILURE', 'PNEUMONIA') #possible outcomes to select from
  outcome <- trimws(toupper(outcome)) #trim leading/trailling white space and convert all to uppper
  
  if (outcome %in% outcome_listing == 'FALSE'){
    stop("invalid outcome")
  }
  
  #"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" 
  ## Return the hospital name with the lowest 30-day death rate
  if (outcome == 'PNEUMONIA'){
    suppressWarnings(outcome_data[,23] <- as.numeric(outcome_data[,23]))
    cols <- c(2, 23)
    result <- head(
      outcome_data[order(outcome_data[,23],
                         outcome_data[,2]), cols]
      , n = 1)
  } else if(outcome == 'HEART ATTACK'){
    suppressWarnings(outcome_data[,11] <- as.numeric(outcome_data[,11]))
    cols <- c(2, 11)
    result <- head(
      outcome_data[order(outcome_data[,11],
                         outcome_data[,2]), cols]
      , n = 1)
  } else if(outcome == 'HEART FAILURE'){
    suppressWarnings(outcome_data[,17] <- as.numeric(outcome_data[,17]))
    cols <- c(2, 17)
    result <- head(
      outcome_data[order(outcome_data[,17],
                         outcome_data[,2]), cols]
      , n = 1)
  }
  
  #Return the hostipal name
  return(result[1,1])

}
