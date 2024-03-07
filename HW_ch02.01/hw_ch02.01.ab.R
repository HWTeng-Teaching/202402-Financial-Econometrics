x = c(3,2,1,-1,0)
y = c(4,2,3,1,0)

mean_x=mean(x)

x_minus_mean_x= x - mean(x)
square_x_minus_x_mean= (x - mean(x))^2

mean_y=mean(y)

y_minus_mean_y= y - mean(y)

x_minus_meanx_multiply_y_minus_meany=(x - mean(x))*(y - mean(y))
#a#
sum_x=sum(x)
sum_y=sum(y)
sum_x_minus_mean_x = sum(x_minus_mean_x)

sum_square_x_minus_x_mean = sum(square_x_minus_x_mean)
sum_y_minus_mean_y = sum(y_minus_mean_y)
sum_x_minus_x_mean_multiply_y_minus_meany = sum(sum(x_minus_meanx_multiply_y_minus_meany))
#b#
b2=sum(x_minus_meanx_multiply_y_minus_meany)/sum(square_x_minus_x_mean)
b1=mean(y)-b2*mean(x)
