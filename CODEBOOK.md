# CodeBook for the tidy data#
----------

This file describes the variables, the data, and any transformations or work that have been performed to clean up the data.

The site where the data was obtained:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data for the project:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated (and kept for this assignment) from these signals are:

- mean(): Mean value
- std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

Other estimates have been removed for the purpose of this excercise.

## Variables ##

     $ activity
     $ subject
     $ time body accelerate mean x
     $ time body accelerate mean y
     $ time body accelerate mean z
     $ time body accelerate std x
     $ time body accelerate std y
     $ time body accelerate std z
     $ time gravity accelerate mean x
     $ time gravity accelerate mean y
     $ time gravity accelerate mean z
     $ time gravity accelerate std x
     $ time gravity accelerate std y
     $ time gravity accelerate std z
     $ time body accelerate jerk mean x
     $ time body accelerate jerk mean y
     $ time body accelerate jerk mean z
     $ time body accelerate jerk std x
     $ time body accelerate jerk std y
     $ time body accelerate jerk std z
     $ time body gyroscope mean x
     $ time body gyroscope mean y
     $ time body gyroscope mean z
     $ time body gyroscope std x
     $ time body gyroscope std y
     $ time body gyroscope std z
     $ time body gyroscope jerk mean x
     $ time body gyroscope jerk mean y
     $ time body gyroscope jerk mean z
     $ time body gyroscope jerk std x
     $ time body gyroscope jerk std y
     $ time body gyroscope jerk std z
     $ time body accelerate magnitude mean
     $ time body accelerate magnitude std
     $ time gravity accelerate magnitude mean
     $ time gravity accelerate magnitude std
     $ time body accelerate jerk magnitude mean
     $ time body accelerate jerk magnitude std
     $ time body gyroscope magnitude mean
     $ time body gyroscope magnitude std
     $ time body gyroscope jerk magnitude mean
     $ time body gyroscope jerk magnitude std
     $ frequency body accelerate mean x
     $ frequency body accelerate mean y
     $ frequency body accelerate mean z
     $ frequency body accelerate std x
     $ frequency body accelerate std y
     $ frequency body accelerate std z
     $ frequency body accelerate meanfreq x
     $ frequency body accelerate meanfreq y
     $ frequency body accelerate meanfreq z
     $ frequency body accelerate jerk mean x
     $ frequency body accelerate jerk mean y
     $ frequency body accelerate jerk mean z
     $ frequency body accelerate jerk std x
     $ frequency body accelerate jerk std y
     $ frequency body accelerate jerk std z
     $ frequency body accelerate jerk meanfreq x
     $ frequency body accelerate jerk meanfreq y
     $ frequency body accelerate jerk meanfreq z
     $ frequency body gyroscope mean x
     $ frequency body gyroscope mean y
     $ frequency body gyroscope mean z
     $ frequency body gyroscope std x 
     $ frequency body gyroscope std y
     $ frequency body gyroscope std z
     $ frequency body gyroscope meanfreq x
     $ frequency body gyroscope meanfreq y
     $ frequency body gyroscope meanfreq z
     $ frequency body accelerate magnitude mean
     $ frequency body accelerate magnitude std
     $ frequency body accelerate magnitude meanfreq
     $ fbodybodyaccjerkmag mean
     $ fbodybodyaccjerkmag std
     $ fbodybodyaccjerkmag meanfreq
     $ fbodybodygyromag mean
     $ fbodybodygyromag std
     $ fbodybodygyromag meanfreq
     $ fbodybodygyrojerkmag mean
     $ fbodybodygyrojerkmag std
     $ fbodybodygyrojerkmag meanfreq
     $ angle time body acceleratemean,gravity
     $ angle time body accelerate jerkmean,gravitymean
     $ angle time body gyroscopemean,gravitymean
     $ angle time body gyroscope jerkmean,gravitymean
     $ angle x,gravitymean
     $ angle y,gravitymean
     $ angle z,gravitymean
