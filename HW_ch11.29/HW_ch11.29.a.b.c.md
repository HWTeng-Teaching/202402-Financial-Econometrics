# 29

## a

    data_29 <- read.csv("C:/Users/Lab_615/Desktop/klein.csv")
    # a
    reg_29_a <- lm(cn~total_wage+p+plag, data = data_29)
    library(broom);library(knitr)
    sum_reg_29_a <- tidy(reg_29_a)
    kable(sum_reg_29_a)

<table>
<thead>
<tr class="header">
<th style="text-align: left;">term</th>
<th style="text-align: right;">estimate</th>
<th style="text-align: right;">std.error</th>
<th style="text-align: right;">statistic</th>
<th style="text-align: right;">p.value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">(Intercept)</td>
<td style="text-align: right;">16.2366003</td>
<td style="text-align: right;">1.3026983</td>
<td style="text-align: right;">12.4638227</td>
<td style="text-align: right;">0.0000000</td>
</tr>
<tr class="even">
<td style="text-align: left;">total_wage</td>
<td style="text-align: right;">0.7962187</td>
<td style="text-align: right;">0.0399439</td>
<td style="text-align: right;">19.9334155</td>
<td style="text-align: right;">0.0000000</td>
</tr>
<tr class="odd">
<td style="text-align: left;">p</td>
<td style="text-align: right;">0.1929344</td>
<td style="text-align: right;">0.0912102</td>
<td style="text-align: right;">2.1152727</td>
<td style="text-align: right;">0.0494735</td>
</tr>
<tr class="even">
<td style="text-align: left;">plag</td>
<td style="text-align: right;">0.0898849</td>
<td style="text-align: right;">0.0906479</td>
<td style="text-align: right;">0.9915824</td>
<td style="text-align: right;">0.3353061</td>
</tr>
</tbody>
</table>

    df.residual(reg_29_a) #17 因為plag少了一個數

    ## [1] 17

    qt(1-0.05/2,17) #2.109816

    ## [1] 2.109816

## b

    reg_29_b <- lm(w1~plag+klag+w2+g+tx+time+elag, data = data_29)
    resid_full_model <- resid(reg_29_b)
    sse_29_b <- sum(resid_full_model^2)
    sum_reg_29_b <- tidy(reg_29_b)
    kable(sum_reg_29_b)

<table>
<thead>
<tr class="header">
<th style="text-align: left;">term</th>
<th style="text-align: right;">estimate</th>
<th style="text-align: right;">std.error</th>
<th style="text-align: right;">statistic</th>
<th style="text-align: right;">p.value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">(Intercept)</td>
<td style="text-align: right;">43.4355670</td>
<td style="text-align: right;">25.4185491</td>
<td style="text-align: right;">1.7088138</td>
<td style="text-align: right;">0.1112346</td>
</tr>
<tr class="even">
<td style="text-align: left;">plag</td>
<td style="text-align: right;">0.8719205</td>
<td style="text-align: right;">0.4169604</td>
<td style="text-align: right;">2.0911352</td>
<td style="text-align: right;">0.0567174</td>
</tr>
<tr class="odd">
<td style="text-align: left;">klag</td>
<td style="text-align: right;">-0.1229519</td>
<td style="text-align: right;">0.0957213</td>
<td style="text-align: right;">-1.2844778</td>
<td style="text-align: right;">0.2213927</td>
</tr>
<tr class="even">
<td style="text-align: left;">w2</td>
<td style="text-align: right;">-0.4437280</td>
<td style="text-align: right;">2.0362184</td>
<td style="text-align: right;">-0.2179177</td>
<td style="text-align: right;">0.8308766</td>
</tr>
<tr class="odd">
<td style="text-align: left;">g</td>
<td style="text-align: right;">0.8662196</td>
<td style="text-align: right;">0.3143282</td>
<td style="text-align: right;">2.7557810</td>
<td style="text-align: right;">0.0163562</td>
</tr>
<tr class="even">
<td style="text-align: left;">tx</td>
<td style="text-align: right;">-0.6041528</td>
<td style="text-align: right;">0.3485756</td>
<td style="text-align: right;">-1.7332043</td>
<td style="text-align: right;">0.1066967</td>
</tr>
<tr class="odd">
<td style="text-align: left;">time</td>
<td style="text-align: right;">0.7135841</td>
<td style="text-align: right;">0.6253158</td>
<td style="text-align: right;">1.1411579</td>
<td style="text-align: right;">0.2743903</td>
</tr>
<tr class="even">
<td style="text-align: left;">elag</td>
<td style="text-align: right;">0.0953290</td>
<td style="text-align: right;">0.2267514</td>
<td style="text-align: right;">0.4204121</td>
<td style="text-align: right;">0.6810506</td>
</tr>
</tbody>
</table>

    df_full <- df.residual(reg_29_b) #13
    reg_29_b_reduced <- lm(w1~w2+plag, data = data_29)
    sum_reg_29_b_reduced <- tidy(reg_29_b_reduced )
    kable(sum_reg_29_b_reduced)

