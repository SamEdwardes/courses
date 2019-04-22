#warning
log(-1)

#error
printmessage <- function(x){
  if(x>0)
    print("x is greater than zero")
  else
    print("x is less than zero")
  invisible(x) #won't do the autoprinting, like the load function which loads objects from a saved workspace,
               #it returns them but does not print
}

printmessage(NA)

#avoid this error
printmessage2 <- function(x){
  if(is.na(x))
    print("x is missing vlaue")
  
  else if(x>0)
    print("x is greater than zero")
  else
    print("x is less than zero")
  invisible(x) #won't do the autoprinting, like the load function which loads objects from a saved workspace,
               #it returns them but does not print
}

printmessage2(NA)


