# CodeBook
==================================

##Variables Description 
==================================
The features included in the original dataset are explained in UCI HAR Dataset/features_info.txt file.
The features selected for the result dataset are only the mean and standard deviation for each measurement in the original dataset.
That is, the function mean() and std() for each measurement included in the test and trail files. 
The internal Signals file included in the original dataset are ignored.

##Tidy Data
==================================
The result dataset (tidy_data) contains the mean value for every subject an label activity  of this measurements:

* tBodyAcc.mean.X Y Z
* tBodyAcc.std.X Y Z
* tGravityAcc.mean.X Y Z
* tGravityAcc.std.X Y Z
* tBodyAccJerk.mean.X Y Z
* tBodyAccJerk.std.X Y Z
* tBodyGyro.mean.X Y Z
* tBodyGyro.std.X Y Z
* tBodyGyroJerk.mean.X Y Z
* tBodyGyroJerk.std.X Y Z
* tBodyAccMag.mean
* tBodyAccMag.std
* tGravityAccMag.mean
* tGravityAccMag.std
* tBodyAccJerkMag.mean
* tBodyAccJerkMag.std
* tBodyGyroMag.mean
* tBodyGyroMag.std
* tBodyGyroJerkMag.mean
* tBodyGyroJerkMag.std
* fBodyAcc.mean.X Y Z
* fBodyAcc.std.X Y Z
* fBodyAccJerk.mean.X Y Z
* fBodyAccJerk.std.X Y Z
* fBodyGyro.mean.X Y Z
* fBodyGyro.std.X Y Z
* fBodyAccMag.mean
* fBodyAccMag.std
* fBodyBodyAccJerkMag.mean
* fBodyBodyAccJerkMag.std
* fBodyBodyGyroMag.mean
* fBodyBodyGyroMag.std
* fBodyBodyGyroJerkMag.mean
* fBodyBodyGyroJerkMag.std


##Transformations to get Tidy Data
==================================
* Step 1. Read the test and trail dataset and add the subject and label activity to the dataset
* Step 2. Merge the test and trail dataset
* Step 3. Add descriptive names to the columns in the dataset
* Step 4. Include Activity Labels in the result dataset
* Step 5. Summarize the result dataset calculating the mean value of every measurement for each Subject an Label activity.

 