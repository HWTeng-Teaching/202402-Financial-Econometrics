library(POE5Rdata)

YIELD <- wa_wheat$northampton
logYIELD <- log(wa_wheat$northampton)
TIME <- wa_wheat$time
TIME2 <- wa_wheat$time ^ 2

new_TIME <- TIME[1:length(TIME)-1]
new_TIME2 <- TIME2[1:length(TIME2)-1]
new_YIELD <- YIELD[1:length(YIELD)-1]
new_mod <- lm(new_YIELD ~ new_TIME2)
g1 <- coef(new_mod)[[1]]
g2 <- coef(new_mod)[[2]]
y_hat <- g1 + g2 * 48^2
sigma_hat2 <- summary(new_mod)$sigma ^ 2
var_f <- sigma_hat2 + sigma_hat2 / length(new_TIME2) + sigma_hat2 * ((48-mean(new_TIME))^2 / sum((new_TIME-mean(new_TIME))^2))
se_f <- sqrt(var_f)

alpha = 0.05
cv1 <- qt(1-alpha/2,47-2)
cv2 <- qt(alpha/2,47-2)

up_b <- y_hat + cv1 * se_f
low_b <- y_hat + cv2 * se_f
low_b; up_b
