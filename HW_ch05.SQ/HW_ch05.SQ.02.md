### This homework is written by Nguyen Xuan Thuan (412707007)

#### Special Question: Show that when K=2, b has the same sampling distribution as b1 and b2 in Chapter 2.

#### Answer
We have the multiple regression model
$$Y = X\beta + e$$
where $Y =(y_{1}, ...,y_{N})', \beta = (\beta_{1}, ..., \beta_{K})', e=(e_{1}, ...,e_{N})'$ and

$$
\mathbf{X} =
\begin{bmatrix}
1 & x_{1,2} & \cdots & x_{1,K} \\
1 & x_{2,2} & \cdots & x_{2,K} \\
\vdots & \vdots & \vdots & \vdots \\
1 & x_{N,2} & \cdots & x_{N,K} \\
\end{bmatrix},
$$

The expectation
$$E(b)=\beta$$

The variance
$$Var(b)=\sigma^2(X'X)^{-1}$$

The sampling distribution
$$b \sim N(\beta, \sigma^2 (X'X)^{-1}),$$

##### When K=2 

with
$$Y =(y_{1}, ...,y_{N})', \beta = (\beta_{1}, \beta_{2})', e=(e_{1}, ...,e_{N})'$$ and

$$
\mathbf{X} =
\begin{bmatrix}
1 & x_{1,2} \\
1 & x_{2,2} \\
\vdots & \vdots \\
1 & x_{N,2} \\
\end{bmatrix}
$$

#### The multiple regression model 
$$y = \beta_{1} + \beta_{2}x + e$$

The expectation 
$$E(b_{1}|x)=\beta_{1},$$
$$E(b_{2}|x)=\beta_{2}$$

The variance
$$Var(b_1) = \frac{\sigma^2 \sum x_i^2}{N\sum (x_i - \bar{x})^2},$$
$$Var(b_2) = \frac{\sigma^2}{\sum (x_i - \bar{x})^2}$$

The sampling distribution
$$b_1 \sim N \left( \beta_1, \frac{\sigma^2 \sum x_i^2}{N \sum (x_i - \bar{x})^2} \right),\$$
$$b_2 \sim N \left( \beta_2, \frac{\sigma^2}{\sum (x_i - \bar{x})^2} \right).$$

##### When K=2, b has the same sampling distribution as b1 and b2 in Chapter 2.