library(devtools)
library(POE5Rdata)
library(plm)
library(lmtest)
data = (liquor5)

data_p <- pdata.frame(data, index = c("hh", "year"))

model_re <- plm(liquor ~ income, data = data_p, model = "random")

summary(model_re)

conf_interval_re <- confint(model_re, level = 0.95)

conf_interval_re
