1:10
mean(1:10)
a = 5
a <- 5
5 -> a

# Vector is a 1 dimensional object & it should have same element


x <- 1:10
class(x) # Integer

x1 <- c(6,4,6,7,8,9)
class(x1) # Numeric

x3 <- c("Guru", "Madhu", "Deepankar")
class(x3) # Character

x1[4] # to access a element of Vector
x1[1:4]
x1[c(2,4,6)] # to access 2nd, 4th and 6th element
length(x1) # to find out the length of vector

#Logical Vector

x4 <- c(TRUE, FALSE, TRUE, FALSE)
class(x4)
x4 <- c(TRUE, FALSE, TRUE, FALSE, T, F)

#Complex Vector

x5 <- c(2+3i, 3+1i, 1+2i)
class(x5)

x6 <- c(1,2, "Guru", "Madhu")
class(x6)
class(x6[1])

x1 <- c(1,2, TRUE, FALSE)
class(x1)

# Vectorised Operation

1:5
6:10

1:5 + 6:10

c(1,2,3,4,5) + c(6,7,8,9,10)
c(2,4,6,8) + c(1,2,3,4)

C(1,2,3,4,5) + c(6,7,8,9)
1:10 + 6:10
C(1,2,3,4,5,6,7,8,9,10) + c(6,7,8,9,10)
6:10
1:5

1:10+6:10
1:6+6:9
c(1,2,3,4)+c(6,7,8,9,10)

1:10
6:10

1:10 + 6:10
c(1,2,3,4,5,6,7,8,9,10) + c(6,7,8,9,10)

c(1,2)+c(2+3i, 3+1i)
1:5 - 6:10

# Comparison of Vectors

c(3,4-1,2+1,5-1,10-7) == 3
c(3,4-1,2+1,5-1,10-7) != 3
c(3,4-1,2+1,5-1,10-7) > 3
c(3,4-1,2+1,5-1,10-7) >= 3
c(3,4-1,2+1,5-1,10-7) < 3
c(3,4-1,2+1,5-1,10-7) <= 3

a1 <- 1:10
a1+3

b1 <- 11:20
b1 + 4

(a1*3) + (b1*4)

(a1*3) - (b1*4)

# Sequence of numbers

1:10

seq(from=1, to=10, by=3)

seq(1,10,2)

# repeatation of numbers

rep(1:4, 4)

rep(1:4, each=4)

rep1 <- rep(1:4, 4)
class(rep1)

# Matrix

m1 <- 1:8
m1
class(m1)
dim(m1) <-c(2,4)
m1


m2 <- matrix(1:8,2,4)
m2

m2 <- matrix(1:8,4,2, byrow=TRUE) # Forming Matrix by row
m3 <- matrix(1:8,4,2)
m3

m4 <- matrix(1:7, 2,4)
m4 <- 1:7
m4

m3 <- matrix(1:4, 2,4)
m3

m3 <- matrix(1:12, 2,6)

m3[ 1, 2 ] # accessing an element from a Matrix

# Array

my_array <- array(1:100, dim=c(2,4,3))

my_array[ , ,3] # All elements of 3rd matrix 
my_array[ ,3, ] # 3rd column of all matrix

class(my_array)
my_array[2, ,2]
class(my_array[2, ,2])

# Data Frames

mtcars

salary_url <- "http://www.justinmrao.com/salary_data.csv"
salary_data <- read.csv(salary_url)
View(salary_data)
class(salary_data)

#List


List_of_Vecs <- list (x1,x3,x4,x5)

List_of_Vecs
class(List_of_Vecs)

List_of_Vecs [4]  # Accessing an element of a List
 

List_of_Vecs_Mat <- list (x1,x3,x4,x5,m3) # List of Vectors and Matrix
List_of_Vecs_Mat


List_of_Mat_DF <- list(m3, salary_data) # List of Matrix & DF

List_of_Mat_DF

length(List_of_Mat_DF)
List_of_Mat_DF[3] # Accessing an element of a List

