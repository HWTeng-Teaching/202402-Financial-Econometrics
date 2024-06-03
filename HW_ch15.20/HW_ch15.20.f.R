load("/Users/ivywu/Downloads/poe5rdata/star.rdata")

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
linearHypothesis(plm.random.m, c("boym = 0", "white_asianm = 0", "freelunchm = 0"))

'''
Hypothesis:
boym = 0
white_asianm = 0
freelunchm = 0

Model 1: restricted model
Model 2: readscore ~ small + aide + tchexper + tchmasters + boy + white_asian + 
  freelunch + boym + white_asianm + freelunchm

Res.Df Df  Chisq Pr(>Chisq)  
1   5758                       
2   5755  3 7.2087    0.06554 '''
