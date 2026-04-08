
library(survival)
age<-c(31, 33, 78, 32, 48, 70, 57, 74, 71, 59, 53, 55, 79, 47, 75, 78, 29, 76, 74, 71, 55, 44, 65, 40, 69, 61, 50, 85, 39, 69)  
gender<-c('F', 'F', 'M', 'F', 'F', 'M', 'F', 'M', 'M', 'M', 'M', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'M', 'F', 'M', 'F', 'F',
          'F', 'M', 'M', 'F', 'M', 'M')
site<-c('axial', 'axial', 'axial', 'extremity', 'extremity', 'extremity', 'axial', 'extremity', 'axial', 'axial', 
        'axial', 'extremity', 'extremity', 'axial', 'axial', 'extremity', 'extremity', 'axial', 'extremity', 'axial', 'extremity', 'axial', 'extremity', 'axial', 'extremity', 'axial', 'axial', 'extremity', 'extremity', 'axial')                    
thickness<-c(3.3, 4.2, 4.1, 6.1, 3.6, 2.6, 1.6, 2.4, 2.7, 4.2, 1.3, 2.7, 1.6, 2.2, 3.2, 2.7, 1.8, 3.6, 4.2, 2.5, 2.5, 1.9, 2.2, 2.2, 3.5, 4.4, 2.1, 2.4, 5.8, 3.5)  
length<-c(5.0, 3.4, 3.3, 5.0, 1.2, 5.0, 5.0, 2.7, 5.0, 4.6, 5.0, 4.8, 5.0, 5.0, 2.3, 0.6, 4.4, 2.0, 3.5, 2.1, 5.0, 5.0, 3.3, 5.0,
          3.7, 4.4, 4.5, 2.8, 5.0, 3.9)
censored<-c(1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0)

gender.rel<- relevel(as.factor(gender), ref="M")
site.rel<- relevel(as.factor(site), ref="extremity")
cox.model<-coxph(Surv(length, censored==0) ~ age+gender.rel
                 +site.rel+thickness)#estimates the regression coefficients for Cox model

base.surv<-survfit(cox.model)
summary(base.surv)
#estimates the baseline survival function computed at the mean values of predictors (the same as in SAS)




