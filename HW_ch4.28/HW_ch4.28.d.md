#### Time: 1~47 (1950-1996)

#### Yield: Average wheat yield in tonnes per hectare in Northampton Shire from 1950-1996

#### Model: $YIELD_t = \gamma_0 + \gamma_1 \times TIME^2 + e_t$ 
#### The predictor: $\widehat{YIELD_t} = 0.7842 + 0.00048 \times TIME^2$

#### Predicting the yield of 1997: $\widehat{YIELD_{48}} = 0.7842 + 0.00048 \times 48^2 = 1.881$

#### $se(f) = \sqrt{\hat{var}(f)} = \sqrt{\hat{\sigma}[1 + \frac{1}{N} + \frac{(x_0 - \bar{x})^2}{\sum (x_i - \bar{x})^2}]} = \sqrt{0.2372[1 + \frac{1}{47} + \frac{(48 - 24)^2}{\sum (x_i - 24)^2}]} = 0.5558$

#### $\alpha = 0.05$

#### $t_c = t_{N-2,\frac{\alpha}{2}} = t_{47-2,\frac{0.05}{2}} = t_{45,0.025} = 2.014$

#### The 95% prediction interval for $YIELD_{48}$ is $\widehat{YIELD_{48}} \pm t_{45,0.025} se(f) = 1.881 \pm 2.014 \times 0.5558 = [0.7618 , 3.012]$

#### It contains the true value in 1997: 2.2318
