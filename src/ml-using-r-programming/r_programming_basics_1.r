#-----------------------------R Programming -----basics
#View(mtcars)

salary_url <- "http://www.justinmrao.com/salary_data.csv"

# reading the CSV files

salary_data <- read.csv(salary_url)

#View(salary_data)
#head of the data
#head(salary_data)
#tail of the data set
tail(salary_data)

# Headers ---- team year player contract_years_remaining contract_thru
# position full_name salary_year salary_total year_counter obs mean_salary mean_remaining

#It will give list of data, just like python df
list(salary_data[2])

#It will give details of data frame.....
str(salary_data)
#Diamension of data.
dim(salary_data)

# $ will give the table features
print(salary_data$team)

#duplicate the data
salary_data_1 <- read.csv(salary_url, stringsAsFactors = FALSE)
#ncol - no of columns
#nrow - no of columns

head(salary_data_1)

# we can take a perticular subset.
salary_data_7 = subset(salary_data_1, salary_data_1$team == 'Boston Celtics')
print(head(salary_data_7))

#adding the new column 
salary_data$newcol <- paste(salary_data$team, salary_data$year, sep = '_')

head(salary_data)

#joining the rows of two dataframes
#rbind(table1, tabl2)
#cbind()#column bind

#sorting the vslues
test_1 = sort(salary_data_1$team)

#printing the index which is in sorted manner
order_test = c(1,3,6,2,5,3)
print(order(order_test))

#lenght of the test_1
print(length(test_1))


#string manipulation - nRefer internet, Just like python


#sub and gsub - Substitution

#Pattern Matching - - - 

country_name <- c("America", "Unites States of America","America", "china")
print(country_name)

#pattern matching....
pattern <- "America"
#grep will fetch the position of pattern, grepl will give logical output 
grep(pattern, country_name)
#replacing grep value with 
country_name[grep(pattern, country_name)] <- "My America"
print(country_name)

my_string <- "I love working with R; and packages it offers"
#spliting with ';'
print(strsplit(my_string, ";"))

#----------------------------DATA LOADING------------------------
#this will display all the default data set.
data()
#taking the barley data set and package lattice...
data("barley", package = "lattice")
head(barley)
ncol(barley)

#library("lattice")
#to list all packages
data(package = .packages(TRUE))

#loading a file from local...
d = read.table("C:\\Users\\Administrator\\Desktop\\r.txt", sep='\t', header = FALSE)
View(d)

install.packages("learningr")

#reading the data. we can read any kind of data . 
library(learningr)
deer_file <- "C:\\Program Files\\R\\R-3.4.3\\library\\learningr\\extdata\\RedDeerEndocranialVolume.dlm"
deer_data = read.csv(deer_file)
print(deer_data)


#R is suitable for the Business intelligence I believe,,,

#imported the mtcars data frame
data(mtcars)
x = mtcars
print(head(mtcars))
mtcars
x

#avarage mailage of the car
mean(mtcars$mpg)
#minimum , medium etc just like summary
fivenum(mtcars$mpg)
#will get the minimum, mean. median, max etc
summary(mtcars)

#mostly used for visual uni varient data. will give mean , max, min etc
boxplot(mtcars$mpg)

#Google univarient and bivarient(two attributes) graph
#to edit the data
mtcars <- edit(mtcars)

#plot the two attributes 
boxplot(mtcars$mpg~mtcars$cyl)

#--------------------------DAY 2 ------------ML using R------

data("airquality")
#while seeing head I found some NA, have to replace missing values
head(airquality)
#tail of the data frame
tail(airquality)

is.na(airquality$Ozone)
#position of missing values
which(is.na(airquality$Ozone))

#no of 'na' in ozone feature
length(which(is.na(airquality$Ozone)))

#have to removce the NA, so find the mean and replace with NA
mean(airquality$Ozone, na.rm = TRUE)

airquality$Ozone[which(is.na(airquality$Ozone))] <- mean(airquality$Ozone, na.rm = TRUE)
View(airquality)
#removed all the NA in ozone features
colSums(is.na(airquality))
#box plot - put in a maultiple plots in a matrix to ease of analyse
par(mfrow = c(1,1))
boxplot(mtcars$mpg~mtcars$cyl, main = "BoxPLOT with mpg and Main", xlab = "Cyl", ylab = "mpg", col = c("red", "blue"))
#back ground color
par(bg="skyblue")
#to display the colors
colors()
# it will save the boxplot

png(file = "boxplot1.png")
#boxplot(mtcars$mpg ~ mtcars$cyl, main = "HEADING", xlab = "cyl", ylab)
# setting to default visualization
dev.off()
data("iris")
head(iris)
#installed  the ggplot2
install.packages("ggplot2")
library(ggplot2)

qplot(iris$Species, iris$Petal.Length, geom = "boxplot")

hist(mtcars$mpg) #histogram
hist(mtcars$mpg, labels = TRUE)
hist(mtcars$mpg, breaks = 10, labels = TRUE)

plot(mtcars$mpg) #scatterred plot is preffered bi variate analysis.
plot(mtcars$mpg, mtcars$disp)

#type means , line graph or cirlce graph.
plot(mtcars$mpg, mtcars$disp, type = "l")

#plot with different types.
plot(mtcars$mpg, type = "h")


plot(mtcars$mpg, type = "b")


plot(mtcars$mpg, type = "o")
#PCH will give different sympols in graph , instaed of 'o' it can be different sympols
plot(mtcars$mpg, pch = 2, type = "o", col = "red")

#to print the different sympols
plot(mtcars$mpg, pch = c(as.factor(mtcars$mpg)))











