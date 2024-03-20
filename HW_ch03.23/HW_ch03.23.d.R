```{r}
library("POE5Rdata")
data("collegetown")

price<- collegetown$price
str(subset(collegetown,sqft == 20)$price)
summary(subset(collegetown,sqft == 20)$price)
```
