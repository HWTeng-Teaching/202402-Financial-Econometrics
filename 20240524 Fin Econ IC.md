I. 

$$ln(SALES_{it})=\beta_1+\beta_2\ln(CAPITAL_{it})+\beta_3\ln(LABOR_{it})+u_i+e_{it}.$$

(a) write down $t=1,t=2$

$$ln(SALES_{i1})=\beta_1+\beta_2\ln(CAPITAL_{i1})+\beta_3\ln(LABOR_{i1})+u_i+e_{i1}.\ \dots (1)$$

$$ln(SALES_{i2})=\beta_1+\beta_2\ln(CAPITAL_{i2})+\beta_3\ln(LABOR_{i2})+u_i+e_{i2}.\ \dots (2)$$

(b) Please write down explicitly the model for implementing the difference estimator.

$$\Delta \ln(SALES_{i1})=\beta_2\Delta\ln(CAPITAL_{i1})+\beta_3\Delta\ln(LABOR_{i1})+\Delta e_{i1}$$

where  $\Delta \ln(SALES_{i1})=ln(SALES_{i2})-ln(SALES_{i1})$ , $\Delta\ln(CAPITAL_{i1})=\ln(CAPITAL_{i2})-\ln(CAPITAL_{i1})$, $\Delta\ln(LABOR_{i1})=\ln(LABOR_{i2})-\ln(LABOR_{i1})$, $\Delta e_{i1}=e_{i2}-e_{i1}$

II.
(a). Define the dummy variable $D_{1i}$, $D_{2i}$, $D_{3i}$

| $i$| $t$ | $D_{i1}$ | $D_{2i}$ | $D_{3i}$ |
|----------|----------|----------|----------|----------|
| 1  | 1   | 1 | 0  | 0  |
| 1  | 2   | 1 | 0 | 0 |
| 1  |3 | 1  |0  | 0 |
| 2  | 1 | 0 | 1  | 0 |
| 2  | 2 | 0 | 1  | 0 |
| 2  | 3 | 0 | 1  | 0 |
| 3  | 1 | 0 | 0  | 1 |
| 3  | 2 | 0 | 0  | 1 |
| 3  | 3 | 0 | 0  | 1 |

(b) Write down the fixed effect model in this example

$$y_{it}= \beta_{11}D_{1i}+\beta_{12}D_{2i}+\beta_{13}D_{3i}+\beta_2 x_{it}+e_{it}$$
