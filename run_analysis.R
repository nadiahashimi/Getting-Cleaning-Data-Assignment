## Create one R script called run_analysis.R that does the following:
## Task 1. Merges the training and the test sets to create one data set.
## Task 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## Task 3. Uses descriptive activity names to name the activities in the data set
## Task 4. Appropriately labels the data set with descriptive activity names.
## Task 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Set Working Directory
setwd("/Users/nadiahashimi/Desktop/Data Scientist Course/Cleaning Data/course project/data")

## Download the file and put the file in the "data" folder & unzip it (unzipped in the folder "./data/UCI HAR Dataset".
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./data/Dataset.zip",method="curl")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

### Load required packages
library(dplyr)
library(data.table)
library(tidyr)

## Task 1. Merges the training and the test sets to create one data set.

## The data has 'Activity', 'Subject', and 'Features' variables so we read each separately.
## Read the Activity files
ActivityTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
ActivityTest  <- read.table("./UCI HAR Dataset/test/Y_test.txt")

## Read the Subject files
SubjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
SubjectTest  <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Read Fearures files
FeaturesTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
FeaturesTest  <- read.table("./UCI HAR Dataset/test/X_test.txt")

## Merge the data to create one set and store them in subject, activity, and features variables. 
subject <- rbind(SubjectTrain, SubjectTest)
activity <- rbind(ActivityTrain, ActivityTest)
features <- rbind(FeaturesTrain, FeaturesTest)

## creating name variables
names(subject)<-c("subject")
names(activity)<- c("activity")
FeaturesNames <- read.table("./UCI HAR Dataset/features.txt")
names(features)<- FeaturesNames$V2

## merge columns to get dataframe.
completedata <- cbind(features, activity, subject)

## Task 2. Extracts only the measurements on the mean and standard deviation for each measurement.

WithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completedata), ignore.case=TRUE)

## Add activity and subject columns to the list and look at the dimension of completedata
requiredcolumns <- c(WithMeanSTD, 562, 563)
dim(completedata)

## we then extract the data from requiredcolumns
extracteddata <- completedata[,requiredcolumns]
dim(extracteddata)

## Task 3. Uses descriptive activity names to name the activities in the data set

## Read descriptive activity names from “activity_labels.txt”
extracteddata$activity <- as.character(extracteddata$activity)
extracteddata$activity[extracteddata$activity == 1] <- "Walking"
extracteddata$activity[extracteddata$activity == 2] <- "Walking Upstairs"
extracteddata$activity[extracteddata$activity == 3] <- "Walking Downstairs"
extracteddata$activity[extracteddata$activity == 4] <- "Sitting"
extracteddata$activity[extracteddata$activity == 5] <- "Standing"
extracteddata$activity[extracteddata$activity == 6] <- "Laying"
extracteddata$activity <- as.factor(extracteddata$activity)

## Task 4. Appropriately labels the data set with descriptive activity names.

## label features of activity names with descriptive variables
names(extracteddata)<-gsub("^t", "Time", names(extracteddata))
names(extracteddata)<-gsub("^f", "Frequency", names(extracteddata))
names(extracteddata)<-gsub("Acc", "Accelerometer", names(extracteddata))
names(extracteddata)<-gsub("Gyro", "Gyroscope", names(extracteddata))
names(extracteddata)<-gsub("Mag", "Magnitude", names(extracteddata))
names(extracteddata)<-gsub("tBody", "TimeBody", names(extracteddata))
names(extracteddata)<-gsub("-mean()", "Mean", names(extracteddata), ignore.case = TRUE)
names(extracteddata)<-gsub("-std()", "STD", names(extracteddata), ignore.case = TRUE)
names(extracteddata)<-gsub("-freq()", "Frequency", names(extracteddata), ignore.case = TRUE)
names(extracteddata)<-gsub("angle", "Angle", names(extracteddata))
names(extracteddata)<-gsub("gravity", "Gravity", names(extracteddata))

## Task 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
extracteddata$subject <- as.factor(extracteddata$subject)
Masterdatatable <- data.table(extracteddata)
TidyData <- Masterdatatable[, lapply(.SD, mean), by = 'subject,activity']
TidyData <- TidyData[order(TidyData$subject,TidyData$activity),]
write.table(TidyData, file = "TidyData.txt", row.names = FALSE)