New_DF <- as.data.frame(List_of_Mat_DF[2]) # Creating a new data frame
List_of_Mat_DF[2]
List_of_list <- list(List_of_Vecs,m3) # Viewing a list of list
List_of_list

List_of_Vecs_Mat[5]

List_of_Vecs_Mat[[5]][4,2]

# Factor - Data structure that belongs to character

Gender_cols <- c("male", "female", "female", "female", "male", "unknown")
class(Gender_cols)
Gender_cols
Gender_cols_fac <- as.factor(Gender_cols) # Converting to factor
Gender_cols_fac
as.integer(Gender_cols_fac)

# Assignment

survey_data <- c("very happy", "very happy", "unhappy", "happy", "happy")

survey_data

survey_data_fac <- as.factor(survey_data)

survey_data_fac 
as.integer(survey_data_fac)

# Very happy = 1
# Happy = 2
# Unhappy = 3

# Need to use order command

# Data Frames

salary_url <- "http://www.justinmrao.com/salary_data.csv"
salary_data <- read.csv(salary_url)
class(salary_data)
salary_data

dim(salary_data) # to find dimension of a table

str(salary_data) # structure of salary data

# rows = Observations, columns = variables, Features (ML)

salary_data_1 <- read.csv(salary_url, stringsAsFactors = FALSE) # To recognise string as a char not factor
salary_data_1
salary_data
str(salary_data_1)
str(salary_data)


salary_data$team # To access a column from DF
class(salary_data_1$team)

salary_data_1$team <- as.factor(salary_data_1$team) # converting char to factor
class(salary_data_1$team)

head(salary_data) # By default first 6 observations
head(salary_data, 10) # First 10 observations

tail(salary_data) # Bottom 6 observations

ncol(salary_data) # Number of columns
nrow(salary_data) # number of rows

length(salary_data)

#  Subsetting of Data

salary_data_2 <- salary_data[25:45, ] # To access 25 to 45 rows of all the columns
salary_data_2

# Record number 23, 45, 100,200,3000

salary_data_3 <- salary_data[c(23,45,100,200,3000), ]
salary_data_3

salary_data_4 <- salary_data[ , c(5,7,10,12)] # Accessing columns
salary_data_4

salary_data_5 <- salary_data[ , -12] # To eliminate a perticular column
salary_data_5


# Intelligent Subsetting

unique(salary_data$team) # To identify unique subsets

salary_data_6 <- subset(salary_data, salary_data$team == "Detroit Pistons") # To select the records of a perticular Column
salary_data_7 <- subset(salary_data, salary_data$team == "Detroit Pistons" & salary_data$salary_year>600000)
salary_data_7 <- subset(salary_data, salary_data$team == "Detroit Pistons" & salary_data$salary_year>600000 & salary_data$contract_years_remaining <=2)

salary_data_7 <- subset(salary_data, salary_data$team == "Detroit Pistons" & salary_data$salary_year>600000 & salary_data$contract_years_remaining >7)
salary_data_7

# Paste

n1 <- paste("Guru", "Madhu", sep = "**")
n1

salary_data$newcols <- paste(salary_data$team, salary_data$year, sep = "_") # To join two columns together seperated by a value

View(salary_data$newcols)

salary_data$newcols <- NULL # To drop the new column created


#Assignment 3

Keep the new col in the third order instead of last

# join rows of two data frames

salary_data_9 <- rbind(salary_data_2, salary_data_3) # Column names & number of cols present in both DF should be same
salary_data_10 <- cbind(salary_data_4, salary_data_5) # Number of rows should be equal

View(salary_data_10)


# Assignment

# I want to combine 2 data frames which has unequal rows and columns
# smartbind

# Functions in R

sessionInfo() # To see the R version details

# Sorting

sort_vec <- c(1,5,2,6,8,10,12,20)
sort_vec1 <- sort(sort_vec)

sort_vec1

sort_vec2 <- sort(sort_vec, decreasing = TRUE) # Decsending order
sort_vec2



# Order

sort_vec3 <- order(sort_vec)
sort_vec
sort_vec3

sort_vec4 <- order(-sort_vec3)

