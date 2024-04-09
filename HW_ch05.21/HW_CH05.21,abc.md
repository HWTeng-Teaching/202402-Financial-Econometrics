### This homework is written by 曾川（310707054）


## 5.21Using the data in the file toody5, estimate the model
 $Y_t = \beta_1 + \beta_2 TREND_t + \beta_3 RAIN_t + \beta_4 RAIN_t^2 + \beta_5(RAIN_t \times TREND_t)+e_t$/
 
 $Y_t$ is wheat yield in tons per hectare in year t;
 
$TREND_t$ is a trend variable designed to capture technological change, with observations 0, 0.1,0.2, …, 4.7;

$0$ is for the year $1950$, $0.1$ is for the year $1951$, and so on up to $4.7$ for the year $1997$;

 $RAIN_t$ is total rainfall in decimeters (dm) from May to October (the growing season) in year t ;

 ## a.Report your estimates, standard errors, t-values, and p-values in a table.
 <img width="335" alt="image" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161050830/6416ab05-34ca-4340-81a8-92d07ebd8d4b">

```
       library(POE5Rdata)
data(toody5)
head(toody5)
trend=(toody5$trend)
rain=(toody5$rain)
rain_square=(toody5$rain)^2
Y=(toody5$y)

rain_trend=(rain*trend)
model=lm(Y~trend+rain+rain_square+rain_trend)
summary(model)
```
 ## b.Are each of your estimates significantly different from zero at a (i) $5%$ level, (ii) $10%$ level? 
At the 5% significance level, all estimates are significantly different from zero, except for the interaction term between rain and trend (rain_trend). At the 10% significance level, all estimates are significantly different from zero.

 ## c.Do the coefficients have the expected signs? Why? (One of the objectives of technological improvements is the development of drought-resistant varieties of wheat.)

 Consistent with expectations, the variable Trend, representing technological progress, is positively correlated with and significantly affects yield, indicating that technological innovations lead to increased wheat production. The variable Rain, 
 representing rainfall, is also positively correlated with and significantly affects wheat yield, suggesting that an increase in rainfall leads to higher wheat production. The variable $Rain^2$ , representing the square of rainfall, is negatively correlated with wheat yield, 
 indicating that beyond a certain point, the beneficial effects of increased rainfall on yield diminish due to excessive rainfall. The interaction term between Rain and Trend is negatively correlated but not significant, because technological progress is the development of drought-resistant wheat varieties, 
 and with technological advancements, the positive impact of rainfall on yield subsequently weakens.
 
