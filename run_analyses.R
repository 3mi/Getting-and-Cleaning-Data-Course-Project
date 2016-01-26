# Link to information
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Import the dplyr library
library(dplyr)

# 1. Merges the training and the test sets to create one data set.
# Read in the X training dataset
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Read in the training labels
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Read in the training subject dataset
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Merge test training datasets into a single dataframe
train <- data.frame(trainSubject, trainLabel, trainData)

# Read in the X test dataset
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Read in the test labels
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt") 

# Read in the test subject dataset
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Merge the test datasets into a single dataframe
test <- data.frame(testSubject, testLabel, testData)

# Combine the training and test running datasets
Total_dataset <- rbind(train, test)
CleanedData <- Total_dataset

# Make the column names
features <- read.table("./UCI HAR Dataset/features.txt")
# Column names into vector
column.names <- as.vector(features[, 2])
# running columnnames on dataset
colnames(CleanedData) <- c("subject_id", "activity", column.names)
#forcing unique column names with valid characters
valid_column_names <- make.names(names=names(CleanedData), unique=TRUE, allow_ = TRUE)
colnames(CleanedData) <- valid_column_names

# Select the columns subject_id, activity and the columns that contain 
#mean or standard deviations.
CleanedData <- select(CleanedData, contains("subject"), contains("activity"),
                   contains("mean.."), contains("std.."), -contains("angle"))
# remove "()"
#names(CleanedData) <- gsub("\\(\\)", "", names(CleanedData)) 
# remove "." in column names
names(CleanedData) <- gsub("\\.", "", names(CleanedData))  
#Lowercase variables
names(CleanedData) <- tolower(names(CleanedData))

# 3. Uses descriptive activity names to name the activities in 
# the data set
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
#activityLabel <- activity[joinLabel[, 1], 2]
CleanedData$activity <- as.character(activity[
        match(CleanedData$activity, activity$V1), 'V2'])

# 4. Appropriately labels the data set with descriptive activity 
# names. 
write.table(CleanedData, "CleanedData.txt") # write out the 1st dataset

# 5. Creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject. 
CleanedDataSummary <- CleanedData %>%
        group_by(subject_id, activity) %>%
        summarise_each(funs(mean))

write.table(CleanedDataSummary, "CleanedDataSummary.txt") # write out the 2nd dataset