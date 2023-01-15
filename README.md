# R_week3

# Details on step involved in run_analysis script to create tidy data.

1. Create dataframes by reading files in UCIHAR directory
    1."train_data" - dataframe with all training data by reading "X_train.txt"" 
    2. "test_data" - dataframe with all test data by reading "X_test.txt"
    3. "train_activities" - training activity dataset by reading "y_train.txt"
    4. "train_subjects" - subjects dataset by reading "subject_train.txt"
    5. "test_activities" - training activity dataset by reading "y_test.txt"
    6. "test_subjects" - subjects dataset by reading "subject_test.txt"
    7. "activity_labels" - activity id and activity name mapping dataset by reading "activity_labels.txt"
    8. "features" - feature names (ie. variable names) dataset by reading "features.txt"

2. Add activity id and Subject id columns in training set as well as test sets

3. Create merged dataframe "merged_train_test_data" by combining rows from training and testing sets

4. Add column names for each variable using feature name dataframe

5. Tidy up the merged dataframe by adding activity labels. Add activity labels to each row by merging the combined data set with activity label dataframe

6. Extract mean and standard deviation columns from the tidy merged data to create "mean_std_data" dataframe

7. Create another tidy dataset "average_mean_std_data" from "mean_std_data" with average of each variable for each subject for each activity by preforming the following
 - group "mean_std_data" dataframe by subject and activity name
 - summarise each variable in group by mean using summarise_all function 

8. write the data frame form previous step to tidy_dataset.txt file
