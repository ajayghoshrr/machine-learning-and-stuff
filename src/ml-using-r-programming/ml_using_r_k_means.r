#-----------DAY 3 -----ML USING R -----------------
# ------ KMeans, Logistic , Random forest, decision tree

#downloaded from http://archive.ics.uci.edu/ml/machine-learning-databases/00292/
customer_data <- read.csv("C:\\Users\\Administrator\\Desktop\\customer_data.csv")

View(customer_data)

str(customer_data)

summary(customer_data)

#removing first row and second row which is channel, or we can say classes
customer_data_num <- customer_data[, c(-1,-2)]
customer_data_num

names(customer_data)
names(customer_data_num)

#checking for the NA is available or not
colSums(is.na(customer_data))

#scale the customer_data_num and assigned to customer_data_num_scale as dataframe
customer_data_num_scale <- as.data.frame(scale(customer_data_num))

#scale means convertng all into a common diamentonie value - (Mean)/SD
View(customer_data_num_scale)

#standard deviation
sd(customer_data$Channel)

#mean of customer data, channel column
mean(customer_data$Channel)


sample(1:100, 4)
set.seed(8000)

#no of clusters --2
# K mEANS clustoring
cluster_customers <- kmeans(customer_data_num_scale, 6)

cluster_customers$totss
cluster_customers$centers
cluster_customers$cluster
#it will help the clustor quantity....
cluster_customers$withinss
str(cluster_customers)

summary(cluster_customers)


customer_data_final <- cbind(customer_data, cluster_number = cluster_customers$cluster)

mean(customer_data_final$Fresh)

factor(customer_data_final$Channel)
factor(customer_data_final$Region)

View(customer_data_final)

#mean of the Fresh and Channel
tapply(customer_data_final$Fresh, customer_data_final$Channel, mean)


library(animation)
kmeans.ani(customer_data_num_scale, 3)
#to plot the animation graph
wh <- read.csv("C:\\Users\\Administrator\\Desktop\\customer_data.csv", stringsAsFactors = FALSE)
View(wh)

class(wh)
sapply(wh, class)

region_1 = subset(wh, wh$Region==1)
region_2 = subset(wh, wh$Region==2)
region_3 = subset(wh, wh$Region==3)

View(region_1)

region_1_data <- region_1[-c(1,2)]
names(region_1_data)
region_1_scale <- scale(region_1_data)
region_1_clustor <- kmeans(region_1_scale, 6)
set.seed(8)



#-----------------------------===========================================---------------------------------
#                           ML --------- K MEANS ------------REFERENCE
#--------------------------------------------------------------------------------------------------


#----------------------DAY 3 CODE - 2 ML USING R----------------------

p <- "E:\\New folder\\R Videos\\Cust.csv"
wh <- read.csv(p, stringsAsFactors = FALSE)
View(wh)
class(wh)
sapply(wh, class)

wh_1 <- subset(wh, wh$Region == 1)
wh_2 <- subset(wh, wh$Region == 2)
wh_3 <- subset(wh, wh$Region == 3)

View(wh_1)
dim(wh_1)
summary(wh_1)

## region = 1
View(wh_1_data)



wh_1_data <- wh_1[-c(1,2)]
View(wh_1_data)
wh_1_scale <- scale(wh_1_data)
View(wh_1_scale)
set.seed(8)
wh_1_cluster <- kmeans(wh_1_scale, 6)
wh_1
wh_1_cluster$totss
wh_1_cluster$withinss
wh_1_cluster$size
wh_1_cluster$betweenss
wh_1_cluster$iter
wh_1_cluster$cluster

wh_1$clusternumber <- wh_1_cluster$cluster

(30624-11101.73)/(11557.44)
sd(wh_1$Fresh)

## region = 2
View(wh_1)
wh_2_data <- wh_2[-c(1,2)]
View(wh_2_data)

wh_2_scale <- scale(wh_2_data)
View(wh_2_scale)
set.seed(8)
wh_2_cluster <- kmeans(wh_2_scale, 6)
wh_2_cluster$totss
wh_2_cluster$withinss
wh_2_cluster$size
wh_2_cluster$betweenss
wh_2_cluster$iter

