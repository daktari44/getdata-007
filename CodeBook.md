## Getting and Cleaning Data - Course Project CodeBook

### Course Project objectives:
* Demonstrate ability to collect, work with, and clean a data set.
* The goal is to prepare tidy data that can be used for later analysis.

#### Background
This project used data from the Human Activity Recognition Using Smartphones Dataset (Version 1.0). A full description of the experiment can be found at this site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The downloaded data folder included in which were the following files:
- *'README.txt'* : provides summary information about the experiment
- *'features_info.txt'*: Shows information about the variables used on the feature vector.
- **'features.txt'**: List of all features .
The variables used in the creation of the project dataset were modified from the 'features.txt' values.
Information from the 'README.txt' and the 'features_info.txt' have been used and adapted as necessary to develop this codebook.

### Experimental Design
 *Source: This information is adapted from the 'features_info.txt' and the 'README.txt' files.*
The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

The features selected for the database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
  * tBodyAcc-XYZ
  * tGravityAcc-XYZ
  * tBodyAccJerk-XYZ
  * tBodyGyro-XYZ
  * tBodyGyroJerk-XYZ
  * tBodyAccMag
  * tGravityAccMag
  * tBodyAccJerkMag
  * tBodyGyroMag
  * tBodyGyroJerkMag
  * fBodyAcc-XYZ
  * fBodyAccJerk-XYZ
  * fBodyGyro-XYZ
  * fBodyAccMag
  * fBodyAccJerkMag
  * fBodyGyroMag
  * fBodyGyroJerkMag

#### Raw data:
Including the "subject" and "activity" variables, 10299 observations of 563 variables in the raw data. From this list, only the measurement variables derived from the 
  * mean(): Mean value
  * std(): Standard deviation
were selected for further processing. The total number of variables selected were 68, yielding a dataset of 10299 observations and 68 variables for further processing.

