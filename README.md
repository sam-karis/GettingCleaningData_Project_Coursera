# GettingCleaningData_Project_Coursera   
   
# By Samkaris on March 2017  
   
This is project done as part of coursera course assignement (Getting and cleaning Data)   
In this project I use the UCI HAR Dataset from the link below.   
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip    
   
In the project I do the following :   
+ Download the data and unzip it into UCI HAR Dataset folder.  
+ Select the mean and std measurement then read them into R.   
+ Merge the train and test data set into one   
+ Give descriptive names to variables (subject, activities and measurements)     
+ Give descriptive names to activities   
+ Create a tidy data consisting of all the subjects, labels and measurement of mean and std(completedata.txt)      
+ Create a second independent tidy data set of measurement average grouped by each activity and each subject (tidy.txt)  
   
#  Arrangement of the project scripts   
The project has the following scripts.   
1. **run_analysis.R** - Main script   
    
For the analysis run this script to get and unzip and clean the data.   

2. **function_source.R** - Helper script that defeines three functions that are sourced by run_analysis.R script    
The script contain three user defined functions functions :   
+ path() - takes file name as the arguement to return the path for the file.   
+ read_label_data() - Read either train or test data and their respective subjects and activity labels.    
+ join_train_test() - join the train and test data to one.    
    
3. **Codebook.MD** - Give a description of the tidy data created after running the run_analysis.R script    
    
4. **tidy.txt** - The file contain average of each measurement grouped by each activity and each subject.
    
# To run the Projects in your local machine
1. You need to have install: R and R studio
2. Package needed : data.table and dplyr  
2. Navigate to a directory of your choice in you computer on terminal.
3. Clone a repository on that directory.

using HTTPS    
https://github.com/sam-karis/GettingCleaningData_Project_Coursera.git    
    
using SSH    
    
[git@github.com:sam-karis/GettingCleaningData_Project_Coursera.git]    
Then Run the run_analysis.R script   
