# This Homework is writen by Howard
## Question
Test for the significance of the school fixed effects. Under what conditions would we expect the inclusion of significant fixed effects to have little influence on the coefficient estimates of remaining variables?

## Solution

|    term       |       OLS       |     RE      |       FE       |    Mundlak    |
|:-------------:|:---------------:|:-----------:|:--------------:|:-------------:|
| C             | 437.7643 ***    | 436.1336 *** | 436.1959 ***   | 461.1440 ***  |
|               | (1.3462)        | (2.0526)     | (1.5419)       | (19.4441)     |
| SMALL         | 5.8228 ***      | 6.4580 ***   | 6.4902 ***     | 6.4896 ***    |
|               | (0.9893)        | (0.9127)     | (0.9130)       | (0.9129)      |
| AIDE          | 0.8178          | 0.9920       | 0.9961         | 0.9998        |
|               | (0.9530)        | (0.8813)     | (0.8817)       | (0.8816)      |
| TCHEXPER      | 0.4925 ***      | 0.3031 ***   | 0.2856 ***     | 0.2855 ***    |
|               | (0.0696)        | (0.0703)     | (0.0708)       | (0.0708)      |
| BOY           | -6.1564 ***     | -5.5134 ***  | -5.4559 ***    | -5.4564 ***   |
|               | (0.7961)        | (0.7278)     | (0.7276)       | (0.7276)      |
| WHITE_ASIAN   | 3.9058 ***      | 7.3367 ***   | 8.0280 ***     | 8.0293 ***    |
|               | (0.9536)        | (1.4294)     | (1.5357)       | (1.5356)      |
| FREELUNCH     | -14.7713 ***    | -14.5842 *** | -14.5936 ***   | -14.5934 ***  |
|               | (0.8902)        | (0.8747)     | (0.8800)       | (0.8800)      |
| SMALLM        |                 |              |                | -19.3608      |
|               |                 |              |                | (21.2254)     |
| AIDEM         |                 |              |                | 14.2430       |
|               |                 |              |                | (19.4280)     |
| TCHEXPERM     |                 |              |                | 0.9655        |
|               |                 |              |                | (0.5928)      |
| BOYM          |                 |              |                | -52.4233 *    |
|               |                 |              |                | (24.0548)     |
| WHITE_ASIANM  |                 |              |                | -7.0014       |
|               |                 |              |                | (6.0043)      |
| FREELUNCHM    |                 |              |                | -3.9427       |
|               |                 |              |                | (8.3429)      |
| N             | 5766            | 5766         | 5766           | 5766          |



The random effects estimates are in column. Overall the random effects 
estimates appear much the same as the OLS estimates and seem very similar to the fixed effects 
estimates. 
## (i) 
In project STAR students were randomized within schools but not across schools. Some 
schools will be in wealthy school districts and some in poorer school districts. Household 
incomes affect home learning environments and resources, which are roughly captured by 
the FREELUNCH indicator. Also, wealthy school districts may pay higher salaries and 
may have more able and more experienced teachers. 
## (ii) 
The LM test statistic in equation does not exactly apply in this case because the 
number of individuals per school is not constant. As a simplification we use the average 
number of observations per school in its place, T = 73 . The resulting value of the LM 
statistic is 2247.96 which is large relative to the standard normal critical value 1.96. The 
LM2 statistic produced by the software R is 6677.42 which is greater than the $X_{(1)}$
critical value 3.84. We conclude that there is evidence of unobserved heterogeneity across 
schools. 
