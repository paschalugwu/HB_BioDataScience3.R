#HackBio Bio-Data Science Task 3

## Data set for this first analysis is 'mtcars'
# K-means clustering

# Our data is mtcars, an inbuilt data in R
data()
data(mtcars)
View(mtcars)

# For the purpose of visualization, I will like to use any two columns that correlate
cor(mtcars)
plot (mtcars$cyl, mtcars$disp)
plot (mtcars$mpg, mtcars$disp)

# So we can have same results
set.seed(102)

# Perform KMEAN Clustering
mtcarsK3 <- kmeans (x = mtcars, centers = 5)

# Well, I can also add this cluster information to my dataset
mtcars$clusters <- c(mtcarsK3$cluster)

# To visualize this cluster information of each car
ggplot(mtcars, aes(x = mpg, y = disp, color = factor(clusters))) + geom_point() + theme_bw()

# Install useful
install.packages('useful')
library ('useful')

# Create a new column for country
mtcars.country <- c(rep("Japan", 3), rep("US", 4), rep("Europe", 7), rep("US", 3), "Europe", rep("Japan", 3), rep("US", 4), rep("Europe", 4), rep("US", 3))
mtcars$country <- c(mtcars.country)
# Let's plot
plot(mtcarsK3, data = mtcars)
plot(mtcarsK3, data = mtcars, class = 'country')

# Choosing the right number of clusters
mtcarsBEST <- FitKMeans(mtcars, max.clusters=10) 
PlotHartigan(mtcarsBEST)

# Hierachical Clustering is used to cluster clusters into clusters
# Let's see how to implement it
hcmtcars <- hclust(d=dist(mtcars), method='complete')
plot(hcmtcars)


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