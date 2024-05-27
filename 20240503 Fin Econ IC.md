# 20240503 Fin Econ IC 


## Q1. 

Find the MM in the simple linear regression $y=\beta_1+\beta_2 x + \varepsilon$. Suppose that $x$ is endogenous and  $z$ is a good IV.
1. How many parameters in the simple linear regression

  2 parameters
2. Write down the two moments conditions. 
  $$E(e)=0$$
  $$E(eZ) = 0$$

3. Express the two moments in step 2 using paremeters.
 $$E(e)=0 \Rightarrow E[(y-\beta_1-\beta_2 x)]=0.$$
$$ E(ze) = 0 \Rightarrow E[z(y-\beta_1-\beta_2 x)]=0.$$ 
4. Express parameters using moments. 
$$\beta_2 = \frac{E(yx)-E(y)E(z)}{E(xz)-E(x)E(z)}=\frac{E((y-E(y))(z-E(z)))}{E((x-E(x))(z-E(z)))}$$
$$\beta_1 = E(y) - \beta_1 E(x).$$
5. Write down the MM estimators for $\beta_1$ and $\beta_2$. 
$$\hat{\beta}_2=\frac{\sum(z_i-\bar{z})(y_i-\bar{y})}{\sum(z_i-\bar{z})(x_i-\bar{x})}$$
$$\hat{\beta}_1 =\hat{y}-\hat{\beta}_2 \bar{x}.$$

## Q2. 

If the model is

$y=\beta_1+\beta_2x_2+\beta_3x_3+\beta_4 x_4+ e$
where $x_2$ is exogenous, but $x_3$ and $x_4$ are endogenous. 

If we have three IVs, $z_1$, $z_2$, and $z_3$. 

Suppose we use all these three IVs. 

1. Write down the first stage equation in the 2SLS.

 
$$ x_{3} = \gamma_{11} + \gamma_{21} x_2 +\theta_{11}z_1+\theta_{21}z_2+\theta_{31}z_3+\nu_1$$ 
$$ x_{4} = \gamma_{12} + \gamma_{22} x_2 +\theta_{12}z_1+\theta_{22}z_2+\theta_{32}z_3+\nu_2$$


2. Write down the second stage equation.
   
$$ y=\beta_1+\beta_2x_2+\beta_{3}\hat{x}_{3}+\beta_{4}\hat{x}_{4}+e^*.$$

