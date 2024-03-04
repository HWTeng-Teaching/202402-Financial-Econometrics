# Chapter 01
# Reviewed and edited by Huei-Wen Teng
# Last updated 20240228

rm(list=ls()) # Caution: this clears the Environment

# "#" used for comments 

# install some useful packages

# Need to do the following three steps as as a start!
#install.packages("devtools") # It may takes 3 - 5 mintunes for the first time 
#library(devtools)
#install_github("ccolonescu/PoEdata")  # Fixed by TA. Need to use R version 4.2.2 

library(PoEdata)

# other packages used frequently in this course
#install.packages("bookdown")
#install.packages("knitr")
#install.packages("xtable")
#install.packages("stargazer")
#install.packages("rmarkdown")
library(bookdown)
library(Knitr)
library(xtable)
library(printr)
library(stargazer)
library(rmarkdown)

data("andy")  # This is the way that we download the data
?andy  # provides info for the dataset

andy

# let's look around the data
# Check possible relationships between variables
# Think about possible models to use.

head(andy)
tail(andy)
nrow(andy)


# andy is a matrix
v1 = andy[,1];
v1
v2 = andy[,2];
v3 = andy[,3];


plot(v1); # scatter plot of v1 against index
plot(v2);
plot(v3);


# Get a scatter plot of sales versus price index 
plot(v2, v1);
plot(v3, v1);
pairs(andy)		# pairwise scatterplots
boxplot(andy)
hist(v1)		# histogram


# creating graphs
# - add another curve to the existing graph:
curve(x^1, from = -2, to = 2, xlab ="x", ylab= "y=x" );
curve(x^2, add = TRUE)


# - 
plot(1: 100, type = 'n') # creates asn empty graph
curve(sqrt(x), from = 0, to = 100, xlab = "x", ylab = "y");

# - 
plot(1:10, type= 'n') # creates asn empty graph
abline(a=9, b = -0.5, h = 3.5, v = 4); # add lines

# - 
curve(x^2, from = 0, to = 20)
abline(v = 10)



# bernoulli and binomial distributions
?rbinom				# check rbinom in R
nSample = 100000;
size = 10;
prob = 1/3; 
x = rbinom(nSample, size, prob);
x

table(x)		# check the frequency of outputs
hist(x)


# poisson distribution
#?rpois
#nSample = 1000;
#lambda = 10;
#x = rpois(nSample, lambda)
#x
#table(x)		# check the frequency of outputs
#hist(x)


# uniform distribution
#?runif

#x = runif(nSample, min=0, max =1)
#hist(x)
#plot(density(x))

# exponential and gamma distribution
#?rexp
#?rgamma
#x = rgamma(nSample, 10, 2)
#x
#hist(x)

# normal distribution
?rnorm
nSample = 100000; # 
x = rnorm(nSample, mean = 10, sd = 10);
x
plot(x) 	#scatter plot

# Check if data looks like normally distributed?
hist(x)	# scatter plot
plot(density(x))
plot(density(x))  # density plot

# QQplot. 
# Conclusion: 
# If data is normally distributed, a streight line will be seen. 
# If data is not normally distributed, a curvature will be seen. 
qqnorm(x)


xx = rgamma(nSample, 10, 2)
hist(xx)
plot(density(xx))
qqnorm(xx)


xx = runif(nSample, 2, 20)
hist(xx)
qqnorm(xx)



n = 1:1000;
an = 1 + (3*n+2)/(6*n);
plot(n, an)



# An illustration of the central limit theorem
par(mfrow=c(3,2));	# allocate multiple figures
lambda = 1;
mu = lambda;
sig2 = lambda;
n = 500;          ## sample size. Need to show that sumx_n -> Z as n goes to infinity

nRep = 10000;               # number of replicates 
Xbar = rep(0, nRep);
Xbar_n = rep(0, nRep);

for(idx in 1 : nRep)
{
  x = rexp(n, lambda);
  Xbar[idx] = mean(x);
  Xbar_n[idx] = ( Xbar[idx] - mu ) / sqrt( sig2/n);
}

hist(Xbar);hist(Xbar_n);
plot(density(Xbar));
plot(density(Xbar_n));
xx = seq(-3, 3, by = 0.01);
lines(xx, dnorm(xx, 0,1), col = "red")

plot(ecdf(Xbar), do.points= FALSE)
plot(ecdf(Xbar_n), do.points= FALSE)
lines(xx, pnorm(xx), col="red");


## example in the hw

# i)
x = 20
pbinom(x, 100, 0.25)

# ii)
p = 0.25;
mu = p;
sig = p*(1-p);
n = 100;
apple = (x - mu*n )/(sqrt(n)*sig);
pnorm(apple, 0, 1)