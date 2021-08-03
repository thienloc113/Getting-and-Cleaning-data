# Getting and Cleaning Data Project John Hopkins Coursera
# Author: Loc Nguyen

# Library, Load Package
library(tidyverse)
library(data.table)


# Data decription and URL to download
datadescription <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Get data
path <- getwd()
download.file(dataurl, file.path(path, "datafiles.zip"))
unzip(zipfile = "datafiles.zip")


# Activity and Feature Labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt") ## label at V2
features <- read.table("./UCI HAR Dataset/features.txt")  ## features at V2

# Load Train Data
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
train<-cbind(train_subject, train_y, train_x)

# Load Test Data
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
test<-cbind(test_subject,test_y,test_x)


# Combine test and train sets into full data set
full_set<-rbind(test, train)

# Subset columns
all_names <- c("subject", "activity", as.character(tolower(features$V2)))
mean_std_columns <- grep("subject|activity|mean|std", all_names, value = FALSE)
set.1 <- full_set[mean_std_columns]

#Uses descriptive activity names to name the activities in the data set
set.1$V1.1<-activityLabels$V2[set.1$V1.1]

#Appropriately labels the data set with descriptive variable names.

sub_names <- all_names[mean_std_columns] 
sub_names <- gsub("mean", "Mean", sub_names)
sub_names <- gsub("std", "Std", sub_names)
sub_names <- gsub("gravity", "Gravity", sub_names)
sub_names <- gsub("^t", "time", sub_names)
sub_names <- gsub("^f", "frequency", sub_names)
names(set.1) <- sub_names   # New names for data

# Create tidy data set
tidydataset <- set.1 %>% group_by(activity, subject) %>% 
      summarise_all(list(mean))

# Write tidy data to txt
write.table(tidydataset, file = "tidydataset.txt", row.names = FALSE)
