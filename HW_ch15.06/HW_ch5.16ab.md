### This homework is written by 林筱慈 (312707042) 

  
Using the NLS panel data on N=716 young women, we consider only years 1987 and 1988. We are interested in the relationship between ln(WAGE) and experience, its square, and indicator variables for living in the south and union membership. Some estimation results are in Table 15.10.  
![TABLE 15 10](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161211617/ce9ac514-acdc-4888-8088-32f981e47c40)

# ch15.06(a)  
  
**Question:**  
The OLS estimates of the ln($WAGE$) model for each of the years
1987 and 1988 are reported in columns (1) and (2). How do the results compare? For these individual year estimations, what are you assuming about the regression parameter values across individuals (heterogeneity)?  
  
**Answer:**  
The ordinary least square (OLS) estimates have little difference for the 1987 and 1988 regressions. The obtained differences are on the order of one standard error or less than it. According to the ordinary least square (OLS) estimates, the population parameter values are identical including intercept of the estimation. The key assumption is that there is **no heterogeneity** across individuals.  




  
# ch15.06(b)  
  
**Question:**  
The ln($WAGE$) equation specified as a panel data regression model
is $$ln(WAGE_{it}) = \beta_1 + \beta_2 EXPER_{it} + \beta_3 EXPER^2_{it} + \beta_4 SOUTH_{it} + \beta_5 UNION_{it} + (u_i+e_{it})$$

Explain any differences in assumptions between this model and the models in part (a).  
  
**Answer:**  
According to the model, the unobserved error components are specified, which is called the **idiosyncratic error** component. It can be represented as $e_{it}$ with one random error varying across individual and time. The other error component is $u_i$, the time invariant and represents **unobserved heterogeneity** across individual. Here, explicitly recognize the use of panel data by adding both individual and time period as the identifying subscripts, it, to teach observable variable. Hence, it is assumed that the error components do not change over a period of the sample.  
