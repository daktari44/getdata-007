## Getting and Cleaning Data: Course Project
## *NB: This analysis was performed on a Windows 7 64-bit comp[uter using RStudio Version 0.98.977 with R version 3.1.1.* 


## 1. Download and unzip the dataset into the current working directory
datasource <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
if(!file.exists("./data")){dir.create("./data")}
download.file(datasource, destfile = "./data/Dataset.zip", method = "auto", mode= "wb")
unzip("./data/Dataset.zip")            

## 2. Read the data files into meomory to create the training and test datasets

      ## create a list of the contents of each folder within the dataset folder
mainfolder <- list.files(path = "./UCI HAR Dataset", full.names = TRUE)
testfolder <- list.files(path = "./UCI HAR Dataset/test", full.names = TRUE)
trainfolder <- list.files(path = "./UCI HAR Dataset/train", full.names = TRUE)

     ## read activitylabels and features data
activitylabels <- read.table(mainfolder[1], stringsAsFactors = FALSE)[,2]
features <- read.table(mainfolder[2], stringsAsFactors = FALSE)[,2]

     ## read, correct and label test data 
subjecttest <- read.table(testfolder[2], stringsAsFactors = FALSE, col.names = "subject")
xtest <- read.table(testfolder[3], stringsAsFactors = FALSE, col.names = features)
ytest <- read.table(testfolder[4], col.names = "activity", colClasses = "factor")
levels(ytest$activity) <- activitylabels
test <- cbind(subjecttest, ytest, xtest)
rm(subjecttest, xtest, ytest)

    ## read, correct and label training data
subjecttrain <- read.table(trainfolder[2], stringsAsFactors = FALSE, col.names = "subject")
xtrain <- read.table(trainfolder[3], stringsAsFactors = FALSE, col.names = features)
ytrain <- read.table(trainfolder[4], col.names = "activity", colClasses = "factor")
levels(ytrain$activity) <- activitylabels
train <- cbind(subjecttrain, ytrain, xtrain)
rm(subjecttrain, xtrain, ytrain)


## 3. Merge the test and training data into one dataset
traintest <- rbind(train, test)
rm(train, test, activitylabels, features, mainfolder, testfolder, trainfolder)


## 4. Extract the mean and std deviation values for each measurement to create the new dataset
library(dplyr)
subtt <- select(traintest, 1:2, contains("mean"), -contains("angle"), -contains("meanFreq"), contains("std"))  
avgtraintest <- subtt %>%
      group_by(subject, activity) %>%
      summarise_each(funs(mean))

## 5. edit the variable names
amend <- names(avgtraintest)[3:38]
amend <- gsub("BodyBody", "body", amend)
amend <- gsub("Acc", "accelerometer", amend)
amend <- gsub("Gyro", "gyroscope", amend)
amend <- gsub("Mag", "magnitude", amend)
amend <- sub("B", "b", amend)
amend <- sub("J", "j", amend)
amend <- sub("G", "g", amend)
amend <- gsub(".", "", amend, fixed = TRUE)
amend <- sub("f", "frequency", amend)
amend[c(1:19, 34:36)] <- sub("t", "time", amend[c(1:19, 34:36)])
amend <- paste0("avg", amend)

colnames(avgtraintest[3:68]) <- amend
rm(amend, traintest, subtt)


## 6. save the tidy data file to the working directory
write.table(avgtraintest, file = "avgHARtidy.txt", row.name = FALSE)
