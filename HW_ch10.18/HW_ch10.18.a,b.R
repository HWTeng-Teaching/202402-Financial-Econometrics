# ********************************************************************** 
# Homework  : 07
# Author    : Chinhuicheng
# Date      : 2024/05/07
# Version   : v1
# **********************************************************************

###################################################
#                                                 #
#                   setting env                   #
#                                                 #
###################################################
options(repos = c(CRAN = "https://cloud.r-project.org/"))
options(repos = c(CRAN = "https://cloud.r-project.org/"))
install.packages("devtools")  
library(devtools)
install_git("https://github.com/ccolonescu/POE5Rdata")
library(POE5Rdata)

##########################################
#               10.18 - (a)              #
##########################################
data("mroz")

lfp <- mroz$lfp
mother_educ <- mroz$mothereduc
father_educ <- mroz$fathereduc


mothercoll <- ifelse(mother_educ > 12 & lfp == 1, 1, 0)
fathercoll <- ifelse(father_educ > 12 & lfp == 1, 1, 0)

numbers_mothercoll <- sum(mothercoll)
numbers_fathercoll <- sum(fathercoll)

percentage_mothercoll <- (numbers_mothercoll / 428) * 100
percentage_fathercoll <- (numbers_fathercoll / 428) * 100

print(paste("Percentage of mothers with some college education:", percentage_mothercoll, "%"))
print(paste("Percentage of fathers with some college education:", percentage_fathercoll, "%"))

##########################################
#               10.18 - (b)              #
##########################################
mothercoll <- mothercoll[1 : 428]
fathercoll <- fathercoll[1 : 428]
educ <- mroz$educ
educ <- educ[1 : 428]
correlation_matrix <- cor(cbind(educ,mothercoll, fathercoll))
print(correlation_matrix)

