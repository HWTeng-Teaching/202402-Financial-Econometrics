#This homework is written by 游政諺 (311707012)

#2.1 e

x = c(-1,0,1,2,3)
y = c(1,0,3,2,4)
estimate_y = c(0.4,1.2,2,2.8,3.6)

plot(x, y,
     xlab="x", 
     ylab="y",
     pch = 16, 
     col = 1
     )
points(x,estimate_y, 
       pch=16,                
       col="blue")  
lines(x, estimate_y, col = "blue")


#2.1 f

x = c(-1,0,1,2,3)
y = c(1,0,3,2,4)
estimate_y = c(0.4,1.2,2,2.8,3.6)

plot(x, y,
     xlab="x", 
     ylab="y",
     pch = 16, 
     col = 1
)
points(x,estimate_y, 
       pch=16,                
       col="blue")  
lines(x, estimate_y, col = "blue")


points(1,2, 
       pch=16,                
       col="red")  
