#CodeBook

This is a code book that describes the variables, the data, and any transformations or work that performed to clean up the data.

##The data source

> Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

##The data

This code book summarizes the resulting data fields in tidy.txt.

###Identifiers

> subject - The ID of the test subject

> activity - The type of activity performed when the corresponding measurements were taken

###Measurements
The list of measurements is a long list mostly measuring the sensor signals (accelerometer and gyroscope) and provides for each record the following:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##Transformation details

There are 5 parts:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##How run_analysis.R implements the above steps:

Require dplyr, plyr and data.table packages.
set working directory
download the file
load both test and train data
Load the features and activity labels.
Extract the mean and standard deviation column names and data.
Process the data. There are two parts processing test and train data respectively.
Merge data set.
create the tidydata as output


