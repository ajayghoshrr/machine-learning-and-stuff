#---------------------------DAY 2 ----------------------------
#-------MACHINE LEARNING WITH R PROGRAMMING LANGUAGE----------
#----pURELY PRACTICE SECTION-------
#----pREREQUISITE - r PROGRAMMING LANGUAGE, R studio -----------


#sample diabetis prediction
#class distribution ...

install.packages("mlbench")
library(mlbench)

#loading the data set
data("PimaIndiansDiabetes")
View(PimaIndiansDiabetes)

#distribution of class variable...
y<-PimaIndiansDiabetes$diabetes
print(y)

#displaying the 
#     freq percentage
#neg 50000   65.10417
#pos 26800   34.89583

#binding the columns
cbind(freq = table(y), percentage = prop.table(table(y)))*100

#to find the correlation - nothing but find the proportion or relations
correlations <- cor(PimaIndiansDiabetes[,1:8], method = "spearman")
#display the correlation matrix
print(correlations)

#--------
install.packages("Amelia")
install.packages("Rcpp")
library(Amelia)
library(mlbench)

#loading the dataset
data("Soybean")
View(Soybean)
print(Soybean[2][423])
length(Soybean$Class)
par(mfrow = c(1,1))
#create a missing map
#finding the missing item.
missmap(Soybean, col = c("black", "grey"), legend = FALSE)

#this is how to access dataframe in R, here 323 is the row number and 29 is the column number
Soybean[323,19]

#-------------------------------

library(mlbench)
library(lattice)
data("BreastCancer")

View(BreastCancer)
#699 rows
length(BreastCancer$Cl.thickness)

par(mfrow = c(2,4))
for (i in 2:9){
  plot(density(BreastCancer[,i]), main = names(BreastCancer)[i])
}

install.packages("corrplot")
library(corrplot)

data("iris")
correlations <- cor(iris[,1:4])
par(mfrow = c(1,1))
#correlation plot
corrplot(correlations, method = "circle")

#if you have any doubt just '?iris' will give the data

install.packages("Hmisc")
library(mlbench)
library(Hmisc)
data("PimaIndiansDiabetes")
invalid <- 0
PimaIndiansDiabetes$pressure[PimaIndiansDiabetes$pressure==invalid] <- NA
#there are 35 missing values in the column pressure
length(which(is.na(PimaIndiansDiabetes$pressure)))




#-----------------FINALLY ALGORITHM STARTS---------------


library(MASS)
library(ggplot2)
data("Boston")
#help for boston
?Boston
View(Boston)

?ggplot2

Boston[1,]
ggplot(Boston, aes(x = Boston$crim, y = Boston$indus))

install.packages("ggpubr")
library(MASS)
library("ggpubr")
#no correlation ------
#-0.200
cor(Boston$crim, Boston$zn, method = c("pearson", "kendall", "spearman"))
cor.test(Boston$crim, Boston$zn, method = c("pearson", "kendall", "spearman"))
#0.46
cor(Boston$crim, Boston$indus, method = c("pearson", "kendall", "spearman"))
#-0.05
cor.test(Boston$crim, Boston$chas, method = c("pearson", "kendall", "spearman"))

#0.42
cor.test(Boston$crim, Boston$nox, method = c("pearson", "kendall", "spearman"))
#-0.21
cor.test(Boston$crim, Boston$rm, method = c("pearson", "kendall", "spearman"))
#0.35
cor.test(Boston$crim, Boston$age, method = c("pearson", "kendall", "spearman"))
#-0.37
cor.test(Boston$crim, Boston$dis, method = c("pearson", "kendall", "spearman"))
#0.66
cor.test(Boston$zn, Boston$dis, method = c("pearson", "kendall", "spearman"))
cor.test(Boston$crim, Boston$medv, method = c("pearson", "kendall", "spearman"))


dim(Boston)


#linear regression
install.packages("caTools")
library(caTools)
data("Boston")
set.seed(1)
sample(1:10,6)

split <- sample.split(Boston$medv, SplitRatio = 0.65)
split

train <- subset(Boston, split == TRUE)
train

test <- subset(Boston, split == FALSE)
test
#feature name of Dataframe
names(train)
View(train)

reg1 <- lm(medv ~ lstat + rm, data = train)#linear model.

reg1
#while running reg1 
#Call:
#  lm(formula = medv ~ lstat + rm, data = train)

#Coefficients:
#  (Intercept)        lstat           rm  
#-6.1226      -0.6224       5.8506 

#> reg3 <- lm(medv ~., data = train)
> summary(reg3)

#Call:
#  lm(formula = medv ~ ., data = train)

#Residuals:
#  Min       1Q   Median       3Q      Max 
#-10.7175  -2.4864  -0.4968   2.0769  26.9251 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  36.490762   5.720199   6.379 5.83e-10 ***
#  crim         -0.076958   0.038865  -1.980 0.048497 *  
#  zn            0.036787   0.014769   2.491 0.013221 *  
#  indus         0.028594   0.068931   0.415 0.678537    
#chas          0.196514   0.995625   0.197 0.843651    
#nox         -17.957422   4.421427  -4.061 6.06e-05 ***
#  rm            4.261458   0.445517   9.565  < 2e-16 ***
 # age           0.002831   0.014476   0.196 0.845046    
#dis          -1.409712   0.217729  -6.475 3.34e-10 ***
#  rad           0.268840   0.074922   3.588 0.000382 ***
  #tax          -0.011986   0.004231  -2.833 0.004893 ** 
 # ptratio      -1.054462   0.146834  -7.181 4.40e-12 ***
#  black         0.007295   0.002995   2.436 0.015377 *  
  #lstat        -0.527070   0.055129  -9.561  < 2e-16 ***
  #---
 # Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 4.389 on 339 degrees of freedom
#Multiple R-squared:  0.7956,	Adjusted R-squared:  0.7877 
#F-statistic: 101.5 on 13 and 339 DF,  p-value: < 2.2e-16



#the above output containt significants (***) means dependent varible
#
reg3 <- lm(medv ~., data = train)
summary(reg3)

summary(reg1)

names(reg3)
#names(reg3)
#[1] "coefficients"  "residuals"     "effects"       "rank"          "fitted.values"
#[6] "assign"        "qr"            "df.residual"   "xlevels"       "call"         
#[11] "terms"         "model" 

#check the explnation in net - Residuals means distance b/w fitted value(value in line) and point

reg4 <- lm(medv ~. -indus-age-black-crim-chas-zn, data =train)
summary(reg4)
reg4$fitted.values
reg4$residuals

length(reg4$fitted.values)
reg4$residuals

predicttest <- predict(reg4, newdata = test)
#predicted output
predicttest[1:5]
#plotting the actual data vs predicted data
plot(test$medv, col = "green", type = 'l', lty = 1.8)
lines(predicttest, col = "blue", type = "l", lty = 1.5)