#### Processed Data
The final processed dataset consists of 180 observations of 68 variables, with each variable representing the each of the mean() and std() measurements for each activity and each subject. The variable names were edited to better reflect the meaning of the revised variables and their readability. 
###### Actions taken in editing variables 3 - 68
* Removing the () and - symbols
* Expanding all of the abbreviations (except for the 'std' and the 'avg' abbreviations (see the 'README.md' for a discussion on the rationale for these changes). Abbreviations that were adjusted include:
    - "Acc" changed to "accelerometer"
    - "Gyro" changed to "gyroscope"
    - "Mag" changed to "magnitude".
* Replacing the "t" and "f" with time and frequency, respectively
* changing the variable names to all lower case letters except for those denoting the 'XYZ' directional signals which were retained as is.
* correcting any spelling errors
    - in particular the "BodyBody" was edited to "body" to make it consistent with the description included in the 'features_info.txt' file.
* an 'avg' prefix was added to the variable names to distinguish them from those in the raw data files and emphasize that variables included in the final dataset were based modified averages from the original dataset.
* Each variable consists of a single value, and as explained in the 'README.txt' file that was included in the data folder, the values included in the dataset were normalized, therefore there are no corresponding units of measurement.

#### List of variables included in the final processed dataset.
| Variable name| Variable Definition  |
|:-------------|:-------------------  |
|"subject"  | The subject who performed the activity for each window sample. Its range is from 1 to 30. |
|"activity" | The activities: six levels - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.    |
|"avgtimebodyaccelerometermeanX"    | average of the mean of the time domain body accelerometer signal taken in the X axial direction. |    
|"avgtimebodyaccelerometermeanY"    | average of the mean of the time domain body accelerometer signal taken in the Y axial direction. |
|"avgtimebodyaccelerometermeanZ"    | average of the mean of the time domain body accelerometer signal taken in the Z axial direction. |
|"avgtimeGravityaccelerometermeanX" | average of the mean of the time domain gravity accelerometer signal taken in the X axial direction.  |
|"avgtimeGravityaccelerometermeanY" | average of the mean of the time domain gravity accelerometer signal taken in the Y axial direction.  |
|"avgtimeGravityaccelerometermeanZ" | average of the mean of the time domain gravity accelerometer signal taken in the Z axial direction.  |
|"avgtimebodyaccelerometerjerkmeanX"    | average of the mean of the time domain body accelerometer jerk signal taken in the X axial direction.    |
|"avgtimebodyaccelerometerjerkmeanY"    | average of the mean of the time domain body accelerometer jerk signal taken in the Y axial direction.    |
|"avgtimebodyaccelerometerjerkmeanZ"    | average of the mean of the time domain body accelerometer jerk signal taken in the Z axial direction.    |
|"avgtimebodygyroscopemeanX"    | average of the mean of the time domain body gyroscope signal taken in the X axial direction. |
|"avgtimebodygyroscopemeanY"    | average of the mean of the time domain body gyroscope signal taken in the Y axial direction. |
|"avgtimebodygyroscopemeanZ"    | average of the mean of the time domain body gyroscope signal taken in the Z axial direction. |
|"avgtimebodygyroscopejerkmeanX"    | average of the mean of the time domain body gyroscope jerk signal taken in the X axial direction.    |
|"avgtimebodygyroscopejerkmeanY"    | average of the mean of the time domain body gyroscope jerk signal taken in the Y axial direction.    |
|"avgtimebodygyroscopejerkmeanZ"    | average of the mean of the time domain body gyroscope jerk signal taken in the Z axial direction.    |
|"avgtimebodyaccelerometermagnitudemean"    | average of the mean of the time domain body accelerometer magnitude signal.  |
|"avgtimeGravityaccelerometermagnitudemean" | average of the mean of the time domain gravity accelerometer magnitude signal.  |
|"avgtimebodyaccelerometerjerkmagnitudemean"    | average of the mean of the time domain body accelerometer jerk magnitude signal.  |
|"avgtimebodygyroscopemagnitudemean"    | average of the mean of the time domain body gyroscope magnitude signal.  |
|"avgtbodygyroscopejerkmagnitudemean"   | average of the mean of the time domain body gyroscope jerk magnitude signal.  |
|"avgfrequencybodyaccelerometermeanX"   | average of the mean of the frequency domain body accelerometer signal taken in the X axial direction. |
|"avgfrequencybodyaccelerometermeanY"   | average of the mean of the frequency domain body accelerometer signal taken in the Y axial direction. |
|"avgfrequencybodyaccelerometermeanZ"   | average of the mean of the frequency domain body accelerometer signal taken in the Z axial direction. |
|"avgfrequencybodyaccelerometerjerkmeanX"   | average of the mean of the frequency domain body accelerometer jerk signal taken in the X axial direction.    |
|"avgfrequencybodyaccelerometerjerkmeanY"   | average of the mean of the frequency domain body accelerometer jerk signal taken in the Y axial direction.    |
|"avgfrequencybodyaccelerometerjerkmeanZ"   | average of the mean of the frequency domain body accelerometer jerk signal taken in the Z axial direction.    |
|"avgfrequencybodygyroscopemeanX"   | average of the mean of the frequency domain body gyroscope signal taken in the X axial direction. | 
|"avgfrequencybodygyroscopemeanY"   | average of the mean of the frequency domain body gyroscope signal taken in the Y axial direction. |
|"avgfrequencybodygyroscopemeanZ"   | average of the mean of the frequency domain body gyroscope signal taken in the Z axial direction. |
|"avgfrequencybodyaccelerometermagnitudemean"   | average of the mean of the frequency domain body accelerometer magnitude signal.  |
|"avgfrequencybodyaccelerometerjerkmagnitudemean"   | average of the mean of the frequency domain body accelerometer jerk magnitude signal.  |
|"avgfrequencybodygyroscopemagnitudemean"   | average of the mean of the frequency domain body gyroscope magnitude signal.  |
|"avgfrequencybodygyroscopejerkmagnitudemean"   | average of the mean of the frequency domain body gyroscope jerk magnitude signal.  | 
|"avgtimebodyaccelerometerstdX" | average of the standard deviation of the time domain body accelerometer signal taken in the X axial direction. |
|"avgtimebodyaccelerometerstdY" | average of the standard deviation of the time domain body accelerometer signal taken in the Y axial direction. |
|"avgtimebodyaccelerometerstdZ" | average of the standard deviation of the time domain body accelerometer signal taken in the Z axial direction. |
|"avgtgravityaccelerometerstdX" | average of the standard deviation of the time domain gravity accelerometer signal taken in the X axial direction.  |
|"avgtgravityaccelerometerstdY" | average of the standard deviation of the time domain gravity accelerometer signal taken in the Y axial direction.  |
|"avgtgravityaccelerometerstdZ" | average of the standard deviation of the time domain gravity accelerometer signal taken in the Z axial direction.  |
|"avgtbodyaccelerometerjerkstdX"    | average of the standard deviation of the time domain body accelerometer jerk signal taken in the X axial direction.    |
|"avgtbodyaccelerometerjerkstdY"    | average of the standard deviation of the time domain body accelerometer jerk signal taken in the Y axial direction.    |
|"avgtbodyaccelerometerjerkstdZ"    | average of the standard deviation of the time domain body accelerometer jerk signal taken in the Z axial direction.    |
|"avgtbodygyroscopestdX"    | average of the standard deviation of the time domain body gyroscope signal taken in the X axial direction. |
|"avgtbodygyroscopestdY"    | average of the standard deviation of the time domain body gyroscope signal taken in the Y axial direction. |
|"avgtbodygyroscopestdZ"    | average of the standard deviation of the time domain body gyroscope signal taken in the Z axial direction. |
|"avgtbodygyroscopejerkstdX"    | average of the standard deviation of the time domain body gyroscope jerk signal taken in the X axial direction.    |
|"avgtbodygyroscopejerkstdY"    | average of the standard deviation of the time domain body gyroscope jerk signal taken in the Y axial direction.    |
|"avgtbodygyroscopejerkstdZ"    | average of the standard deviation of the time domain body gyroscope jerk signal taken in the Z axial direction.    |
|"avgtbodyaccelerometermagnitudestd"    | average of the standard deviation of the time domain body accelerometer magnitude signal.  |
|"avgtgravityaccelerometermagnitudestd" | average of the standard deviation of the time domain gravity accelerometer magnitude signal.  |
|"avgtbodyaccelerometerjerkmagnitudestd"    | average of the standard deviation of the time domain body accelerometer jerk magnitude signal.  |
|"avgtbodygyroscopemagnitudestd"    | average of the standard deviation of the time domain body gyroscope magnitude signal.  |
|"avgtbodygyroscopejerkmagnitudestd"    | average of the standard deviation of the time domain body gyroscope jerk magnitude signal.  |
|"avgfrequencybodyaccelerometerstdX"    | average of the standard deviation of the frequency domain body accelerometer signal taken in the X axial direction. |
|"avgfrequencybodyaccelerometerstdY"    | average of the standard deviation of the frequency domain body accelerometer signal taken in the Y axial direction. |
|"avgfrequencybodyaccelerometerstdZ"    | average of the standard deviation of the frequency domain body accelerometer signal taken in the Z axial direction. |
|"avgfrequencybodyaccelerometerjerkstdX"    | average of the standard deviation of the frequency domain body accelerometer jerk signal taken in the X axial direction.    |
|"avgfrequencybodyaccelerometerjerkstdY"    | average of the standard deviation of the frequency domain body accelerometer jerk signal taken in the Y axial direction.    |
|"avgfrequencybodyaccelerometerjerkstdZ"    | average of the standard deviation of the frequency domain body accelerometer jerk signal taken in the Z axial direction.    |
|"avgfrequencybodygyroscopestdX"    | average of the standard deviation of the frequency domain body gyroscope signal taken in the X axial direction. | 
|"avgfrequencybodygyroscopestdY"    | average of the standard deviation of the frequency domain body gyroscope signal taken in the Y axial direction. |
|"avgfrequencybodygyroscopestdZ"    | average of the standard deviation of the frequency domain body gyroscope signal taken in the Z axial direction. |
|"avgfrequencybodyaccelerometermagnitudestd"    | average of the standard deviation of the frequency domain body accelerometer magnitude signal.  |
|"avgfrequencybodyaccelerometerjerkmagnitudestd"    | average of the standard deviation of the frequency domain body accelerometer jerk magnitude signal.  |  
|"avgfrequencybodygyroscopemagnitudestd"    | average of the standard deviation of the frequency domain body gyroscope magnitude signal.  |
|"avgfrequencybodygyroscopejerkmagnitudestd"    | average of the standard deviation of the frequency domain body gyroscope jerk magnitude signal.  | 
