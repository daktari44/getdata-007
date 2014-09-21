## Getting and Cleaning Data - Course Project

### Introduction

#### Project objectives:
* Demonstrate ability to collect, work with, and clean a data set.
* The goal is to prepare tidy data that can be used for later analysis.
To meet the project objectives. we are asked to provide a script that does the following: 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### Summary information on the data
This project used data from the Human Activity Recognition Using Smartphones Dataset (Version 1.0). A full description of the experiment can be found at this site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The downloaded data folder contained the following files:
- *'README.txt'* : provides summary information about the experiment
- *'features_info.txt'*: Shows information about the variables used on the feature vector.
- **'features.txt'**: List of all features .
- **'activity_labels.txt'**: Links the class labels with their activity name.
- **'train/X_train.txt'**: Training set.
- **'train/y_train.txt'**: Training labels.
- **'test/X_test.txt'**: Test set.
- **'test/y_test.txt'**: Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- **'train/subject_train.txt'**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element     vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
The italicized and bold files were the ones selected for use in developing the tidy data set as part of this project.

### Summary of The Data Cleaning Process
The 'run_analysis.R' script consists of the programmatic steps taken in the data cleaning process. It covers all the required steps listed in the project objectives though not necessarily in the order specified above. This code should produce the submitted tidy data set if it is run from the same folder as that which contains the dataset. The script is divided into several sections consistent with the overall objectives of the assignment:

##### 1. Download and unzipping of the dataset into the working directory 
This was achieved by:
* assigning the URL linking to the dataset to an r object (called 'datasource' in this script)
* testing for and create if needed a data folder into which the dataset will be saved (this is not an essential step but it does help in keeping the original dataset seperate from the main working folder)
* downloading dataset to the data folder using the download.file() function.
   - the parameters used were the 'datasource' object for the download URL, and the destination path to the data folder in the step above
   - as the actions were performed on a windows computer, the method was set to "auto". This should be changed to "curl" for Mac computers.
   - as the downloaded files are binary, the mode was set to "wb"  
- unzipping the downloaded dataset into the main working memory using the unzip() function.
   - This step creates a data folder "UCI HAR Dataset" in the working directory
After the download, a review of the included README.txt file and a visual inspection of the downloaded files using Notepad ++ was done. This helped identify the different files in the dataset and which ones would be required to answer the fulfil the project objectives.

##### 2. Read data files into memory to create the training and test datasets.
The script achieves this in four stages:
* uses the list.files() function to create three temporary objects that list the files and folders in the main data folder, and in the test and training folders.
   - the two files each have two columns with the first column appearing to be a numbered id column
   - therefore, for both files, only the second column is read to create two character vectors called 'activitylabels' and 'features' respectively.
* to create the training and test datasets, two similar chunks of code are included. The code for creating the training dataset is copied below. The steps is the code are:
   - the single column subject data is first read and assigned to a dataframe object. While reading the data, the column is renamed 'subject'.
   - the 'x' files containing the experiment variable values are read into memory and assigned to named dataframe objects
   - the single column 'y' files containing the activity values are read into memory and assigned to dataframe objects. While reading the data, the column is renamed 'activity' and the column class specified as 'factor', with levels 1 - 6.
   - the activity values in the 'y' datasets are assigned descriptive names using the 'activitylabels' vector that was created earlier
   - the subject, 'y' activity files, and 'x' value files are merged to create the seperate 'test' and 'train' dataframes.
```r 
subjecttest <- read.table(testfolder[2], stringsAsFactors = FALSE, col.names = "subject")
xtest <- read.table(testfolder[3], stringsAsFactors = FALSE, col.names = features)
ytest <- read.table(testfolder[4], col.names = "activity", colClasses = "factor")
levels(ytest$activity) <- activitylabels
test <- cbind(subjecttest, ytest, xtest)
rm(subjecttest, xtest, ytest)
```
* finally the intermediate files are removed. At the end of this section, two data frames representing the training and test datasets remain.

##### 3. Merge the training and test datasets into one dataset
The training and datasets are merged together, using the rbind() function, and the remaining intermediate datasets removed.
```r 
traintest <- rbind(train, test)
rm(train, test, activitylabels, features)
```
At the end of this section, only the combined training and test dataset, with 10299 observations of 563 variables, remains. 

##### 4. Extract the mean and standard deviation values for each measurement to create the new dataset
The dplyr package is used to extract the desired columns and create the new dataset with the average of each variable for each activity and each subject.
```r 
library(dplyr)
subtt <- select(traintest, 1:2, contains("mean"), -contains("angle"), -contains("meanFreq"), contains("std"))  
avgtraintest <- subtt %>%
      group_by(subject, activity) %>%
      summarise_each(funs(mean))
```

##### 5. Edit the variable names of the merged dataset to improve readability
Using the sub() and gsub() functions, the variable names are edited by:
* Removing the () and - symbols
* Expanding all of the abbreviations
* Replacing the t and f with Time and Frequency, respectively
* correcting any additional spelling errors
All the remaining intermediate datasets and objects are removed and only the final merged dataset left in memory.

##### 6. Save the tidy data set
The final line of the run_analysis.R script uses the write.table() function to save the final dataset into the working directory.

### Discussion
As part of this data cleaning process, several decisions were made determining what was used and what was left out in the analysis. Included in these decisions are the following:
* as the assignment was aimed at creating a final dataset that calculated average of the mean and standard deviation values that had previously been calculated and stored in the X_train.txt and X_test.txt files, there was no need to delve into the primary files from which these values were created (i.e. the data files stored in the 'Inertial Signals' folders. These folders were therefore omitted from the analysis.
* For consistency, only the variables representing the "mean(): Mean value" and "std(): Standard deviation" as specified in the 'features_info.txt' file were included in this dataset. 
   - the meanFreq() variables were removed as they did not have a complementary standard deviation measure (the corresponding variable is likely the skewness() variable that was in the dataset was as this was not requested it was not included).
   - the angles variables were calculated by taking the measurements between mean vectors which already exist in the other variables, i.e. mean vector = (measure-mean()-X,measure-mean()-Y,measure-mean()-Z. They therefore did not measure the mean in the same sense as the mean() variables and as was the case with the meanFreq() variables they did not have the complementary standard deviation measures and were therefore left out as well.
* in editing the variable names for the final dataset, one abbreviation and one upper case element were not changed.
   - the standard deviation abbreviation 'std' was left as is. This is abbreviation is widely recognized in statistics and it was felt that retaining it as is did not interfere with the readability of the variable name, and prevented the creation of an unnecessarily long variable name.
   - the capital 'XYZ' characters used to denote 3-axial signals in the X, Y and Z directions were left as is to avoid confusing them with parts of the preceding words.
   - an 'avg' prefix was added to the variable names to distinguish them from those in the raw data files and emphasis that these were an average of each value. This prefix is also widely recognized as an abbreviation for average and was retained as is to prevent the creation of a long variable name.
* as explained in the 'README.txt' file that was included in the data folder, the values included in the dataset were normalized, therefore there are no corresponding units of measurement.
* Finally, it was determined that to meet the purposes of this project, a wide form of the dataset was the best fit. This is because:
   - the variables being used are not the original observed values but were calculated from these initial observations. The variable names reflected the composite nature of this calculation.
   - creating a long form of the dataset by trying to separate out the different components, resulted in alot of NA values, a classic symptom of an untidy dataset. The wide form of the dataset was therefore retained.


*NB: This analysis was performed on a Windows 7 64-bit computer using RStudio Version 0.98.977 with R version 3.1.1.* 
