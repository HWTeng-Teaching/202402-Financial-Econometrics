### This homework is written by 吳翔詠 (312707040)
Question:
#### 3.27.f  Test the hypothesis that elasticity of sales of brand no. 1 with respect to the price of brand no. 1 from part (e) is minus three against the alternative that the elasticity is not minus three. Use the 10% level of significance. Clearly, state the null and alternative hypotheses in terms of the model parameters, give the rejection region, and the p-value for the test. What is your conclusion?

***sol:***
1. The hypothesis is $H_0:  elasticity = -3 \ v.s. \ H_1: elasticity \neq -3$.This is a two-tailed tests.
2. Test statistic: $\varphi = elasticity - (-3 ) / se(elasticity) \sim t(N-2=50)$ 
3. $a = 0.1$, $RR = \\{ \varphi\ \ \mathbf{|}\ \ |\varphi| > t_{0.05}(50) = 1.675905 \\} $
4. $\varphi^{*} = (-5.059825 +3) /0.9152 = -2.25\in RR$
5. $p-value=0.0288 < 0.1$

We reject the null hypothesis. There is an evidence that the elasticity is 3 is possibly not correct. And we conclude that the elasticity is possibly not -3.

---

code:
```{r}
# 計算t統計量
t_statistic <- (elasticity - (-3)) / se_elasticity

# 計算p值
p_value <- 2 * pt((t_statistic), df = nrow(data) - 2)

# 計算10%水準下的臨界值
t_critical <- qt(0.95, df = nrow(data) - 2)

# 打印結果
print(paste("t-value =", t_statistic))
print(paste("t_critical=", t_critical))
print(paste("p-value =", p_value))
```

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/75521753/92f35a7c-ccac-4e41-92b4-b7bb942cec12)
