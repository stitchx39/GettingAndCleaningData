# Getting and Cleaning Data Course Project #
----------

## Introduction ##
The goal is to prepare tidy data that can be used for later analysis. 

## About the raw data ##
The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


## About the script and the tidy dataset ##
The following describes the steps to reproduce this project:

1. unzip the data from the above link into the working directory of R.
2. Make sure the folder "UCI HAR Dataset" and the run_analysis.R script are both in the current working directory of R
3. Use source("run_analysis.R") command in RStudio.
4. two output files are generated in the current working directory:
	- tidy data.csv (10.2 Mb): it contains a data frame called cleanedData with 10299*88 dimension.
	- tidy data with mean.csv.txt (287 Kb): it contains a data frame called result with 180*88 dimension.


The following describe about the script:

1. Merges the training and the test sets to create one data set.
	- Both Train and Test Data are column bind first with subject and Training labels in sequence
	- Train Data and Test Data are row bind together resulting in 10299 obs of 563 variables
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	- Both Train and Test Data are column bind first with subject and Training labels in sequence
	- Train Data and Test Data are row bind together resulting in 10299 obs of 563 variables
3. Appropriately labels the data set with descriptive variable names. 
	-Identify columns with mean and std from Variable Names
	- Labels the data set with descriptive variable names.
	- Extract required columns. There are 88.
4. Uses descriptive activity names to name the activities in the data set
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Author: Daniel Wong