```r
library("POE5Rdata")
data("mexican")
library(plm)

lnprice.within <- plm(lnprice~bar+street+othersite+nocondom+attractive+school+age+rich+regular+alcohol, data=mexican, model="within")
summary(lnprice.within)

lnprice.random <- plm(lnprice~bar+street+othersite+nocondom+attractive+school+age+rich+regular+alcohol, data=mexican, model="random")
summary(lnprice.random)

hausman_test <- phtest(lnprice.within, lnprice.random)
print(hausman_test)

chi_sq <- qchisq(0.95, df = 6)
print(chi_sq)
```