#This homework is written by 張祐慈 (312707005)
#a
library("POE5Rdata")
data("cex5_small")
foodaway = cex5_small$foodaway
hist(x = foodaway,main = "Histogram of foodaway",xlab = 'Food away')

summary(foodaway)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00   12.04   32.55   49.27   67.50 1179.00 

#b
summary(subset(cex5_small,advanced == 1)$foodaway)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00   21.67   48.15   73.15   90.00 1179.00 

summary(subset(cex5_small,college == 1)$foodaway)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00   14.44   36.11   48.60   68.67  416.11

summary(subset(cex5_small,(advanced == 0 & college == 0))$foodaway)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00    9.63   26.02   39.01   52.65  437.78 
