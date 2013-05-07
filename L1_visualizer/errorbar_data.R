library(plyr)

errorbar_data <- function(progression, base_data){
  # Given a set of input slope/intercept pairs and ground-truth data, generate
  # a set of errorbars to plot with geom_errorbar()
  #
  # progression should be a dataframe with slopes in the first column and
  # intercepts in the second. base_data should be a dataframe with 
  # x-axis coordinates in the first column and y-axis coordinates in the second.
  names(base_data) <- c("x","y")
  cost <- function(m, b){sum(abs((m*base_data$x + b) - base_data$y))}
  
  progression[,"cost"] <- mapply(cost, m=progression[,1], b=progression[,2])
  best_fit <- arrange(progression, -cost)[nrow(progression),]
  m <- best_fit[, 1] # for simplicity later on
  b <- best_fit[, 2]

  # our x-axis coordinates are fixed by base_data[,1]
  # our ymax is whichever of the two {fitted, base} is larger
  # our ymin is whichever of the two {fitted, base} is smaller
  errorbar_data <- as.data.frame(cbind(base_data[,1],                                  # x-axis data
                                       mapply(min, dataset[,2], (m*dataset[,1] + b)),  # ymin
                                       mapply(max, dataset[,2], (m*dataset[,1] + b)))) # ymax
  names(errorbar_data) <- c("xhat","ymin","ymax")
  return(errorbar_data)
}