sort_vec4 


salary_data_11 <- salary_data

salary_data_11$salary_year <- sort(salary_data$salary_year)
salary_data_11

salary_data_11 <- salary_data[1:10, ]
salary_data_11

View(salary_data_11)

salary_data_11$salary_year <- sort(salary_data_11$salary_year)

order(salary_data$salary_year)


salary_data_new <- salary_data[order(salary_data$salary_year), ]

View(salary_data_new)

salary_data_new <- salary_data[order(-salary_data$salary_year), ] # Descending order

salary_data_new1 <- salary_data[order(salary_data$contract_years_remaining, salary_data$salary_year), ]
View(salary_data_new1) # Sorting two columns

salary_data_new1 <- salary_data[order(salary_data$contract_years_remaining, -salary_data$salary_year), ]

# Functions

char_vec <- c("Guru", "Deepankar", "Madhu")

toupper(char_vec) # Uppercase
tolower(char_vec)  # Lowercase
 
# Assignment

#Add 2 coluns for Team where one column having all the name in uppercase and vice versa

# Substring Functions

my_string <- "gurudeepankarmadhupavan"
length(my_string)

my_string_sub <- substring(my_string, 5,15)

my_string_sub

nchar(my_string)

salary_data$year1 <- substring(salary_data$year, 1,4)

View(salary_data$year1)


# Assignment 

# Get last 4 char of the column " Team"
# Hint : nchar

my_string_sub_1 <- substring(my_string, (nchar(my_string)-7), nchar(my_string))
my_string_sub_1


# Substitute functions


x1 <- c("R tutorial", "data science tutorial", "c tutorial")
x1

x2 <- sub("tutorial","training", x1)
x2


x3 <- c("R tutorial c tutorial ds TUTORIAL", "data science tutorial r tutorial", "c tutorial r tutorial")
x3


x4 <- sub("tutorial","training", x3)
x4

x5 <- gsub("tutorial","training", x3) # Group Substitution
x5

x5 <- gsub("tutorial","training", x3, ignore.case = TRUE) # To ignore case

# Pattern Matching

country_name <- c("America", "United States of America", "Americas", "china", "Japan")

pattern <- "America"

grep(pattern, country_name)
country_name [grep(pattern, country_name)] <- "My America"
country_name 

grepl(pattern, country_name) # To see logical outpout for pattern matching

# String Split

my_string <- "I love working on R ; and packages it offers"

strsplit(my_string, ";") # Splitting words based on semi colon, coma

# Loading Data into R

data()
data(package = .packages(TRUE))
help("mtcars")

# Loading Barley package which is a part of another package "Lattice"

data("barley", package = "lattice")
head(barley)
ncol(barley)

# Loading a text file

# 2nd Option
d = read.table("C:\\Users\\User\\Desktop\\R_EB\\auto1.txt", sep = "\t", header = TRUE)
View(d)

# Option 1
file_path <- "C:\\Users\\User\\Desktop\\R_EB\\auto1.txt"
d = read.table(file_path, sep="\t")

# Create a batch file through which you can write a file into R

library(learningr)

deer_file <- "C:/Users/User/Documents/R/win-library/3.3/learningr/extdata/RedDeerEndocranialVolume.dlm"
deer_data <- read.table(deer_file, header = TRUE, fill = TRUE)
deer_data
ncol(deer_data)
str(deer_data)

# reading a CSV file

crab_data <- read.csv("C:/Users/User/Documents/R/win-library/3.3/learningr/extdata/crabtag.csv", header = FALSE, skip = 4, nrows = 8)
crab_data

write.csv(salary_data_new1,"C:\\Users\\User\\Desktop\\R_EB\\sal1.csv")
# XLSX File
library(openxlsx)
My_xl <- read.xlsx("C:\\Users\\User\\Desktop\\R_EB\\sample.xlsx")
# Text file
the_tempest <- readLines("C:/Users/User/Documents/R/win-library/3.3/learningr/extdata/Shakespeare.s.The.Tempest..from.Project.Gutenberg.pg2235")
the_tempest[1:100]
# XML File
library(XML)
r_options <- xmlParse("C:/Users/User/Documents/R/win-library/3.3/learningr/extdata/options.xml")
View(r_options)
View(mtcars1)

