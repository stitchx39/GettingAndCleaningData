## Getting and Cleaning Data:Course Work
## Processing of data downloaded from 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## This script does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Assumption: 
## "CI HAR Dataset" folder has been extracted into the Work Directory of R
## run_analysis.R is placed in the Work Directory of R

#library(dplyr)
library(plyr)

# Step 1: Locating the files and merging
# a. Both Train and Test Data are column bind first with subject and Training labels in sequence
# b. Train Data and Test Data are row bind together resulting in 10299 obs of 563 variables

DataDirTrain <- paste("./UCI HAR Dataset/","train/", sep = "")
DataDirTest <- paste("./UCI HAR Dataset/","test/", sep = "")

TrainData <- read.table(paste(DataDirTrain,"X_train.txt", sep = ""))
TrainDataSub <- read.table(paste(DataDirTrain,"subject_train.txt", sep = ""))
TrainDataLab <- read.table(paste(DataDirTrain,"y_train.txt", sep = ""))
TrainD <- cbind(TrainData, TrainDataSub, TrainDataLab)

TestData <- read.table(paste(DataDirTest,"X_test.txt", sep = ""))
TestDataSub <- read.table(paste(DataDirTest,"subject_test.txt", sep = ""))
TestDataLab <- read.table(paste(DataDirTest,"y_test.txt", sep = ""))
TestD <- cbind(TestData, TestDataSub, TestDataLab)

Data <- rbind(TrainD, TestD)

# Step 2 and 4: Extracts only the columns with mean and standard deviation measurement
# a. Identify columns with mean and std from Variable Names
# b. Labels the data set with descriptive variable names.
# c. Extract required columns. There are 88.
VarNames <- read.table(paste("./UCI HAR Dataset/","features.txt", sep = ""))
VarNames <- rbind(VarNames, data.frame(V1 = 562:563, V2=c("subject", "activity")))
TargetCol <- grep("mean|std|subject|activity", VarNames[, 2], ignore.case = TRUE)

VarNames[,2] <- gsub("-mean", " mean", VarNames[,2])
VarNames[,2] <- gsub("-std", " std", VarNames[,2])
VarNames[,2] <- gsub("()-", " ", VarNames[,2])
VarNames[,2] <- gsub("[()]", "", VarNames[,2])

VarNames[,2] <- gsub("fBodyGyroJerkMag", "frequency body gyroscope jerk magnitude", VarNames[,2])
VarNames[,2] <- gsub("tBodyGyroJerkMag", "time body gyroscope jerk magnitude", VarNames[,2])
VarNames[,2] <- gsub("fBodyAccJerkMag", "frequency body accelerate jerk magnitude", VarNames[,2])
VarNames[,2] <- gsub("tBodyAccJerkMag", "time body accelerate jerk magnitude", VarNames[,2])
VarNames[,2] <- gsub("fGravityAccMag", "frequency gravity accelerate magnitude", VarNames[,2])
VarNames[,2] <- gsub("tGravityAccMag", "time gravity accelerate magnitude", VarNames[,2])
VarNames[,2] <- gsub("fBodyGyroJerk", "frequency body gyroscope jerk", VarNames[,2])
VarNames[,2] <- gsub("tBodyGyroJerk", "time body gyroscope jerk", VarNames[,2])
VarNames[,2] <- gsub("fBodyGyroMag", "frequency body gyroscope magnitude", VarNames[,2])
VarNames[,2] <- gsub("tBodyGyroMag", "time body gyroscope magnitude", VarNames[,2])
VarNames[,2] <- gsub("fBodyAccJerk", "frequency body accelerate jerk", VarNames[,2])
VarNames[,2] <- gsub("tBodyAccJerk", "time body accelerate jerk", VarNames[,2])
VarNames[,2] <- gsub("fGravityAcc", "frequency gravity accelerate", VarNames[,2])
VarNames[,2] <- gsub("tGravityAcc", "time gravity accelerate", VarNames[,2])
VarNames[,2] <- gsub("fBodyAccMag", "frequency body accelerate magnitude", VarNames[,2])
VarNames[,2] <- gsub("tBodyAccMag", "time body accelerate magnitude", VarNames[,2])
VarNames[,2] <- gsub("fBodyGyro", "frequency body gyroscope", VarNames[,2])
VarNames[,2] <- gsub("tBodyGyro", "time body gyroscope", VarNames[,2])
VarNames[,2] <- gsub("fBodyAcc", "frequency body accelerate", VarNames[,2])
VarNames[,2] <- gsub("tBodyAcc", "time body accelerate", VarNames[,2])
VarNames[,2] <- gsub("angle", "angle ", VarNames[,2])

VarNames[,2] <- tolower(VarNames[,2])

colnames(Data) <- VarNames[,2]
Data <- Data[, TargetCol]
Data$activity <- as.factor(Data$activity)
Data$subject <- as.factor(Data$subject)

# Step 3: Uses descriptive activity names to name the activities in the data set
# Format activity names and replace accordingly
ActLabels <- read.table(paste("./UCI HAR Dataset/","activity_labels.txt", sep = ""))
ActLabels[, 2] <- tolower(gsub("_", " ", ActLabels[, 2]))

for (i in 1:length(ActLabels$V2)) {
  Data$activity <- gsub(ActLabels$V1[i], ActLabels$V2[i], Data$activity)
}
write.csv(Data, "tidy data.csv")

# Step 5: tidy data set with the average of each variable for each activity and each subject.
# Alternative method
# TidyData <- aggregate.data.frame(Data, by=list(activity = Data$activity, subject=Data$subject), mean)
# x <- ncol(TidyData)-2
# TidyData <- TidyData[,1:x]

TidyData<-ddply(Data, .(activity, subject), colwise(mean))
write.csv(TidyData, "tidy data with mean.csv")