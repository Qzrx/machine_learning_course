fitted_line_graph <- function(user_data)
{
  g <- NULL
  for(n in 1:nrow(user_data))
  {
    m <- user_data[n,"m"]
    b <- user_data[n,"b"]
    rank <- user_data[n,"rank"]
      
    min_x <- 0
    min_y <- b
    max_x <- 100
    max_y <- m*100 + b
    
    g <- rbind(g, c(min_x,min_y,rank), c(max_x,max_y, rank))
  }
  g <- as.data.frame(g)
  origin <- as.data.frame(cbind(1:100, 1:100))
  names(origin) <- c("x","y")
  names(g)      <- c("x","y","rank")
  m <- ggplot(g, aes(x=x, y=y, alpha=-rank, group=rank)) + geom_line(aes(colour=-rank)) + geom_point(data=origin, aes(x=x, y=y),alpha = 0.8, colour="gray40") + scale_colour_continuous(low="white",high="red")
  return(m)
}
