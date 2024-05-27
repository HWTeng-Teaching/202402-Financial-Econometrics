


<img width="785" alt="image" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/55239313/34abeddf-a602-46d3-a5de-288ae46752b3">

$$
\begin{cases}y_1\sim y_2+x_2+x_3\dots (\alpha)\\
y_1\sim y_2+x_4\dots (\beta)
\end{cases}
$$

IV: $y_1,y_2$

Exogenous: $x_2,x_3,x_4$

I. 

Apply the $(M-1)$ rule , which equation are identifued?

M = 2

$\alpha$ : 1 variable omitted

$\beta$ : 2 variable omitted 

Both identified.

II. 

First stage

$$y_2 = \beta_1 +beta_2x_2+\beta_3x_3+\beta_4 x_4+\epsilon_i$$

By OLS 

$$\hat{y}_2 = \hat{\beta}_1 +\hat{\beta}_2x_2+\hat{\beta}_3x_3+\hat{\beta}_4 x_4$$

$$
\begin{cases}y_1\sim (\hat{\beta}_1 +\hat{\beta}_2x_2+\hat{\beta}_3x_3+\hat{\beta}_4 x_4)+x_2+x_3\dots (\alpha),\beta_4 \ne 0\\
y_1\sim (\hat{\beta}_1 +\hat{\beta}_2x_2+\hat{\beta}_3x_3+\hat{\beta}_4 x_4)+x_4\dots (\beta) \text{ At least }\beta_2,\beta_3 \text{ not zero}
\end{cases}
$$
