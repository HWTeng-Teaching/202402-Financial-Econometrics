
### This homework is written by 張永濬 (312707048)

## **Q15.20** ##

This exercise uses data from the STAR experiment introduced to illustrate fixed and random effects for grouped data. In the STAR experiment, children were randomly assigned within schools into three types of classes: small classes with $13–17$ students, regular-sized classes with $22–25$ students, and regular-sized classes with a full-time teacher aide to assist the teacher. Student scores on achievement tests were recorded as well as some information about the students, teachers, and schools.

## ch15.20(a)
Estimate a regression equation (with no fixed or random effects) where $READSCORE$ is related to `SMALL`, `AIDE`, `TCHEXPER`, `BOY`, `WHITE_ASIAN`, and `FREELUNCH`. Discuss the results.

## **Ans.**
1. We estimate that the average reading score will be 5.8 points higher if the students are in a small class instead of a regular sized class. The coefficient is significantly different from zero using a 1% level of significance.
2. Having a teacher aide makes no significant improvement on the average reading score relative to the regular sized class.
3. Each year of teaching experience is estimated to increase average reading score by 0.49 points.
4. Boys are estimated to have 6.16 point lower reading scores than girl.
5. White or Asian students are estimated to have reading scores 3.91 points higher than black students.
6. Those students who receive a free lunch are predicted to have an average reading score that is 14.77 points lower than those who do not.

| Coefficients  |  Estimate    | 
|:-------------:|:------------:|
| `small`       |   5.80 ***   |
| `aide`        |   0.82       |
| `tchexper`    |   0.49 ***   |
| `boy`         |  -6.16 ***   |
| `white_asian` |   3.91 ***   |
| `freelunch`   | -14.77 ***   |

## ch15.20(b)
Reestimate the model in part (a) with school fixed effects. 

Compare the results with those in part (a). Have any of your conclusions changed? 

## **Ans.**
1. The effect of being in a small class is estimated to increase average reading score by 6.49 points, which is slightly larger than the OLS estimate.
2. The estimated effect of teaching experience on average reading score falls to 0.29 points per additional year of experience.
3. The estimated difference between boys and girls average reading scores is slightly smaller than the OLS estimates.
4. The estimated difference in average reading scores between white or Asian students and black students roughly doubles to 8 points.


| Coefficients|  Estimate(OLS)  | Estimate(FE)  |
|:-------------:|:---------------:|:-----------:|
| `small`       |   5.80 ***      |6.49   ***   |
| `aide`        |   0.82          |0.996        |
| `tchexper`    |   0.49 ***      |0.29   ***   |
| `boy`         |  -6.16 ***      |-5.46  ***   |
| `white_asian` |   3.91 ***      |8.03   ***   |
| `freelunch`   | -14.77 ***      |-14.59 ***   |

## ch15.20(c)
Test for the significance of the school fixed effects.

Under what conditions would we expect the inclusion of significant fixed effects to have little influence on the coefficient estimates of the remaining variables?

## **Ans.**
The F-test statistic is $16.698$.

1. The rejection region is $$\{F:F>F_{0.95,78,5681} = 1.27979\}$$ so that we reject the null hypothesis that there are no significant differences between schools.

2. If the school indicator variables are uncorrelated with the included explanatory variables, then they should have little effect on the regression estimates.

```{r}
pFtest(model.within, model.pooling)
```

