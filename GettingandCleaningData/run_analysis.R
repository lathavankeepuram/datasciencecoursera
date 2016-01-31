### *****************************************************************************************************************************************************
## 	Author: 	Latha Vankeepuram
##
## 	Date: 		01-30-2016
##
##	Title:		Coursera JHU - Getting and Cleaning Data Course Project
##
## 	Purpose:	This R script can be used to collect, clean and transform data to create a tidy set that can be used for further analysis. 
## 			The data used in this script is collected from the accelerometers from the Samsung Galaxy S smartphone.	
##			
##	Summary:	The following tasks are accomplished by the R code below:
##			1. 	UCI HAR Dataset is downloaded from 
##				https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##
## 			2. 	Training and Test data sets are merged to create one data set
##
## 			3. 	Only the variables that involves the mean and standard deviation for the measurement is extracted/subsetted. 
## 		
##			4. 	Descriptive activity names are used to name the activities in the data set
##
##			5. 	The variable names in the data set are appropriately named with descriptive names. 
##
##			6. 	A second, independent tidy data set with the average of each variable for each activity and each subject is created 
### ****************************************************************************************************************************************************   

### Get the Data

		setwd("~/CourseraDataScience/GettingandCleaningData")

		if(!file.exists("./data")){dir.create("./data")}

		fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

		download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

	## Unzipping the file

		unzip(zipfile ="./data/Dataset.zip",exdir="./data")
	
	## There is new directory created UCI HAR Dataset
	## Getting all the files
	## Files of interest are training, test, subject,activity,features. All files in Inertial Signals folder are NOT USED


		filepath	<- file.path("./data" , "UCI HAR Dataset")
	
		files		<-list.files(filepath, recursive=TRUE)
	
		files
	
### Reading the training  and test dataset

	## Activity Type related  training and test data

		activitytypetrain <- read.table(file.path(filepath, "train", "Y_train.txt" ),header = FALSE)

		activitytypetest  <- read.table(file.path(filepath, "test", "Y_test.txt" ),header = FALSE)

	## Subject related training and test data

		subjecttrain 	<- read.table(file.path(filepath, "train", "subject_train.txt" ),header = FALSE)
	
		subjecttest 	<- read.table(file.path(filepath, "test", "subject_test.txt" ),header = FALSE)
	
	## Activity Measurement

		activitymeasuretrain <- read.table(file.path(filepath, "train", "X_train.txt" ),header = FALSE)
		
		activitymeasuretest  <- read.table(file.path(filepath, "test", "X_test.txt" ),header = FALSE)

### Examine the data sets loaded

	## Observation - All the data sets do not have valid variable names

		str(activitytypetrain)

		str(activitytypetest)

		str(subjecttrain)

		str(subjecttest)

		str(activitymeasuretrain)

		ncol(activitymeasuretrain)

		str(activitymeasuretest)
	
		ncol(activitymeasuretest)
	
	

### Merging the training and test data sets and adding valid variable names to the merged data set

	## Merge train and test data

		subject 	<- rbind(subjecttrain, subjecttest)

		activitytype 	<- rbind(activitytypetrain, activitytypetest)

		activitymeasure	<- rbind(activitymeasuretrain, activitymeasuretest)

	## Adding variable names

		colnames(subject)[1]		<- "subject"

		colnames(activitytype)[1] 	<- "activitytype"
		
		featurelist       		<- read.table(file.path(filepath, "features.txt"),head=FALSE, stringsAsFactor = FALSE)

		str(featurelist)


	##Adding variable names to activitymeasure dataset

		for(i in 1:nrow(featurelist)){ colnames(activitymeasure)[i] <- featurelist[i,2]}

		colnames(activitymeasure)

	## Merging to form ONE Data set

		combinedata <- cbind(subject,activitytype,activitymeasure)	
	
		str(combinedata)

### Extracting only measurements that are mean or standard deviation- only variable names with mean() and std() are subsetted

		combinedata <-  combinedata[,grep( "subject|activitytype|-mean\\()|-std\\()" , names(combinedata ) , value = TRUE)]

		str(combinedata)

### Using descriptive activity name for activitytype variable - example 5 is for "STANDING" etc..

		activitylist <- read.table(file.path(filepath,"activity_labels.txt"), head =FALSE, stringsAsFactors = FALSE)

		for(i in 1:nrow(activitylist)){ combinedata$activitytype[combinedata$activitytype == activitylist$V1[i]] <- activitylist$V2[i] }

### Labeling the variables with appropriate descriptive variable names

		names(combinedata)	<-gsub("^t", "time", names(combinedata))

		names(combinedata)	<-gsub("^f", "frequency", names(combinedata))

		names(combinedata)	<-gsub("Acc", "accelerometer", names(combinedata))

		names(combinedata)	<-gsub("Gyro", "gyroscope", names(combinedata))

		names(combinedata)	<-gsub("Mag", "magnitude", names(combinedata))

		names(combinedata)	<-gsub("BodyBody", "body", names(combinedata))

		names(combinedata)  	<-gsub("Body", "body", names(combinedata))

		names(combinedata)  	<-gsub("Gravity", "gravity", names(combinedata))

		names(combinedata)  	<-gsub("Jerk", "jerk", names(combinedata))

		names(combinedata) 	<-gsub("-mean\\(\\)-X", "XaxisMean", names(combinedata))

		names(combinedata) 	<-gsub("-mean\\(\\)-Y", "YaxisMean", names(combinedata))

		names(combinedata) 	<-gsub("-mean\\(\\)-Z", "ZaxisMean", names(combinedata))

		names(combinedata) 	<-gsub("-std\\(\\)-X", "XaxisStd", names(combinedata))

		names(combinedata) 	<-gsub("-std\\(\\)-Y", "YaxisStd", names(combinedata))

		names(combinedata) 	<-gsub("-std\\(\\)-Z", "ZaxisStd", names(combinedata))

		names(combinedata) 	<-gsub("-mean\\(\\)", "Mean", names(combinedata))

		names(combinedata) 	<-gsub("-std\\(\\)", "Std", names(combinedata))


### Creating a second tidy data set grouping by subject and activitytype and getting mean of each variable in combinedata data frame

		library(plyr)

		tidydata		<-aggregate(. ~subject + activitytype, combinedata, mean)

		tidydata		<-tidydata[order(tidydata$subject,tidydata$activitytype),]

		write.table(tidydata, file = "tidydata.txt",row.name=FALSE)


