#Example 4.3
install.packages("fields")
library(fields)

rate<-c(6.0, 6.7,4.9, 4.4, 5.8, 4.8, 5.5, 6.7, 4.7, 5.6, 6.5, 6.0,  
        4.7, 5.1, 7.2 , 6.1, 7.7, 5.7, 7.1, 4.2, 5.8, 5.1, 6.3, 5.1, 
        3.9, 4.7, 4.4, 5.9, 4.1, 5.8, 4.9, 5.4, 3.9, 6.0, 4.1, 4.6, 
        5.7, 5.0, 4.5, 6.9, 5.6, 4.6, 4.4, 4.1, 3.2, 6.3, 4.2, 4.7, 
        4.3, 4.3, 4.5, 6.7, 3.9, 4.6, 5.8, 3.8, 5.5, 4.7, 5.0, 4.2, 
        5.0, 4.5, 3.7, 5.5, 5.4, 2.6, 5.0, 4.9, 5.7, 4.3, 5.3, 7.1, 
        7.5, 4.1, 5.1, 5.7, 4.8, 6.1, 6.3, 4.1, 5.7, 7.2, 6.0, 7.2, 
        8.0, 8.7, 8.5, 9.1, 7.5, 10.5, 8.5, 7.4, 10.5, 8.9, 8.5,9.9, 
        8.3, 9.9, 7.2, 9.5, 10.5, 11.9, 11.4, 8.0, 10.5, 11.2, 9.2, 
        9.5, 10.0, 10.3, 9.1, 8.1, 7.9, 9.5, 10.7, 8.5, 9.1, 8.7, 9.0, 8.6)
month<-1:120
plot(month, rate)

#m=1
rate.tps <- Tps(month, rate, m=1)
month.grid<- seq(min(month), max(month), 1)
ratep<-predict(rate.tps, newdata=month.grid)
se<-predictSE(rate.tps, newdata=month.grid)
lines(month, ratep-1.96*se, lty=2)
lines(month, ratep+1.96*se, lty=2)
lines(month, ratep, lty=1)

#m=2
rate.tps <- Tps(month, rate, m=2)
month.grid<- seq(min(month), max(month), 1)
ratep<-predict(rate.tps, newdata=month.grid)
se<-predictSE(rate.tps, newdata=month.grid)
lines(month, ratep-1.96*se, lty=2, col= "blue ")
lines(month, ratep+1.96*se, lty=2, col= "blue ")
lines(month, ratep, lty=1, col= "blue ")

# m: A polynomial function of degree (m-1) will be  
#included in the model as the drift (or spatial trend) 
#component. The default is the value such that 
#2m-k is greater than zero.  


#Example 4.4
library(fields)
library(rgl)
income<-c(114, 79, 69, 44, 18, 32, 62, 77, 35, 66, 71, 25, 92, 44, 85, 71, 43,
          78, 89, 116, 82, 41, 37, 83, 145, 87, 117, 86, 85, 96, 51, 59, 58, 46,
          38, 120, 87, 114, 74, 76, 43, 37, 56, 38, 28, 75, 49, 89, 75, 123,
          122, 111, 76, 55, 39, 46, 45, 55)
grocery<-c(15, 23, 8, 8, 5, 7, 18, 10, 10, 10, 12, 5, 21, 12, 15, 18, 13, 18,
           13, 12, 13, 12, 6, 13, 25, 11, 16, 12, 14, 15, 7, 13, 10, 7, 6, 22,
           10, 17, 11, 10, 8, 5, 11, 8, 5, 11, 12, 10, 20, 22, 25, 12, 10, 7,
           6.5, 12, 8, 13)
entmt<-c(7,3,10,3.5,0.8,2.4,8,3,3.2,16,12,0.6,5,4.5,4,13,1.3,12,2,11,2,1,2.4,
         1,12,12,8,2, 3, 3, 1.6, 4, 3.9, 2.4, 0.3, 5, 2, 5, 15, 8, 1.2, 1.2,
         1.5, 5.6, 1.2, 16, 1.8, 8, 12, 7, 2, 6, 17, 1, 4, 2.8, 2, 9)
#plotting the data
plot3d( income, grocery, entmt)

#fitting the tps model
entmt.tps<-Tps(cbind(income, grocery), entmt, m=2, method="GCV.model")

#using the fitted model for prediction
predict(entmt.tps, data.frame(income=75, grocery=10))
