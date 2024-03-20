```{r}
library("POE5Rdata")
data("collegetown")

price<- collegetown$price
summary(subset(collegetown,sqft == 20)$price)
```
