d
```{r}
library(systemfit)
model_OLS=lm(i~p+plag+klag,data=klein)
summary(model_OLS)
model_reduce=lm(p~plag+klag+w2+g+tx+time+elag,data=klein)
predicted_p <- predict(model_reduce)
eqs <- i~p+plag+klag
ivs <- ~plag+klag+w2+g+tx+time+elag
sys <- systemfit(eqs,method="2SLS",inst=ivs,data=klein)
summary(sys)
```
e
```{r}
p_hat <- c(NA, predicted_p)
model_OLS_2SLS=lm(i~p_hat+plag+klag,data=klein)
summary(model_OLS_2SLS)
```

f
```{r}
model_residuals <- residuals(model_OLS_2SLS)
model_residuals_NA<- c(NA, model_residuals)
model_TR=lm(model_residuals_NA~plag+klag+w2+g+tx+time+elag,data=klein)
summary(model_TR)
n <- length(model_reduce$fitted.values)
R_square_TR <- summary(model_TR)$r.squared
sargon <- n*R_square_TR
alpha <- 0.05
L <- 5
B <- 1
chisq <- qchisq(1- alpha, L-B)
sargon
chisq
```
