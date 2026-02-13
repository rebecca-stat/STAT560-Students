#Example 2.3
Monica<-c(3, 4, 4, 5, 5, 5, 10, 10)
Bob<-c(2, 2, 3, 4, 4, 5, 10, 10)
Jeff<-c(1, 1, 2, 4, 4, 5, 10, 10, 10)
Scores<-list(sample1=Monica, sample2=Bob, sample3=Jeff)
kruskal.test(Scores)


#Example 2.4
aerobics<-c(6.7, 7.7, 10.0, 9.4, 9.1)
pilates<-c(10.5, 12.8, 13.1, 13.4)
step<-c(13.0, 11.2, 11.8, 11.6)
cardio<-c(19.0, 15.3, 17.5, 22.4)
WeightLoss<-list(sample1=aerobics, sample2=pilates, sample3=step,
                 sample4=cardio)
kruskal.test(WeightLoss)

wilcox.test(step,aerobics, paired=FALSE, alternative="two.sided")
wilcox.test(pilates, step, paired=FALSE, alternative="two.sided")
wilcox.test(cardio, pilates, paired=FALSE, alternative="two.sided")
wilcox.test(cardio,step, paired=FALSE, alternative="two.sided")
