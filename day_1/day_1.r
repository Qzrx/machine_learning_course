library(plyr)

dataset <- read.csv("day_1/data.csv", header=F, col.names=c("x","y"))

cost <- function(m, b){sum(abs((m*dataset$x + b) - dataset$y))}
g <- expand.grid(seq(-0.5,0.5,by=0.01), seq(0,2, by=0.01))
g$cost <- mapply(cost, m=g$Var1, b=g$Var2)
g <- as.data.frame(g)
names(g) <- c("m","b","cost")
ggplot(g, aes(x=m, y=b, colour=-sqrt(cost))) + geom_point(size=6) + theme(legend.position='none')
write.table(arrange(g[which(g$cost < 2.1),], cost)[,c(2,1)], "g.csv", row.names=FALSE, col.names=FALSE,sep=",")