# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project

This file describes how run_analysis.R script works.

## Unzip the data
Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

## Directory unzipped file and run_analysis.R
Make sure the unzipped file and the run_analysis.R script are both in the current working directory.


There are two output txt-files generated in the current working directory:
* CleanedData.txt: it contains a data frame called cleanedData with 10299*68 dimension.
* CleanedDataSummary.txt: it contains a data frame called result with 180*68 dimension.


## Loading summary data in R 
* data <- read.table("CleanedDataSummary.txt") command in RStudio to read the file. The file contains the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.

