
install.packages("bootstrap")

library(bootstrap)
hours<-c(0, 5, 9, 7, 17, 17, 5, 12, 21, 3, 7, 29, 7, 10)
score<-c(28, 94, 84, 45, 82, 99, 67, 97, 79, 93, 62, 60, 85, 78)
data<-matrix(cbind(hours,score), ncol=2)
theta<-function(x,xdata){cor(data[x,1], data[x,2], method="spearman")}

jack.results<-jackknife(1:14, theta, data)
lcl<- cor(hours,score, method="spearman") -jack.results$jack.bias+qt(0.05,length(hours)-1)* jack.results$jack.se
ucl<- cor(hours,score, method="spearman")-jack.results$jack.bias-qt(0.05,length(hours)-1)*jack.results$jack.se
lcl
ucl