mean(mtcars$mpg)

fivenum(mtcars$mpg)

summary(mtcars$mpg)
summary(mtcars)

boxplot(mtcars$mpg)

IQR(mtcars$mpg) # Inter Quadrile Range

mtcars1 <- edit(mtcars)

fivenum(mtcars1$mpg)

IQR(mtcars1$mpg)

boxplot(mtcars1$mpg)
b2 <- boxplot(mtcars1$mpg)
b2$out

# Bi variate analysis on MPG and Cyl column
boxplot(mtcars$mpg~mtcars$cyl)
fivenum(mtcars$mpg,mtcars$cyl)
b1 <- boxplot(mtcars$mpg~mtcars$cyl)
b1$out



data("airquality")
head(airquality)
tail(airquality)
is.na(airquality$Ozone) #To find missing value 

which(is.na(airquality$Ozone)) # Position of missing values

length(which(is.na(airquality$Ozone))) # Number of missing values

length(which(is.na(airquality$Ozone)))/nrow(airquality) # Percentage of missing values

round(length(which(is.na(airquality$Ozone)))/nrow(airquality),2) # To round it by 2 digits

mean(airquality$Ozone)

mean(airquality$Ozone,na.rm = TRUE) # To count mean value ignoring the missing values

airquality$Ozone[which(is.na(airquality$Ozone))] <- mean(airquality$Ozone, na.rm = TRUE)
View(airquality) # Replacing the missing values with mean value

colSums(is.na(airquality)) # To find out missing values in all the column
colSums(is.na(airquality))/nrow(airquality) # Percentage
boxplot(mtcars$mpg~mtcars$cyl, main = "BoxPlot b/w mpg and Cyl", xlab = "Cyl", ylab = "mpg")
boxplot(mtcars$mpg~mtcars$cyl, main = "BoxPlot b/w mpg and Cyl", xlab = "Cyl", ylab = "mpg", col="red")
boxplot(mtcars$mpg~mtcars$cyl, main = "BoxPlot b/w mpg and Cyl", xlab = "Cyl", ylab = "mpg", 
        col=c("blue", "yellow", "rosybrown1"))

par(bg="skyblue") # To apply background color
colors()

png(file ="boxplot1.png")
boxplot(mtcars$mpg~mtcars$cyl, main = "BoxPlot b/w mpg and Cyl", xlab = "Cyl", ylab = "mpg", 
        col=c("turquoise4", "tomato2", "pink3"))
getwd()

dev.off()

png(file = paste("boxplot1", Sys.Date(),".png"))
png(file = paste("boxplot1", Sys.time(),".png")) # Assignment 

library(lattice)
bwplot(mtcars$mpg~mtcars$cyl, main = "BoxPlot b/w mpg and Cyl", xlab = "Cyl", ylab = "mpg", 
       col=c("blue", "yellow", "rosybrown1")) # Box Whisker Plot
bwplot(iris$Petal.Length ~ iris$Species)


?iris
head(iris)

library(ggplot2) 
qplot(iris$Species, iris$Petal.Length, geom = "boxplot") 

hist(mtcars$mpg) # Histogram
hist(mtcars$mpg, labels = TRUE)
hist(mtcars$mpg, breaks = 10, labels = TRUE)

plot(mtcars$mpg) # Scatter Plot is preferred for bi variate analysis
plot(mtcars$mpg, mtcars$disp)

plot(mtcars$mpg, mtcars$disp, type = "l") # Line chart, not preferred for Bi variate
plot(mtcars$mpg, type = "l")

plot(mtcars$mpg, type = "h")

plot(mtcars$mpg, type = "b")

plot(mtcars$mpg, type = "o")

par(mfrow = c(3,3))

plot(mtcars$mpg, type = "b")

plot(mtcars$mpg, type = "h")
plot(mtcars$mpg, type = "h")
plot(mtcars$mpg, type = "o")
plot(mtcars$mpg, type = "l")
plot(mtcars$mpg, type = "h")

