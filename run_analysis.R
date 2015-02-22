
## Download Files ####
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./Samsung.zip")
unzip("Samsung.zip")

## Reading Files ####
## Read in the variable descriptions
featuresfile <- "UCI HAR Dataset//features.txt"
featuresDS <- read.table(featuresfile)
featuresDS <- select(featuresDS, activity=V2)
features <- t(featuresDS)
## Read in the two files, using the vecor "features" to assign activity names to the variables
testfile <- "UCI HAR Dataset//test//X_test.txt"
trainfile <- "UCI HAR Dataset//train//X_train.txt"
TestDS <- read.table(testfile, col.names=features)
TrainDS <- read.table(trainfile, col.names=features)

## Step 1 ####
## Merge the training and the test sets to create one data set.
CombinedDS <- rbind(TestDS, TrainDS)

## Step 2 ####
## Extract only the measurements on the mean and standard deviation for each measurement. 
meancolumns <- grep("mean", names(CombinedDS), value = TRUE)
sdcolumns <- grep("std", names(CombinedDS), value = TRUE)

subsetDS <- CombinedDS[,c(meancolumns,sdcolumns)]

## Step 3 ####
## Use descriptive activity names to name the activities in the data set
# See "Reading Files"

## Step 4 ####
## Appropriately label the data set with descriptive variable names. 
# See "Reading Files"

## Step 5 ####
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
calcDS <- data.frame(mean=colMeans(CombinedDS))
