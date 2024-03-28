# 對數-線性模型
model_log_linear <- glm(price ~ log(sqft), data = collegetown)
# 使用模型對數據進行預測
pred_log_linear <- predict(model_log_linear)

# 對數-對數模型
model_log_log <- glm(log(price) ~ log(sqft), data = collegetown)
# 使用模型對數據進行預測
pred_log_log <- exp(predict(model_log_log))

# 線性模型
model_linear <- lm(price ~ sqft, data = collegetown)
# 使用模型對數據進行預測
pred_linear <- predict(model_linear)

# 模型1（對數-線性模型）的預測結果
pred_log_linear <- c(pred_log_linear)

# 模型3（對數-對數模型）的預測結果
pred_log_log <- c(pred_log_log)

# 模型3（線性模型）的預測結果
pred_linear <- c(pred_linear)

# 真實值
actual <- c(collegetown$price)

# 計算均方根誤差 (RMSE) 函數
calculate_rmse <- function(pred, actual) {
  rmse <- sqrt(mean((pred - actual)^2))
  return(rmse)
}

# 計算每個模型的 RMSE
rmse_log_linear <- calculate_rmse(pred_log_linear, actual)
rmse_log_log <- calculate_rmse(pred_log_log, actual)
rmse_linear <- calculate_rmse(pred_linear, actual)

# 輸出結果
cat(paste("Log-linear model's RMSE:", rmse_log_linear))
cat('\n')
cat(paste("Log-log model's RMSE:", rmse_log_log))
cat('\n')
cat(paste("Linear model's RMSE:", rmse_linear))

# 計算均方根誤差 (MSE) 函數
calculate_mse <- function(pred, actual) {
  mse <- mean((pred - actual)^2)
  return(mse)
}

# 計算每個模型的 MSE
mse_log_linear <- calculate_mse(pred_log_linear, actual)
mse_log_log <- calculate_mse(pred_log_log, actual)
mse_linear <- calculate_mse(pred_linear, actual)

# 輸出結果
cat(paste("Log-linear model's MSE:", mse_log_linear))
cat('\n')
cat(paste("Log-log model's MSE:", mse_log_log))
cat('\n')
cat(paste("Linear model's MSE:", mse_linear))
