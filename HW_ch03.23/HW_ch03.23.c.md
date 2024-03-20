This homework is written by 莊巧筠 (312707030)
Q:
c.Using the quadratic regression model in part (a), estimate the expected price E(PRICE|SQFT) =  α_1+ α_2×SQFT^2  for a house of 2000 square feet. Construct a 95% interval estimate of the expected price. Describe your interval estimate to a general audience.
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161672454/48d6bd7d-5418-4f80-86b5-6140139e7f34)
E(PRICE|SQFT) =  α_1+ α_2×SQFT^2![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161672454/36cca576-5948-4e77-842a-82d88f3cd007)
100(1-α)% interval estimate for (c_1 β_1+c_2 β_2) is (c_1 b_1+c_2 b_2)±t_c se(c_1 b_1+c_2 b_2)![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161672454/29597a06-6405-4634-93cc-aa180604ba1a)
<img width="169" alt="image" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161672454/c5f28a46-0339-45b3-a03e-a0cade472889">

The estimated expected price is( E) ̂(PRICE|SQFT=20) = (α_1 ) ̂  + (α_2 ) ̂×20^2  = 167.3735 .
 To construct a 95% interval estimate we need the standard error of this quantity, which is  
 √(var((α_1 ) ̂+400(α_2 ) ̂))=√(var((α_1)) ̂+400^2 var((α_2 ) ̂ )+2(400)cov((α_1 ) ̂,(α_2)) ̂ )
                                     =4.746378
The required critical value for a 95% interval estimate is t_((0.975,498))= 1.964739  .
 The resulting interval estimate is 167.3735  ± (1.964739 )  4.746378 or [158.0481, 176.6988].![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161672454/33311316-070f-4455-85d3-3812811ade17)
