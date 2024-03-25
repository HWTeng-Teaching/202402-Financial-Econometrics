library(olsrr)
ols_plot_dfbetas(quardratic_model)
# we can see observation 6, 14 has a great influence on the intercept
# observation 14, 43, 44, 48 has a great influence on the quadratic term
ols_plot_resid_stand(quardratic_model)
# a studentized residual is a residual divided by its estimated standard deviation
# Typically, any observation has an absolute value of 2 is an outlier
# observation 14, 28, 43 are outliers
ols_plot_dffits(quardratic_model)
# DFFIT stands for difference in fits, is used to identify influential data points.
# it quantifies the number of sd 
# that the fitted value changes when its data point is omitted
# observation 14, 43, 48 has a great influence
ols_plot_resid_lev(quardratic_model)
# an observation is considered to have high leverage if it has a 
# value for the predictor variables that are much more extreme compared
# to the rest of the observations in the dataset
# observation 14, 28, 43 has a great influence

