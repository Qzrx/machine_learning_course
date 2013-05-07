fitted_line_graph <- function(progression, max_rows_to_accept=1000, sample_size=1000)
{
  xydataset <- read.csv('data.csv',header=F)
  names(xydataset) <- c("x","y")
  names(progression) <- c("m","b")
  left_x <- 0  # min(xydataset$x)
  right_x <- max(xydataset$x) * 1.05
  g <- NULL
  progression$ranking <- nrow(progression):1
  
  if(nrow(progression) > max_rows_to_accept)
  {
    progression <- arrange(progression[sample(1:nrow(progression), sample_size, replace=FALSE),], -ranking)
  }
  
  for(n in 1:nrow(progression))
  {
    m <- progression[n,"m"]
    b <- progression[n,"b"]
    ranking <- progression[n,"ranking"]
    
    left_y <- m*left_x + b
    right_y <- m*right_x + b
    
    g <- rbind(g, c(left_x,left_y,ranking), c(right_x,right_y, ranking))
  }
  g <- as.data.frame(g)
  names(g) <- c("x","y","r")
  
  error_data <- errorbar_data(progression, xydataset)
  
  m <- eval(ggplot()
            + scale_x_continuous(breaks=seq(0,10,1))
            + geom_line(data=g, aes(x=x, y=y, alpha=exp(-r), group=r), colour="gray50")
#             + scale_colour_discrete(low="grey20", high="grey80")
            + geom_point(data=xydataset, aes(x=x, y=y), colour="gray25", size=5)
            + geom_line(data=g[(nrow(g)-1):nrow(g),], aes(x=x, y=y),colour="#33CCFF",size=1.5, alpha=0.8)
            + geom_errorbar(data=error_data, aes(x=xhat, ymin=ymin, ymax=ymax), width=0, color="red", size=1)
            + theme_bw()
            + theme(legend.position='none')
            + coord_cartesian(ylim = c(0,2.2)))
  
  
  return(m)
}
