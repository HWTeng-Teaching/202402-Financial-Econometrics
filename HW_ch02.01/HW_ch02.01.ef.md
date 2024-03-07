This homework is written by 游政諺 ( 311707012 ).
# ch02.01 (e)
On graph paper, plot the data points and sketch the fitted regression line
$\hat{y} = b1+b2*x$

根據(d)小題可知估計值 $\hat{y}$

觀測值: ( -1, 1 ), ( 0, 0 ), ( 1, 3 ), ( 2, 2 ), ( 3, 4 )

估計值: ( -1, 0.4 ), ( 0, 1.2 ), ( 1, 2 ), ( 2, 2.8 ), ( 3, 3.6 )
```
x = c( -1,0,1,2,3 )
y = c( 1,0,3,2,4 )
estimate_y = c( 0.4,1.2,2,2.8,3.6 )
plot( x, y,
     xlab="x", 
     ylab="y",
     )
points( x,estimate_y, 
       pch=16,                
       col="blue" )  
lines( x, estimate_y, col = "blue" )

```
![image](https://github.com/adni7413/hw0201_e/blob/main/b5d6cf20-bd02-4adf-8048-4596b9181ef4.png)

---
# ch02.01 (f)
On the sketch in part (e), locate the point of the means (x,y). Does your fitted line
pass through that point? If not, go back to the drawing board, literally

根據(d)小題可知 $\bar{x} = 1,  \bar{y} = 1$

觀察(e)小題的圖，( $$\bar{x}, $$\bar{y} ) = ( 1, 2 )`
```



```



---

