
#Dataframe and variable details

    1."train_data" - dataframe with all training data from "X_train.txt" and corresponding activity, subject id for each observation. Activity and subject details are added by reading "y_train.txt" and "subject_train.txt"
              - contains 563 columns:  activity id, subject_id and 561 features
              
    2."test_data" - dataframe with all training data from "X_train.txt" and corresponding activity, subject id for each observation. Activity and subject details are added by reading "y_test.txt" and "subject_test.txt"
    
    3. "train_activities" - training activity dataset by reading "y_train.txt". contains activity id for each training data observation
    
    4. "train_subjects" - subjects dataset by reading "subject_train.txt". contains activity id for each training data observation
    
    5. "test_activities" - training activity dataset by reading "y_test.txt". contains activity id for each test data observation
    
    6. "test_subjects" - subjects dataset by reading "subject_test.txt". contains activity id for each test data observation
    
    7. "activity_labels" - activity id and activity name mapping dataset by reading "activity_labels.txt". contains 2 columns 
    
    8. "features" - feature names (ie. variable names) dataset by reading "features.txt". contains a column with names of 560 features
    
    9. "merged_train_test_data" - dataframe with all observations from train and test set 
    
    10. "tidy_merged_data" - tidy dataframe with all observations from train and test set. contains subject ids,activity id, activity name columns corresponding to each 560 features. 
    
    11. "mean_std_data" - dataframe with only mean and standard deviation features with correspoinding subject id and activity name
    
    12. "average_mean_std_data" - tidy dataframe with average of mean and standard features for each activity for each subject 
    
    