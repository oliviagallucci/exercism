raindrops <- function(number) {
  
  endstring <- ""
  
  if (0 == number %% 3) {
    endstring <- paste0(endstring, "Pling")
    
  }

  if (0 == number %% 5) {
    endstring <- paste0(endstring, "Plang")
    
  }

  if (0 == number %% 7) {
    endstring <- paste0(endstring, "Plong")
    
  }

  if (endstring == "") {
    return(as.character(number))
  } else {
    return(endstring)
  }
  
}
