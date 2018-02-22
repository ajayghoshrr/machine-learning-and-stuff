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
