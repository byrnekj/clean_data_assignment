run_analysis <- function() {

    # This function will:
    # 1 - Merge the training and the test sets to create one data set.
    # 2 - Extracts only the measurements on the mean and standard deviation for 
    #     each measurement.
    # 3 - Uses descriptive activity names to name the activities in the data set
    # 4 - Appropriately labels the data set with descriptive variable names.
    # 5 - From the data set in step 4, creates a second, independent tidy data 
    #     set with the average of each variable for each activity and each subject.
    
    #READ DATA INTO R
    feature           <- read.table("./data/UCI HAR Dataset/features.txt")
    activity          <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
    subject_test      <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
    x_test            <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    y_test            <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
    subject_train     <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
    x_train           <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    y_train           <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
    
    #1 - Merges the training and the test sets to create one data set.
    #merge train and test data
    subject <- rbind(subject_train, subject_test)
    x <- rbind(x_train, x_test)
    y <- rbind(y_train, y_test)
    
    #add column names (needed for #4)
    colnames(y) <- "Activity"
    colnames(subject) <- "Subject"
    colnames(x) <- t(feature[2])
    
    #merge data sets
    full_data_set <- cbind(subject,y,x)
    
    #2 - Extracts only the measurements on the mean and standard deviation for 
    #     each measurement.
    
    #find col numbers for mean and std measurements
    mean_stnd <- grep("mean\\(\\)|std\\(\\)", names(full_data_set));
    
    #create column list
    cols <- c(1,2,mean_stnd)
    
    #create subset from column list
    subset <- full_data_set[,cols]
    
    #3 - Uses descriptive activity names to name the activities in the data set
    #get activity labels
    act_labels <- apply(activity, 1, function(x) unlist(strsplit(x, split=" ")))
    
    #apply labels
    subset[,"Activity"] <- factor(as.factor(subset[,"Activity"]), labels=act_labels[2,])
    
    #4 - Appropriately labels the data set with descriptive variable names.
    #This step was handled prior to combining the data sets
    
    #5 - From the data set in step 4, creates a second, independent tidy data 
    #    set with the average of each variable for each activity and each subject.
    summarized_data <- aggregate(. ~Subject + Activity, subset, mean)
    
    write.table(summarized_data, "tidydata.txt", row.name=FALSE) 
}