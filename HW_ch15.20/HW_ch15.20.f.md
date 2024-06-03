## Ch15.20 (f)

This homework is written by 吳悅寧 (312707056)

**Question**\
Create school-averages of the variables and carry out the Mundlak test for correlation between them and the unobserved heterogeneity.
\
**Answer**

-   Sample code
``` r
load("/Users/ivywu/Downloads/poe5rdata/star.rdata")

# Rename to stuid because R does not like the variable name id
star$stuid <- star$id
install.packages("plm")
library(plm)
install.packages("car")
library(car)

# Get average of variables by teacher
teacher.mean <- aggregate(cbind(boy, white_asian, freelunch) ~ tchid, star, mean) # Rename columns to indicate they are averages
names(teacher.mean) <- paste(names(teacher.mean), c("", "m", "m", "m"), sep = "") # Merge averages with original panel data
star.m <- merge(star, teacher.mean, on = "tchid")
# Estimate random effects with averaged variables
plm.random.m <- plm(readscore ~ small + aide + tchexper + tchmasters + boy +
                      white_asian + freelunch + boym + white_asianm + freelunchm,
                    data = star.m,
                    index = c("tchid", "stuid"),
                    model = "random",
                    random.method = "walhus")
# Test that average variables are jointly different from 0
```


Testing the joint significance of these variables, we obtain a Wald test of 7.2087, The critical value of 5% = 7.815, we cannot reject the null hypothesis that the random effects are uncorrelated with the regressors.