wh_2$Clusternumber <- wh_2_cluster$cluster

##region = 3
wh_3_data <- wh_3[-c(1,2)]
View(wh_3_data)

wh_3_scale <- scale(wh_3_data)
View(wh_3_scale)
set.seed(8)
wh_3_cluster <- kmeans(wh_3_scale, 6)
wh_3_cluster$totss
wh_3_cluster$withinss
wh_3_cluster$size
wh_3_cluster$betweenss

wh_3$clusternumber <- wh_3_cluster$cluster
View(wh_3)

wh_1_cluster$withinss
wh_2_cluster$withinss
wh_3_cluster$withinss

region1 <- wh_1_cluster$withinss
region2 <- wh_2_cluster$withinss
region3 <- wh_3_cluster$withinss

wh_3 <- as.data.frame(wh_3_a[-7,])

var <- names(wh_1)

var
View(wh_3)

var1 <- var[3:8]

wh_3_newdata <- (cbind.data.frame (var1, region1)) ## adding region 1 col
View(wh_3_newdata)
wh_3_newdata_a <- cbind.data.frame(wh_3_newdata, region2) ## adding region 2 col
wh_3_newdata_b <- cbind.data.frame(wh_3_newdata_a, region3) ## adding region 3 col
View(wh_3_newdata_b)
names(wh_3)
sapply(wh_3_newdata_b, class)
View(wh_3_newdata_b)


labl <- c("Fresh", "Milk", "Grocery", "Frozen",
          "Detergents_Paper", "Delicassen")
col1 <- c("ivory2","maroon3","coral1", "turquoise4","orchid",
          "yellowgreen")
lab1_data <- round(wh_3_newdata_b$region1, 2)
lab2_data <- round(wh_3_newdata_b$region2, 2)
lab3_data <- round(wh_3_newdata_b$region3, 2)
library(plotrix)

par(bg = "honeydew2")
pie3D(wh_3_newdata_b$region1, main = "Segmentation of data based on Region 1",col = col1, labels = paste(labl, "-" , lab1_data))

#highest sales recorded is delicassen, followed by Fresh
#. promoting of Grocery and frozen products is advisable for sales in this region.
#. Sales of Milk and detergents paper may also be promoted, to increase the sales.

pie3D(wh_3_newdata_b$region3, main = "Segmentation of data based on Region 3",col = col1,labels = paste(labl, "-" , lab3_data))

Region 3 has recorded good sales for most the products,except Grocery.

## creating plots based on diff products
x1 <- as.numeric(wh_3_newdata_b[1,-c(1)]) # fresh
x2 <- as.numeric(wh_3_newdata_b[2,-c(1)]) # milk
x3 <- as.numeric(wh_3_newdata_b[3,-c(1)]) # grocery
x4 <- as.numeric(wh_3_newdata_b[4,-c(1)]) # frozen
x5 <- as.numeric(wh_3_newdata_b[5,-c(1)]) # Detergents_Paper
x6 <- as.numeric(wh_3_newdata_b[6,-c(1)]) # Delicassen
col2 <- c("yellow","darkolivegreen1" ,"chocolate3")
col3 <- c( "yellow", "coral", "steelblue1" )
lab_new = c ("Region 1", "Region 2", "Region 3")
pie3D(x1, labels = paste(lab_new," - ",round(x1[],2)) , radius = .5,col = col3,main = "Graph:1 - Fresh")

pie3D(x2, labels = paste(lab_new," - ",round(x2[],2)) , radius = .8,col = col3,main = "Graph:2 - Milk")

pie3D(x3, labels = paste(lab_new," - ",round(x3[],2)) , radius = .5,col = col3,main = "Graph:3 - Grocery")

pie3D(x4, labels = paste(lab_new," - ",round(x4[],2)) , radius = .5,col = col3,main = "Graph:3 - Frozen ")

pie3D(x5, labels = paste(lab_new," - ",round(x5[],2)) , radius = .5,col = col3,main = "Graph:5 - Detergents_Paper")

pie3D(x6, labels = paste(lab_new," - ",round(x6[],2)) , radius = .5,col = col3,main = "Graph:6 - Delicassen")

