#example 1.7

#install.packages("exactRankTests")
library(exactRankTests)
x=c(3.98, 3.45, 3.66, 3.78, 3.90, 4.00, 3.78, 3.12, 3.45, 3.97)
y=c(3.42, 2.56, 2.00, 3.19, 3.00, 3.56, 3.56, 4.00, 2.78, 3.44)
wilcox.exact(x,y, paired=FALSE, alternative="greater")
#The test statistic is W-m(m+1)/2 where m=the size of the first sample
