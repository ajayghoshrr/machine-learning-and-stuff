#----------RANDOM FOREST

#crime data downloaded from https://data.cityofchicago.org/Public-Safety/Crimes-2017/d62x-nvdr
#Kaggle also reffered
csv_df <- read.csv("C:\\Users\\Administrator\\Desktop\\crime_data.csv")
print(csv_df)
names(csv_df)
View(csv_df)

install.packages("randomForest")
library(randomForest)

install.packages("leaflet")

library(leaflet)

install.packages("tree")
library(tree)

train_data = read.csv("C:\\Users\\Administrator\\Desktop\\Crime_Sample.csv")
test_data = read.csv("C:\\Users\\Administrator\\Desktop\\Test_Crime.csv")

View(train_data)
View(test_data)


names(train_data)

colSums(is.na(train_data))
#removed the respected column which is not useful for random forest/decison tree
train_data1 <- train_data[,-c(1,2,14,15,17,18)]
names(train_data1)
names(train_data)

train_data2 <-
#applying the randomForest
myforest <- randomForest(Primary.Type ~ Latitude + Longitude, data=train_data2, ntree = 500)


#---------------------

#install.packages("randomForest")
library(randomForest)
#install.packages("leaflet")
library(leaflet)
library(tree)
#install.packages("tree")

# Training dataset
traindata = read.csv("C:\\Users\\Administrator\\Desktop\\Crime_Sample.csv")
#test_data = read.csv("C:\\Users\\Administrator\\Desktop\\Test_Crime.csv")
#traindata <- read.csv("E:/New folder/R_EB/Crime_Finished/Datas/Crime_Sample.csv")
View(traindata)
colSums(is.na(traindata))
traindata1 <- traindata[,-c(1,2,14,15,17,18)]
?complete.cases
#checking for the trainData1 having missing values or not
traindata2 <- traindata1[complete.cases(traindata1),]
traindata2
colSums(is.na(traindata2))
mytree <- tree(Primary.Type ~ Latitude + Longitude, data=traindata2)
mytree
#plotting the decision tree
plot(mytree)

summary(traindata2)
str(traindata2)
View(traindata2)

myforest <- randomForest(Primary.Type ~ Latitude + Longitude, data=traindata2, ntree=500)
#plotting the randomforest predictions
plot(myforest)

# Testing Dataset

testdata <- read.csv("C:\\Users\\Administrator\\Desktop\\Test_Crime.csv")
colSums(is.na(testdata))
testdata1 <- testdata[,-c(1,2,14,15,17,18)]
colSums(is.na(testdata1))
testdata2 <- testdata1[complete.cases(testdata),]
View(testdata)
names(testdata2)
colSums(is.na(testdata2))

#prediction from the train data
Prediction <- predict(myforest, newdata = testdata2, type = "class")
Prediction
#adding predicted stuff to the table/data frame , ie crime type
testdata2$Primary.Type.pre <- predict(myforest, newdata = testdata2 , type="class")
View(testdata2)
dim(testdata2)

#

#table will display the no of counts in respected column, for example - no of females, males in a sex column
table(testdata2$Primary.Type)       
table(testdata2$Predicted_Results)   

table(testdata2$Predicted_Results,testdata2$Predicted_Results)

(sum(traindata$Predicted_Results==traindata$Primary.Type)/nrow(traindata))*100

# Visualisation

gviz <- leaflet(data = testdata2 ) 
gviz <- addTiles(gviz)
gviz <- addMarkers(gviz, ~Longitude, ~Latitude, popup = ~as.character(Primary.Type.pre))
#printing prediction in a MAP
gviz

# m <- leaflet() %>%
# addTiles() %>%  # Add default OpenStreetMap map tiles
# addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
