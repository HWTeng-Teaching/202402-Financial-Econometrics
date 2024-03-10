#a
wage <- cps5_small$wage
edu <- cps5_small$educ

mod1 <- summary(wage)
mod2 <- summary(edu)

mod1
mod2

hist(wage)
hist(edu)

#b
mod <- lm(cps5_small$wage ~ cps5_small$educ, data = cps5_small)
mod
summary(mod)