<table>
<thead>
<tr class="header">
<th style="text-align: left;">term</th>
<th style="text-align: right;">estimate</th>
<th style="text-align: right;">std.error</th>
<th style="text-align: right;">statistic</th>
<th style="text-align: right;">p.value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">(Intercept)</td>
<td style="text-align: right;">6.225622</td>
<td style="text-align: right;">2.4090046</td>
<td style="text-align: right;">2.584313</td>
<td style="text-align: right;">0.0187057</td>
</tr>
<tr class="even">
<td style="text-align: left;">w2</td>
<td style="text-align: right;">1.991352</td>
<td style="text-align: right;">0.2403637</td>
<td style="text-align: right;">8.284744</td>
<td style="text-align: right;">0.0000001</td>
</tr>
<tr class="odd">
<td style="text-align: left;">plag</td>
<td style="text-align: right;">1.217772</td>
<td style="text-align: right;">0.1167577</td>
<td style="text-align: right;">10.429906</td>
<td style="text-align: right;">0.0000000</td>
</tr>
</tbody>
</table>

    resid_reduced_model <- resid(reg_29_b_reduced)
    sse_29_b_reduced <- sum(resid_reduced_model^2)

    f_statistic <- ((sse_29_b_reduced-sse_29_b)/5)/(sse_29_b/13)
    f_statistic

    ## [1] 2.532972

    Critical_value_F <- qf(0.95, 5, 13)
    Critical_value_F

    ## [1] 3.025438

    v_1 <- resid(reg_29_b) #save residuals

## c

    reg_29_c <- lm(p~plag+klag+w2+g+tx+time+elag, data = data_29)
    sum_reg_29_c <- tidy(reg_29_c)
    kable(sum_reg_29_c)

<table>
<thead>
<tr class="header">
<th style="text-align: left;">term</th>
<th style="text-align: right;">estimate</th>
<th style="text-align: right;">std.error</th>
<th style="text-align: right;">statistic</th>
<th style="text-align: right;">p.value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">(Intercept)</td>
<td style="text-align: right;">50.3844160</td>
<td style="text-align: right;">31.6302593</td>
<td style="text-align: right;">1.5929182</td>
<td style="text-align: right;">0.1351923</td>
</tr>
<tr class="even">
<td style="text-align: left;">plag</td>
<td style="text-align: right;">0.8025005</td>
<td style="text-align: right;">0.5188559</td>
<td style="text-align: right;">1.5466731</td>
<td style="text-align: right;">0.1459326</td>
</tr>
<tr class="odd">
<td style="text-align: left;">klag</td>
<td style="text-align: right;">-0.2161036</td>
<td style="text-align: right;">0.1191134</td>
<td style="text-align: right;">-1.8142680</td>
<td style="text-align: right;">0.0927727</td>
</tr>
<tr class="even">
<td style="text-align: left;">w2</td>
<td style="text-align: right;">-0.0796106</td>
<td style="text-align: right;">2.5338235</td>
<td style="text-align: right;">-0.0314192</td>
<td style="text-align: right;">0.9754125</td>
</tr>
<tr class="odd">
<td style="text-align: left;">g</td>
<td style="text-align: right;">0.4390160</td>
<td style="text-align: right;">0.3911428</td>
<td style="text-align: right;">1.1223931</td>
<td style="text-align: right;">0.2819981</td>
</tr>
<tr class="even">
<td style="text-align: left;">tx</td>
<td style="text-align: right;">-0.9230972</td>
<td style="text-align: right;">0.4337595</td>
<td style="text-align: right;">-2.1281312</td>
<td style="text-align: right;">0.0530297</td>
</tr>
<tr class="odd">
<td style="text-align: left;">time</td>
<td style="text-align: right;">0.3194057</td>
<td style="text-align: right;">0.7781287</td>
<td style="text-align: right;">0.4104792</td>
<td style="text-align: right;">0.6881394</td>
</tr>
<tr class="even">
<td style="text-align: left;">elag</td>
<td style="text-align: right;">0.0220004</td>
<td style="text-align: right;">0.2821642</td>
<td style="text-align: right;">0.0779701</td>
<td style="text-align: right;">0.9390391</td>
</tr>
</tbody>
</table>

    resid_full_model <- resid(reg_29_c)
    sse_29_c <- sum(resid_full_model^2) #61.9501
    df_full <- df.residual(reg_29_c) #13

    reg_29_c_reduced <- lm(p~w2+plag, data = data_29)
    sum_reg_29_c_reduced <- tidy(reg_29_c_reduced )
    kable(sum_reg_29_c_reduced)

<table>
<thead>
<tr class="header">
<th style="text-align: left;">term</th>
<th style="text-align: right;">estimate</th>
<th style="text-align: right;">std.error</th>
<th style="text-align: right;">statistic</th>
<th style="text-align: right;">p.value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">(Intercept)</td>
<td style="text-align: right;">2.4002697</td>
<td style="text-align: right;">3.2272637</td>
<td style="text-align: right;">0.7437476</td>
<td style="text-align: right;">0.4666275</td>
</tr>
<tr class="even">
<td style="text-align: left;">w2</td>
<td style="text-align: right;">0.2217614</td>
<td style="text-align: right;">0.3220073</td>
<td style="text-align: right;">0.6886844</td>
<td style="text-align: right;">0.4998030</td>
</tr>
<tr class="odd">
<td style="text-align: left;">plag</td>
<td style="text-align: right;">0.8155132</td>
<td style="text-align: right;">0.1564164</td>
<td style="text-align: right;">5.2137322</td>
<td style="text-align: right;">0.0000586</td>
</tr>
</tbody>
</table>

    resid_reduced_model <- resid(reg_29_c_reduced)
    sse_29_c_reduced <- sum(resid_reduced_model^2) #141.7514

    f_statistic <- ((sse_29_c_reduced-sse_29_c)/5)/(sse_29_c/13)
    f_statistic #3.3492 approx 3.35

    ## [1] 3.3492

    Critical_value_F <- qf(0.95, 5, 13)
    v_2 <- resid(reg_29_c) #save residuals
