load("C:/Users/USER/Desktop/tuna.rdata")
SAL1 <- tuna$sal1
APR1 <- tuna$apr1
PRICE1 <- 100*APR1
line_model <- lm(SAL1~PRICE1)
sum_line <- summary(line_model)
b1 <- coef(sum_line)[1]
b2 <- coef(sum_line)[2]
se_b2 <-coef(sum_line)[4]
df <- sum_line$df[2]
cv <- qt(0.975,df)
CIL <- b2-cv*se_b2
CIH <- b2+cv*se_b2
