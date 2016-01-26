# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project

Getting and Cleaning Data Course Project

This file describes how run_analysis.R script works.

## Loading the data
* First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

* Make sure the unzipped file and the run_analysis.R script are both in the current working directory.

* Second, you will find two output files are generated in the current working directory:
        CleanedData.txt: it contains a data frame called cleanedData with 10299*68 dimension.
        CleanedDataSummary.txt: it contains a data frame called result with 180*68 dimension.

* Finally, use data <- read.table("CleanedDataSummary.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.

