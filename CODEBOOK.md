## DATA
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The project uses data from the UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set
The data can be found at here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  


## STEP BY STEP
# 1.  Merges the training and the test sets to create one data set
  Data was downloaded at above URL, test set and train set was combined by columns. Then, both of test set and train set was combined by rows to create full_set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  all_names are created by combining subject, activity and lower feature label, then was subsetted to include only subject, activity and other contained mean and std. After that, full_set will filterd with subsetted name. (set.1) 
# 3. Uses descriptive activity names to name the activities in the data set
  The number indicated activities (set.1$V1.1) were changed by activity labels in V2.
# 4. Appropriately labels the data set with descriptive variable names. 
  The resulting *sub_names* variable was processed in a number of steps: capital letters were applied where appropriate, punctuation was removed, abbreviations "t" and "f" were changed to time and frequency. Finally, theses modified names were applied to the *set.1*.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  This was accomplished by applying the dply package verbs "group_by" and "summarise_each" and pipeline (%>%).  The resulting tidy data set was written to a file called "tidydataset.txt".
## VARIABLES
datadescription = source project description from UCI Machine Learning Repository  
dataUrl         = URL for zip archive of source data  

activityLabels  = six activity codes and corresponding activity names  
features        = feature names for X_test, X_train  

test_subject    = test set subject number, 1-30  
test_x          = test set feature measurements  
test_y          = test set activity, coded 1-6  
  
train_subject   = train set subject number, 1-30  
train_x         = train set feature measurements  
train_y         = train set activity, coded 1-6  
  
test            = test_subject,test_y,test_x combined, by columns  
train           = train_subject, train_y, train_x combined, by columns  
full_set         = test, train, combined by rows  
  

all_names       = include subject, activities, and tolower of feature labels
mean_std_columns= subject, activity, and all features with mean or standard deviation  
set.1     = full_set subsetted with mean_std_columns 
sub_names    = allNames subsetted with mean_std_columns, renamed to R conventions. 
                 
tidydataset     = data set with average of each variable, group by activity then by subject 
