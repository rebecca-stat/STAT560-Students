#Example 6.1
install.packages("survival")
library(survival)
hours<-c(2, 5, 8, 8, 10, 16, 22, 36, 40, 42, 47, 50, 50, 52, 52, 52, 59, 67, 84)
censored<-c(1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1)

hours.surv <- survfit(Surv(hours, censored==0)~ 1, conf.type="none", se.fit=FALSE) 
# Surv() creates a survival object
# survfit() Estimates Kaplan-Meier survival curve
# censored==0 means event occurred for those objects
summary(hours.surv)

# Plotting Survival Curve
plot(hours.surv, mark.time = TRUE, 
     pch = 1, col = 4, 
     main = 'Kaplan-Meier Survival Curve', 
     xlab = 'Hours', 
     ylab = 'Survival Distribution Function')
#drop-outs are marked by circles.

