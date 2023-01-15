library(dplyr)

#Read training set and test set
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")

#Read activity id and subject id details of training set and test set
train_activities <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Read activity and feature labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names = c("activityId","activityName"))
features <- read.table("./UCI HAR Dataset/features.txt")

#Add activity id, subject id columns to training set.
train_data <- cbind(subjectId=train_subjects$V1,activityId=train_activities$V1,train_data)

#Add activity id, subject id columns to test set.
test_data <- cbind(subjectId=test_subjects$V1,activityId=test_activities$V1,test_data)

###Merge training and testing sets and tidy up the data###

#1. Combine train and test sets
merged_train_test_data <- union(train_data,test_data)

#2. Add variable names for each feature column
names(merged_train_test_data)[-c(1:2)] <- features$V2 

#3. Add activity labels to each row by merging with activity label dataset 
tidy_merged_data <- merge(activity_labels,merged_train_test_data,by="activityId")


###Extract required variables and summarize the extracted data###

#1. Extract mean and standard deviation data for each activity and subject
mean_std_data <- tidy_merged_data %>%
                 select(subjectId,activityName,contains("mean()")|contains("std()"))

#2. Create a tidy data set with average for each mean() and std() variable for each activity and subject
average_mean_std_data <- mean_std_data %>%
                         group_by(subjectId,activityName)%>%
                         summarise_all(mean)

#3. Rename the variable column to indicate the data represents average of mean() or std()
names(average_mean_std_data)[-c(1:2)] <- paste0("Average_",names(average_mean_std_data)[-c(1:2)])

###write summarized data to file###
write.table(average_mean_std_data,file="./tidy_dataset.txt",row.names = FALSE)
