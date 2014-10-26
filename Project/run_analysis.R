#DATA https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#READ VARIABLES
activityLabels <- "UCI HAR Dataset/activity_labels.txt"
featureLabels <- "UCI HAR Dataset/features.txt"

#READ TEST DATA
subjectTest <- "UCI HAR Dataset/test/subject_test.txt"
xTest <- "UCI HAR Dataset/test/X_test.txt"
yTest <- "UCI HAR Dataset/test/y_test.txt"

#READ TRAIN DATA
subjectTrain <- "UCI HAR Dataset/train/subject_train.txt"
xTrain <- "UCI HAR Dataset/train/X_train.txt"
yTrain <- "UCI HAR Dataset/train/y_train.txt"

activity <- read.table(activityLabels, col.names=c("id","activity"))
features <- read.table(featureLabels, col.names=c("id","variable"))

##CHANGE TO APPROPIATE LABELS
activity$activity <- tolower(activity$activity)
features$variable <- gsub("Acc", "acceleration", features$variable)
features$variable <- gsub("^t", "time", features$variable)
features$variable <- gsub("^f", "frequency", features$variable)
features$variable <- gsub("Gyro", "gyroscope", features$variable)
features$variable <- gsub("Mag", "magnitude", features$variable)
features$variable <- gsub("std", "standarddeviation", features$variable)
features$variable <- tolower(features$variable)
features$variable <- gsub("\\.","",features$variable,)
features$variable <- gsub("\\(","",features$variable,)
features$variable <- gsub("\\)","",features$variable,)

subjectTestData <- read.table(subjectTest)
xTestData <- read.table(xTest)
yTestData <- read.table(yTest, col.names=c("activity"))

subjectTrainData <- read.table(subjectTrain)
xTrainData <- read.table(xTrain)
yTrainData <- read.table(yTrain, col.names=c("activity"))


names(subjectTestData) <- c("subject")
names(xTestData) <- features$variable

names(subjectTrainData) <- c("subject")
names(xTrainData) <- features$variable


#Replace y Data with Activity description
yTrainData <- activity[yTrainData$activity,][2]
yTestData <- activity[yTestData$activity,][2]

test <- cbind(subjectTestData, yTestData, xTestData)
train <- cbind(subjectTrainData, yTrainData, xTrainData)


#MERGE TEST AND TRAIN
mergedData <- rbind(test, train)

#EXTRACT MEAN AND STD DEV
cleanData <- mergedData[,names(mergedData) %in% grep(paste(c("subject", "activity", "mean", "standarddeviation"), collapse="|"), names(mergedData), value=T)]


#TIDY DATA
tidyMelt <- melt(cleanData, id=c("subject", "activity"), measures.vars=names(cleanData[3:length(names(cleanData))]))
tidyData <- dcast(tidyMelt, subject + activity ~ variable, mean)
write.table(tidyData, file = "./tidyData.txt", row.names = FALSE)
