# Getting-and-Cleaning-data
Coursera Data Science Specialization Course Course Project

# Project Description

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

# Overview
## run_analysis.R
R script does the following
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
## tidydataset.txt
A tidy dataset is the output of run_analysis.R
## CODEBOOK.md
The file modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information used in run_analysis.R
