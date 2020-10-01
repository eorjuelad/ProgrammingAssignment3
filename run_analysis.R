## Script

library(plyr)
library(reshape2)

getwd()

### Train Data
xTrain <- read.table(".\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt")
yTrain <- read.table(".\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt")
sTrain <- read.table(".\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt")
trainTable <- cbind(sTrain, yTrain, xTrain)
#View(xTrain)

### Test Data
xTest <- read.table(".\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt")
yTest <- read.table(".\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt")
sTest <- read.table(".\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt")
TestTable <- cbind(sTest, yTest, xTest)
#View(TestTable)

### Labels
activityLabels <- read.csv(".\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt", sep="", header=FALSE)
names(activityLabels) <- c("code", "activity")
#class(activityLabels$V2)

features <- read.table(".\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\features.txt", header=FALSE)
meanStdFeatures <- grep(pattern = ".*mean.*|.*std.*", features$V2)
#meanStdFeatures <- grep(pattern = ".*mean.*|.*std.*", features$V2, value = TRUE)

meanStdFeaturesOrganized <- features[meanStdFeatures,2]
meanStdFeaturesOrganized = gsub("-mean", "Mean", meanStdFeaturesOrganized)
meanStdFeaturesOrganized = gsub("-std", "Std", meanStdFeaturesOrganized)
meanStdFeaturesOrganized = gsub("\\()-", "", meanStdFeaturesOrganized)
#View(meanStdFeaturesOrganized)

######## Merge Data
MergedData <- rbind(trainTable, TestTable)
colnames(MergedData) <- c("Subject", "Activity", meanStdFeaturesOrganized)
#View(MergedData)

######## Include Factors
MergedData$Activity <- factor(MergedData$Activit, levels = activityLabels$code, labels = activityLabels$activity)
MergedData$Subject <- as.factor(MergedData$Subject)
#View(MergedData)

##install.packages("plyr")



######## Independent tidy data set with the average - Activity VS Subject
meltedData <- melt(MergedData, id = c("Subject", "Activity"))
TidyDataSecond <- dcast(meltedData, Subject + Activity ~ variable, mean)
View(TidyDataSecond)

######## Final Data Set
write.table(TidyDataSecond, file = ".\\tidyDataSet.txt")