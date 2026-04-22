#example 8.4

install.packages("bootstrap")
library(bootstrap)
hours<-c(0, 5, 9, 7, 17, 17, 5, 12, 21, 3, 7, 29, 7, 10)
score<-c(28, 94, 84, 45, 82, 99, 67, 97, 79, 93, 62, 60, 85, 78)
data<-matrix(cbind(hours,score), ncol=2)
theta<-function(x,xdata){cor(data[x,1], data[x,2], method="spearman")}

set.seed(4321)
boot.results<-bootstrap(1:14, 1000, theta, data)
quantile(boot.results$thetastar, c(.01, .99))