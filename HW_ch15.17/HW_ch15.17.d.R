library(devtools)
install_github("ccolonescu/POE5Rdata")
library(POE5Rdata)
install.packages("plm")
install.packages("lmtest")
library(plm)
library(lmtest)
library(dplyr)

data(liquor5)

uhh = unique(liquor5$hh)
for (hh in uhh) {
  hh_data = liquor5[liquor5$hh == hh, ]
  mean_income = mean(hh_data$income)
  liquor5$incomem[liquor5$hh == hh] = mean_income
}

pd=pdata.frame(liquor5, index = c("hh", "year"))
mod=plm(liquor ~ income+incomem, data = pd, model = "random")
summary(mod)

summary(mod)$coefficients["incomem",]

#mod2=plm(liquor~income,data=pd,model="random")
#summary(mod2)