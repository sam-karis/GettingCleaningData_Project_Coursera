
### COURSERA GETTING AND CLEANING DATA COURSE PROJECT
### By Samkaris
### Date: March 2017

## This project does the following.

# 1. Download the UCI HAR Dataset from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 2. Merge the training and the test sets to create one data set.
# 3. Extract only the measurements on the mean and standard deviation for each measurement. 
# 4. Use descriptive activity names to name the activities in the data set
# 5. Appropriately label the data set with descriptive activity names. 
# 6. Creates a second, independent tidy data set. 


#Lets first clear the work space but leaving the downloadtime because we shall not
#download the data each time we run the script

rm(list=setdiff(ls(), "downloadtime"))

# Source the function_source.R script that we have Three functions defined:
# 1. path()
# 2. read_label_data()
# 3. join_train_test()

source("functions_source.R")


# Check if the data exist in our working directory if not we download and record the time of download

data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists("./dataset.zip")){
  download.file(data_url, destfile = "dataset.zip") 
  downloadtime <- date()
}
downloadtime

# Check if the data has being unzipped and if not unzip else continue.

if (!file.exists("./UCI HAR Dataset")){
  unzip("./dataset.zip")
}

# Read Features and explore it.

features <- fread(path('features.txt'))
dim(features)
head(features)

# Convert features to characters that can be used as column name

features$V2 <- as.character(features$V2)
features$V2 <- gsub("[-()]","", features$V2)
dim(features)
head(features)

# Select all the features consisting the means and standard deviation only 
# we also create an integer vector(features_wanted) that we utilize to only read the
# test and train data we need(mean and std measurement) instead of the whole set

features_wanted <- grep("mean|std", features$V2)
features_df <- features[c(features_wanted),]
dim(features_df)
head(features_df)

# Read the Train data into R and combine with their respective labels and subjects

train_dat <- "train/X_train.txt"
train_label <- "train/y_train.txt"
train_sub <- "train/subject_train.txt"

train <- read_label_data(train_dat, train_label, train_sub)

# Read the Test data into R and combine with their respective labels and subjects

test_dat <- "test/X_test.txt"
test_label <- "test/y_test.txt"
test_sub <- "test/subject_test.txt"

test <- read_label_data(test_dat, test_label, test_sub) 

# Lets merge the train and test dataframe into one(complete_df)

complete_df <- join_train_test(train, test)
dim(complete_df)

# lets give the variable discriptive names
# label and subject occupies the first and second column respectively of our complete_df 

colnames(complete_df) <- c("subject", "activity", features_df$V2)

# Read the activity.txt into R and explore the data

activity <- fread(path('activity_labels.txt'))
dim(activity)
activity$V2 <- gsub("_", " ", activity$V2)
head(activity)

# lets give activity labels discriptive names that is from the activities_labels.txt

complete_df$activity <- activity[match(complete_df$activity, activity$V1),2]

dim(complete_df)
head(complete_df)

# Finally the complete_df data is tidy that is:
# Each column contain one variable and a discriptive colomn names
# Each activity in the activity column has discriptive name
# The data contain only the mean and std measurement only
# Lets write the data into a tidy.txt so that the data can be used later for analysis

write.table(complete_df, "./tidy.txt", sep = "\t")