plot(mtcars$mpg, type = "b")

plot(mtcars$mpg, type = "o")
plot(mtcars$mpg, type = "o")


plot(mtcars$mpg)

plot(mtcars$mpg, pch = 2)
plot(mtcars$mpg, pch = 3)
plot(mtcars$mpg, pch = 6)
plot(mtcars$mpg, pch = 18, col = "red")
plot(mtcars$mpg, pch = 14, col = "blue")

plot(mtcars$mpg, pch = c(as.factor(mtcars$mpg)))

Customers_Data <- read.csv("C:/Users/User/Desktop/R Videos/Wholesale customers Data.csv")
View(Customers_Data) 

colSums(is.na(Customers_Data))
str(Customers_Data)
summary(Customers_Data)
Customers_Data_num <- Customers_Data[ ,c(-1,-2)]
View(Customers_Data_num)

# Standardised values of all the columns / Scaling

Customers_Data_num_scale <- as.data.frame(scale(Customers_Data_num))
View(Customers_Data_num_scale)

(12669-mean(Customers_Data_num$Fresh)) /sd(Customers_Data_num$Fresh)

sample(1:100, 10)
set.seed(1001)

clustercustomers <- kmeans(Customers_Data_num_scale, 6)
clustercustomers
str(clustercustomers)
summary(clustercustomers)
clustercustomers$withinss
clustercustomers$betweenss

Customers_Data_final <- cbind(Customers_Data, cluster_Number = clustercustomers$cluster)
View(Customers_Data_final)

# profiling of customers
mean(Customers_Data_final$Fresh)

tapply(Customers_Data_final$Fresh, Customers_Data_final$cluster_Number, mean)



# Linear Regression

library(MASS)
?MASS
data("Boston")
head(Boston)
View(Boston)
?Boston
plot(Boston$crim,Boston$medv)
plot(Boston$medv,Boston$crim)
cor(Boston$crim,Boston$medv)

cor(Boston)

# Splitting up of Data sets into training and tested data set

install.packages("caTools")
library(caTools)

set.seed(1000)

sample(1:10, 5)
sample(1:10, 5)

split <- sample.split(Boston$medv, SplitRatio = 0.65)
split

# Split the dataset using Subset command

train <- subset(Boston, split == TRUE)
test <- subset(Boston, split == FALSE)
               
               
# Linear Regression

names(train)
View(train)

reg1 <- lm(medv ~ lstat + rm, data = train) # Linear Model
reg1

#MEDV = -7.0421 + (-0.6474)*lstat + (5.9716)*rm

summary(reg1)

#Hypothesis testing Explaination

# Confidence level - 95.58%
# P Value - 0.5%

# 1> Null Hypothesis :- IDV's doesn't influence dependent variable's value.
# 2> Alternate Hypothesis :- IDV's does influence DVar - Price
# 3> Define Confidence Level :- I want to test mu confidence level to 95%, then P value would be 0.5%                                               
#Accuracy level of a prediction can be called as precision
# 4> Run experiement & get P value
# 5> Compare P value with Step 3 - If P value is lower than 0.5% Null Hypothesis should 
# be rejected
# 6> If P value is lower than confidence level, reject NUll Hypothesis


#another IV reg2

reg2 <- lm(medv ~ lstat + rm + age, data = train)
reg2
summary(reg2)

reg3 <-lm (medv ~., data = train) 
summary(reg3)


reg4 <- lm(medv ~.-indus-age-black-crim-chas, data = train)
summary(reg4)

names(reg4)
reg4$fitted.values
reg4
length(reg4$fitted.values)
reg4$residuals
30.7509026 - 24.0

#Prediction on the unforseen dataset i.e, test dataset
predicttest <- predict(reg4, newdata = test)
predicttest[1:5]

#plot Actual vs predicted values
plot(test$medv, col = "green", type = "l", lty = 1.8)
line(predicttest, col = "blue")
lines(predicttest, col = "blue", type = "l", lty=1.5)

