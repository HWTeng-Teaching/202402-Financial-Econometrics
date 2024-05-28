```{r echo=TRUE, message=FALSE, warning=FALSE}
rm(list=ls())
library(POE5Rdata)
library(plm)
library(nlme)

# a
data("star")
star.pd <- pdata.frame(star, index = c("schid"))
# Estimate a pooled OLS model
model.pooling <- plm(readscore ~ small + aide + tchexper + boy + white_asian + freelunch,data = star.pd, model = "pooling")
summary(model.pooling)
a= lm(readscore ~ small + aide + tchexper + boy + white_asian + freelunch,data = star)
summary(a)

# b
star.pd <- pdata.frame(star, index = c("schid")) 
model.within <- plm(readscore ~ small + aide + tchexper + boy + white_asian + freelunch, data = star.pd, model = "within")
summary(model.within)

# c
pFtest(model.within, model.pooling)
df1 = 78
df2 = 5681
qf(0.95, df1, df2)


```
