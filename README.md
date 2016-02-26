# Getting and Cleaning Data Assignment
This is a repo for the JHU Data Science - Getting and Cleaning Data course assignment.

##Review criteria
* The submitted data set is tidy.
* The Github repo contains the required scripts.
* GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
* The README that explains the analysis files is clear and understandable.
* The work submitted for this project is the work of the student who submitted it.

##Script
The run_analysis.R script uses data provided in the following data set:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script performs the following tasks.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Data
The output of the run_analysis.R script is stored in this repo in a file called tinydata.txt.
