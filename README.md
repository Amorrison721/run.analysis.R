# run.analysis.R
This is a repository for the course project.
This project is for the Getting and Cleaning Data course.
This repo contains an r script called run.analysis.R which will will calculate 
means per activity, per subject of the mean and Standard deviation of the Human Activity Recognition dataset as downloaded 
the course website.

The script will output the data into both a txt file and an excel spreadsheet

The script does the following:

Reads the test and training data and labels
Reads the subject test and training data (identifies the subject who performed each activity
Reads the features and the table that links the labels with their activity

Merges the training and the test sets (data, subject, label datasets)to create one data set for each.
Adds the column names to the these datasets 

Binds all the columns together (data, subject, activity for both test and training) into one big dataset

Extracts only the measurements on the mean and standard deviation for each measurement. 


Creates a second, independent tidy data set with the average of each variable for each activity and each subject

The script needs the packages (reshape2), (dplyr), and (xlsx)
