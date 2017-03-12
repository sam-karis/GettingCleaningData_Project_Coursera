# This script act as a helper file for run_analysis.R script
# It contains three defined functions that are used in run_analysis.R script
# for ease of reading and merging data. 

# First load the data.file that we will use to read data for it efficiency and speed

library(data.table)

# 1. path function
# The path function help us get the data location(path) by only passing file name.
# This minimises repetation.

path <- function(fileName){
  
  data_store <- './UCI HAR Dataset'
  
  file_path <- file.path(data_store, fileName)
  
  file_path
}

# 2. read_label_data function
# The function utilizes the path function defined above to get the file path
# and the fread function from the data.table package. 
# The function first read either the train or test data sets where it select only the 
# mean $ standard deviation measurements as defined in features_wanted in run_analysis.R
# then read their respective labels and subjects
# finaly the function merge the three dataframe into one dataframe.

read_label_data <- function(datSet, labelSet, subjectSet){
  
  data_df <- fread(path(datSet),
                   select = features_wanted)
  
  label_df <- fread(path(labelSet))
  
  subject_df <- fread(path(subjectSet))
  
  complete_df <- cbind(subject_df, label_df, data_df)
  
  complete_df
}


# 3. join_train_test function
# Join train and test data read and created by read_label_sub function above

join_train_test <- function(trainSet, testSet){
  
  complete_df <- rbind(trainSet, testSet)
  
  complete_df
}
