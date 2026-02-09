#Example 2.2

#Friedman Rank test
Ratings<-matrix( c(4, 5, 8, 3, 7, 6, 2, 8, 8, 5, 7, 9, 1, 3, 6, 4, 4, 6, 3, 6, 8, 2, 5, 5, 2, 7, 9, 6, 4, 5), nrow=10, byrow=TRUE)
friedman.test(Ratings)

#Wilcoxon Signed-Rank test 
#compare A and B
install.packages("exactRankTests")
library(exactRankTests)

diff=c(-1, -4, -6, -2, -2, 0, -3, -3, -5, 2)
wilcox.exact(diff, md = 0, alternative = "two.sided")
