# R_week3

# Details on step involved in run_analysis script to create tidy data.

1. Create two dataframe by reading training set "X_train.txt"" and test set "X_test.txt"

2. Create acitivity and subject dataframes for train and test set. Following files contains the respective data "y_train.txt", "subject_train.txt", "y_test.txt", "subject_test.txt"

3. Create Activity lables data frame by reading "activity_labels.txt". This dataframe has activity id and activity name mapping

4. Create  feature name data frame by reading "features.txt"

5. Add activity id and Subject id columns in training set as well as test set

6. Create merged dataframe by combining rows from training and testing sets

7. Add column names for each variable using feature name dataframe

8. Tidy up the merged dataset by adding activity labels. Add activity labels to each row by merging the combined data set with activity label dataframe

9. Extract mean and standard deviation columns from the merged data from previous step to create "mean_std_data" dataframe

10. Create a tidy data with average of each variable for each subject for each activity by preforming the following
 - group "mean_std_data" dataframe by subject and activity name
 - summarise each variable in group by mean using summarise_all function 

11. write the data frame form previous step to tidy_dataset.txt file
