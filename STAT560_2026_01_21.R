
##example 1.2

install.packages("BSDA")

#code 1
library(BSDA)
x=c(10, 22, 44, 23, 8, 33, 0, 8, 14, 34, 2, 10)
y=c(26, 40, 66, 55, 16, 33, 8, 6, 18, 14, 23, 15)
SIGN.test(x,y, alternative="less")

#code 2
library(BSDA)
diff=c(-16, -18, -22, -32, -8, 0, -8, 2, -4, 20, -21, -5)
SIGN.test(diff, md = 0, alternative = "less")
