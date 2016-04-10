# Getting-Cleaning-Data-Assignment
## Peer Reviewed Final Assignment 

###Assignment Instructions/deliverables; 
You should create one R script called run_analysis.R that does the following.
*1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###The Tasks performed in doing this assignment:
1. The first thing I did is to set my working directory to the folder where the data is going to be downloaded. 
2. I then downloaded the data and unzipped it to my working directory.
3. I read the readme file and activity_lable and features text files.
4. I loaded the required R packages.
5. Then I read activity, subject, dnd features. 
6. I familiarized myself with the data by looking at each file's dimension, structure..etc. to see how it looks (these steps are not included in the final output and are just for helping me understand the data).
7. I merged the two files together using rbind() and stored them in new variables.
8. I also created name variables and merged columns to get a dataframe using cbind()
9. Then I extract Mean & Standard Deviation measurements using grep() and added activity and subject columns 
10. I put all the extracted data for new dataframe in a new variable.
10. I then created descriptive activity names and then label the activity names with more descriptive names 
10. Finally, I put everything together and created a Tidydata data.table
11. then I used write.table() to create TidyData.txt.

###Assessment Directions

You should Assess my code against the tasks given by the below assignment direction. 

Merges the training and the test sets to create one data set. 
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
