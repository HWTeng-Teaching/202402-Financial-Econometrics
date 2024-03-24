#04.25(g)
model_1 = lm(ln_price~sqft , data = data)
model_2 = lm(ln_price~ln_sqft , data = data)
model_3 = lm(price~sqft , data = data)
price_1_hat = b1 + 27*b2
price_2_hat = a1 + log(27)*a2
price_3_hat = d1 + 27*d2
tvalue = qt(0.975,498)
vara_1_2 = vcov(model_1)[2,2]
sm1 = summary(model_1)
sigma_hat_1 = sm1$sigma^2 
varf_1 = sigma_hat_1 + sigma_hat_1/500 + (27- mean_sqft)^2 *vara_1_2 
sef_1 = sqrt(varf_1)
lowb_1 =exp( price_1_hat - tvalue *sef_1)
upb_1 =exp( price_1_hat + tvalue * sef_1)
#log-linear[110,418]

tvalue = qt(0.975,498)
vara_2_2 = vcov(model_2)[2,2]
sm2 = summary(model_2)
sigma_hat_2 = sm2$sigma^2 
varf_2 = sigma_hat_2 + sigma_hat_2/500 + (27- mean_sqft)^2 *vara_2_2 
sef_2 = sqrt(varf_2)
lowb_2 = exp(price_2_hat - tvalue *sef_2)
upb_2 = exp(price_2_hat + tvalue * sef_2)
#log-log[111,466]

tvalue = qt(0.975,498)
vara_3_2 = vcov(model_3)[2,2]
sm3 = summary(model_3)
sigma_hat_3 = sm3$sigma^2
varf_3 = sigma_hat_3 + sigma_hat_3/500 + (27- mean_sqft)^2 *vara_3_2
sef_3 = sqrt(varf_3)
lowb_3 = price_3_hat - tvalue *sef_3
upb_3 = price_3_hat + tvalue * sef_3
#linear[44.3,449]