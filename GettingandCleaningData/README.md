
## Getting and Cleaning Data JHU Coursera Project - Readme.Md

# Latha Vankeepuram

This Repo has been created to submit the course project for Getting and Cleaning Data course.

## Overview

This project serves to demonstrate the collection, cleaning and to create a tidy data set that can be used for subsequent analysis. 

The data used for this project was collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description of the data is available at the site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the course project is available in zipped version at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Project Summary

The following is a summary description of the project instructions -

A R script called run_analysis.R is created that does the following: 

1. Merges the training and the test data sets to create one data set. 

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set 

4. Appropriately labels the data set with descriptive variable names. 

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Notes to run the run_analaysis.R script

1. You need to **install package plyr** in order to run this script

2. run_analysis.R script generates tidydata.txt that contains the tidy data set

## Additional Information

1. CodeBook.md - This file provides additional information about the data used, transformations and the final variables in the tidy data set

2. run_analysis.R - This file has  the R code to collect, merge, transform and generate tidy data set

3. tidydata.txt - Final output that contains the tidy data set