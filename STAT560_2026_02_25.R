#Example 3.5

Psoriasis<- matrix(c(2, 8, 8, 2, 6, 4), nrow = 2, dimnames = list(Relief = c('Yes','No'), Group=c('Placebo','Drug A','Drug B')))
fisher.test(Psoriasis)
