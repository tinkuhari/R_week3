library(dplyr)

#Read feature data used for training and testing
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")

#Read activity and subject details used to generate feature data
train_activities <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Read activity and feature labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

#Merge activity and subject data used in training to training feature data
train_data$subject <- train_subjects$V1
train_data$activity <- train_activities$V1

#Merge activity and subject data used in training to training feature data
test_data$subject <- test_subjects$V1
test_data$activity <- test_activities$V1

#Merge training and testing datasets. This dataset contain feature data, subject id,activity id
combined_data <- union(train_data,test_data)

#Add activity labels to each row by merging the combined data set with activity label dataset 

data_withlabels <- merge(activity_labels,combined_data,by.x="V1",by.y="activity")

#Add column names

names(data_withlabels)[1:2] <- c("activity_id","activity_name")#update column names of activity id and name
names(data_withlabels)[3:563] <- features$V2 #Add descriptive names for all 560 variable name
names(data_withlabels)[564] <- "subject"



#Extract mean and standard deviation data for each activity and subject

tidy_data1 <- data_withlabels %>%
  select(subject,activity_name,contains("mean()")|contains("std()"))

#create data set with average for each mean and std variable for each activity and subject
tidy_data2 <- tidy_data1 %>%
  group_by(subject,activity_name)%>%
  summarise_all(mean)

#View tidy dataset2
View(head(tidy_data2))