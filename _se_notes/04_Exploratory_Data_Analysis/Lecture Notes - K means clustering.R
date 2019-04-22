# K means clustering. What does it mean to be close? Depending on the context, things could appear close, but not really be.

# Distances:
## Euclidean - straight line, or how the crow flies
## Continous - correlation similarity
## Binary - manhattan distance, e.g. the example where you follow the NY blocks of a street vs. being able to walk in perfectly straight line


# You need to cluster into a fixed number of clusters
# Each group will have a centroid, or centre of gravity

# Need a distance matrix, number of clusters, an inital guesss as to cluster centroids

# Create some random data
set.seed(1234)
x <- rnorm(12, mean = rep(1:3, each = 4), sd=0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd=0.2)
plot(x,y, col='blue', pch=19, cex=2)
text(x + 0.05, y+0.05, labels = as.character(1:12))

# The algorithm repates the following steps:
## Step 1: assign points to each cluster
## Step 2: recacluate the centroid location

# kmeans()

dataFrame <- data.frame(x,y)
kmeansObj <- kmeans(dataFrame, centers = 3)
names(kmeansObj)
summary(kmeansObj)

# Plot results
plot(x,y, col=kmeansObj$cluster, pch=19, cex=2)
points(kmeansObj$centers, col=1:3, pch=3, cex=3, lwd=3)

# Heat map the results
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
par(mfrow=c(1,2), mar=c(2,4,0.1,0.1))
# original data
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
# organized by cluster
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")

