```{r}
#(a)
library(devtools)
install_github("ccolonescu/POE5Rdata")
library(POE5Rdata)
data("mroz")
data("mroz.def")
library(magrittr)
library(readr) 
library(dplyr)

lfp <- mroz$lfp
age <- mroz$age
Children_Less_than_6 <- mroz$kidsl6

worked <- mroz[lfp == 1, ]
not_worked <- mroz[lfp == 0, ]

worked$NWIFEINC <- worked$faminc - worked$wage * worked$hours
not_worked$NWIFEINC <- not_worked$faminc  

summary_worked <- summary(worked, wife_age = age,children_less_than_6 = kidsl6,nwifeinc = nwifeinc)

summary_not_worked <- summary(not_worked,wife_age=age,children_less_than_6 = kidsl6,nwifeinc = nwifeinc)

cat("Summary statistics for women who worked (LFP = 1):\n")
print(summary_worked)
cat("\nSummary statistics for women who did not work (LFP = 0):\n")
print(summary_not_worked)
```
