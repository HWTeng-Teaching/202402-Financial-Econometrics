##### This homework is written by 張祐慈 (312707005)
# 02.25
## a.
### Construct a histogram of FOODAWAY and its summary statistics. What are the mean and medianvalues? What are the 25th and 75th percentiles?
## Ans.
```
library("POE5Rdata")
data("cex5_small")
foodaway = cex5_small$foodaway
hist(x = foodaway,main = "Histogram of foodaway",xlab = 'Food away')
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786886/b02ecc0c-dfc3-4b74-8b15-041803b10bfc)

```
summary(foodaway)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786886/af1101ab-f35f-4095-a001-639369853bfd)
mean = 49.27 , medianvalues = 32.55 , 25th percentile = 12.04 , 75th percentile = 67.50.

## b.
### What are the mean and median values of FOODAWAY for households including a member with an advanced degree? With a college degree member? With no advanced or college degree member?
## Ans.
```
?cex5_small
```
>advanced
>>=1 if highest educ in HH Masters or Professional/PhD degree

>college
>>=1 if highest educ in HH Bachelor's degree
```
summary(subset(cex5_small,advanced == 1)$foodaway)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786886/da1e637e-c8d2-431d-a749-50c0082aa62f)
For households including a member with an advanced degree, mean is *73.15* and median is *48.15*.
```
summary(subset(cex5_small,college == 1)$foodaway)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786886/aa372a87-18bb-4052-ac55-efeb147f7d7c)
For households including a member with a college degree member, mean is *48.60* and median is *36.11*. 
```
summary(subset(cex5_small,(advanced == 0 & college == 0))$foodaway)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786886/8fc9a7b1-08ac-4582-8b23-60570aa71877)
For households including a member with no advanced or college degree member, mean is *39.01* and median is *26.02*.

