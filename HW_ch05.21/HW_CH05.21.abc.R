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
