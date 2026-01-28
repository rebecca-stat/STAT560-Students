
##example 1.5 (dataset for example 1.2)

install.packages("exactRankTests")

#code 1
library(exactRankTests)
x=c(10, 22, 44, 23, 8, 33, 0, 8, 14, 34, 2, 10)
y=c(26, 40, 66, 55, 16, 33, 8, 6, 18, 14, 23, 15)
wilcox.exact(x,y, paired=TRUE, alternative="less")

#code 2
diff=c(-16, -18, -22, -32, -8, 0, -8, 2, -4, 20, -21, -5)
wilcox.exact(diff, md = 0, alternative = "less")
