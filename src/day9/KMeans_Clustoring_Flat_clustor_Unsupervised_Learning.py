#-------------------UNSUPERVISED LEARNING -----------------------

import matplotlib.pyplot as plt
from matplotlib import style
import numpy as np
# Importing KMeans algorithms from sklearn
# Clustoring is a type of Unsupervised learning. Unsupervised learning will not have much training data, all training data will be unlabeled.
# Clustering is just make centroids and If we give some data, algorithm will find smallest distance from centroids.
# KMeans is useful for any diamenstion of data.
from sklearn.cluster import KMeans
style.use('ggplot')

#ORIGINAL:
#Sample data to check the KMeans algorithm
X = np.array([[1, 2],
              [1.5, 1.8],
              [5, 8],
              [8, 8],
              [1, 0.6],
              [9, 11]])


#plt.scatter(X[:, 0],X[:, 1], s=150, linewidths = 5, zorder = 10)
#plt.show()

#Appying KMeans algorithm with n_clusters of 2 (No of centroids)
clf = KMeans(n_clusters=2)
#Setting the value. Removing unwanted values , Adding the float values.
clf.fit(X)
# Adding the centroid point X,Y in a graph.
centroids = clf.cluster_centers_
# labels of point for each centroid
labels = clf.labels_
#print(centroids)
#print(centroids[:,1])
#print(centroids[:,0])
#print(labels)
colors = ["g.","r.","c.","y."]
for i in range(len(X)):
    plt.plot(X[i][0], X[i][1], colors[labels[i]], markersize = 10)
plt.scatter(centroids[:, 0],centroids[:, 1], marker = "x", s=150, linewidths = 5, zorder = 10)
#KMeans Algorithm CROSS SYMPOL IS FOR Clusters
plt.show()