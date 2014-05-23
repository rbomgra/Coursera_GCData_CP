#############################################################################################
# Name: run_analysis.R
# Porpouse: 
# downloaded and unzipped file from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#############################################################################################

#############################################################################################
# 0.- Previous steps ########################################################################
# Setting the working directory
setwd("D:/#FORMACION/Coursera/03 - Getting and Cleaning Data/CProject")
library ("reshape2")

#############################################################################################
# 1.- Merging the training and the test sets to create one data set ##########################
# 1.1.- Reading features file
features <- read.table (paste0(getwd(),'/UCI HAR Dataset/features.txt'))
activity_labels <- read.table(paste0(getwd(),'/UCI HAR Dataset/activity_labels.txt'))
# Adding names to features
names(activity_labels) <- c("Activity_Code","Activity")
# 1.2.- Read tree train files ( Set, Labels and Subjects)
train_set <- read.table (paste0(getwd(),'/UCI HAR Dataset/train/X_train.txt'))
train_label <- read.table (paste0(getwd(),'/UCI HAR Dataset/train/y_train.txt'))
train_subject <- read.table (paste0(getwd(),'/UCI HAR Dataset/train/subject_train.txt'))
# Merging the tree train files into a dataset
train_tot <- cbind(train_set,train_label,train_subject)
# 1.3.- Read tree test files ( Set, Labels and Subjects)
test_set <- read.table (paste0(getwd(),'/UCI HAR Dataset/test/X_test.txt'))
test_label <- read.table (paste0(getwd(),'/UCI HAR Dataset/test/y_test.txt'))
test_subject <- read.table (paste0(getwd(),'/UCI HAR Dataset/test/subject_test.txt'))
# Merging the tree test files into a dataset
test_tot <- cbind(test_set,test_label,test_subject)
# 1.4.- Merging the test and train dataset
total <- rbind(train_tot,test_tot)

names(total) <- factor(append(as.character(t(features[,2])),c("Activity_Code","Subject")))

#############################################################################################
# 2.- Extracts only the measurements on the mean and standard deviation for each measurement.
f1 <- agrep("mean()",features[,2])
f2 <- agrep("std()",features[,2])
fs <- sort(union(f1,f2))
# 3.1.- Subseting the columns whit just mean() and str() metrics + Label + Subject columns
clean_data <- total[,c(fs,c(562,563))]

#############################################################################################
# 3- Uses descriptive activity names to name the activities in the data set
names1 <- gsub(pattern="\\(|\\)", names(clean_data), replacement="")
names(clean_data) <- gsub(pattern="\\-", names1, replacement=".")


#############################################################################################
# 4.- Labeling the data set with descriptive activity names
clean_data_m <- merge(clean_data,activity_labels, by.x="Activity_Code", by.y="Activity_Code",all=TRUE)

#############################################################################################
# 5.- Creating the tidy data set with the average of each variable for each activity and each subject
clean_data_melt <- melt(clean_data_m,id=c(1,68,69),mesure.vars=c(-1,-68,-69))
tidy_data <- dcast(clean_data_melt , Activity + Subject ~ variable, fun.aggregate=mean)
# 5.1- Creating the tidy data set with the average of each variable for each activity and each subject
write.table(tidy_data, file = "tidy_data.txt", sep = " ")

