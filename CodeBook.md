
# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Input Data
The run_analysis.R script read data from 'UCI HAR Dataset' directory.

## Output Data
The run_analysis.R script produce a tidy data set written in the output file 'tidydata.txt' containing the average of the mean and standard deviation for each measurements, originally sampled from the 3-axial accelerometer and gyroscope, grouped by activity and subject.

The output file contains the following variables:

    the subject id of the person that performed the activity
    a description of the activity that was performed

    the mean and standard deviation for each of the following measurements:

    tBodyAcc
    tBodyAccJerk
    tBodyGyro
    tBodyGyroJerk
    tGravityAcc
    fBodyAcc
    fBodyAccJerk
    fBodyGyro

where each variable has the three components along the x,y,z axis and the corresponding magnitude.

A total of 66 variables  and 180 observations are present in the final data set.

All the above features has been normalized and bounded within [-1,1] in the original data set, so no unit of measurements is applicable to them.

## Transformations

The script performs the following operations:
    The process() function merged to train and test data set. Every data set was processed to be a data table object.  
    The action() function is a threhold , it assemble train and test data set to become a tidy data set. 
    The tidy data set with the average of each variable for each activity and each subject was written in the output file "tidydata.txt". 
