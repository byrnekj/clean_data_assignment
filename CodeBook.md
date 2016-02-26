#Code Book
This document describes the code inside run_analysis.R.

##Data Source
The data used by this script was gathered from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In particular, this script uses the following files.
* ./UCI HAR Dataset/features.txt
* ./UCI HAR Dataset/activity_labels.txt
* ./UCI HAR Dataset/test/subject_test.txt
* ./UCI HAR Dataset/test/X_test.txt
* ./UCI HAR Dataset/test/y_test.txt
* ./UCI HAR Dataset/train/subject_train.txt
* ./UCI HAR Dataset/train/X_train.txt
* ./UCI HAR Dataset/train/y_train.txt

##Code Structure
First all pertinent data sets are read into tables using read.table.

The rest of the code is organized around the 5 requirements provided by the instructors.  

1. Merges the training and the test sets to create one data set.  
 * In this section the the train and test data is combined
 * All columns are given names (although this is part of step 4 it made more logical sense to include here)
 * The 3 resulting data sets are then merged into one table.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
 * First the script creates a vector of measurement columns called mean_stnd to be used based on a regular expression searching for mean() and std()
 * The mean_stnd vector is then used to create a final vector of necessary column references called cols
 * Next the script builds a table called subset based on the full data set using the columns in the cols vector
3. Uses descriptive activity names to name the activities in the data set
 * A vectir called act_labels is created to store the list of activities and their activity_id
 * These labels are then applied to the activity_id stored in the subset table.
4. Appropriately labels the data set with descriptive variable names.
This step is handled as part of step 1. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 * Using the table called subset the data is summaried on Subject and Activity and stored in a table called summarized_data
 * The table summarized_data is then writen to a flat file called tidydata.txt.

## Variables
Subject - A number ranging from 1 to 30 corresponding to the subject being measured.
Acivity - A string describing the activity being performed when the measurement was taken.
The remaining columns contain mean and standard deviations for the associated measurement on the noted axis (X,Y, orZ).
The vectors measured include.
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag
