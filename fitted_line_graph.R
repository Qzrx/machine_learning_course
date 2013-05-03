fitted_line_graph <- function(progression)
{
  #browser()
  xydataset <- read.csv('data.csv',header=F)
  # xydataset <- as.data.frame(cbind(1:6, 1:6))
  names(xydataset) <- c("x","y")
  names(progression) <- c("b","m")
  left_x <- 0  # min(xydataset$x)
  right_x <- max(xydataset$x) * 1.05
  g <- NULL
  progression$ranking <- nrow(progression):1
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
#   print(head(g))
#   print(head(xydataset))
  m <- eval(ggplot(xydataset, aes(x=x,y=y))
    #ggplot(g, aes(x=x, y=y, alpha=-ranking, group=ranking))
            + scale_x_continuous(breaks=seq(0,10,1))
            + geom_line(data=g, aes(x=x, y=y, alpha=exp(-r), group=r), colour="gray50")
#             + scale_colour_discrete(low="grey20", high="grey80")
            + geom_point(colour="gray25", size=5)
            + geom_line(data=g[(nrow(g)-1):nrow(g),], aes(x=x, y=y),colour="#33CCFF",size=1.5, alpha=0.8)
            + theme(legend.position='none')
            + theme_bw()
            + coord_cartesian(ylim = c(0,2.2)))
  
  
  return(m)
}
