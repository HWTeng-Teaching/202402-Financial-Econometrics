setwd("C:/Users/alber/OneDrive/桌面/計量/HW1")
#install.packages("ggplot2")
cps_data <- read_csv("cps5_small.csv")#讀取cps_small檔

#28e
# Fit quadratic regression model
quad_model <- lm(wage ~ (educ^2), data = cps_data)#設定二次式

# Summary of the quadratic regression results
summary(quad_model)

# Calculate marginal effects
edu_12 <- predict(quad_model, newdata = data.frame(educ = 12))
edu_16 <- predict(quad_model, newdata = data.frame(educ = 16))
marginal_effect_12 <- diff(edu_12)#把educ設定為12年
marginal_effect_16 <- diff(edu_16)
marginal_effect_12
marginal_effect_16
a1 <- coef(quad_model)[1]
a2 <- coef(quad_model)[2]
emargin12=2*a2*12#57.6
emargin16=2*a2*16#76.8
#28f
# Scatterplot with linear regression line
ggplot(cps_data, aes(x = educ, y = wage)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, color = "red")+
  labs(title = "Quadratic Regression Model and Linear Regression Model")

# Scatterplot with quadratic regression line
ggplot(cps_data, aes(x = educ, y = wage)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, color = "red") +
  labs(title = "Quadratic Regression Model")
