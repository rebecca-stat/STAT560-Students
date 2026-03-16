#Example 4.2

install.packages("rgl")  #R Graphics Library
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

#fitting the loess model
entmt.loess<-loess(entmt~income + grocery, degree=1, span=0.47414)

#plotting fitted surface
entmt.fit<-expand.grid(list(income=seq(min(income), max(income),), grocery=seq(min(grocery), max(grocery), 1)))
entmt.predict<-predict(entmt.loess, newdata=entmt.fit) #for 2d: persp(entmt.predict)
persp3d(entmt.predict,col = rainbow(1000))

#using the fitted model for prediction
predict(entmt.loess, data.frame(income=75, grocery=10))               


