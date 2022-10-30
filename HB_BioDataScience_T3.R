#HackBio Bio-Data Science Task 3

# Second K-means clustering
# Our second data set is 'microbial_stationary_phase.csv' from last week's task

# Import .csv file in R
microbe <- read.csv(file.choose())
microbe

# For the purpose of visualization, I will like to use any two columns that correlate
cor(microbe)
plot (microbe$A1, microbe$Time)
plot (microbe$A2, microbe$Time)

# So we can have same results
set.seed(102)

# Perform KMEAN Clustering
microbeK3 <- kmeans (x = microbe, centers = 8)

# Well, I can also add this cluster information to my dataset
microbe$clusters <- c(microbeK3$cluster)

# To visualize this cluster information of each car
ggplot(microbe, aes(x = A1, y = A2, color = factor(clusters))) + geom_point() + theme_bw()

# Install useful
install.packages('useful')
library ('useful')

# Let's plot
plot(microbeK3, data = microbe)

# Choosing the right number of clusters
microbeBEST <- FitKMeans(microbe, max.clusters=10) 
PlotHartigan(microbeBEST)

# Hierachical Clustering is used to cluster clusters into clusters
# Let's see how to implement it
hcmicrobe <- hclust(d=dist(microbe), method='complete')
plot(hcmicrobe)
