
# CodeBook.md

## Overview

This file contains details about the data, transformations on the data and the variables of the final tidy data set

## Data Description

Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 

wearing a smartphone (Samsung Galaxy S II) on the waist. 

Using the embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets.

Data from 70% of the volunteers was selected for generating the training data and from 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows 

of 2.56 sec and 50% overlap (128 readings/window). 

The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter 

into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 

From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For additional Dataset details refer to - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Dataset used for this project refer to - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Cleaning and Transformation of Data

The files that were used for this project from the UCI data set are -

	1. X_train.txt
	2. Y_train.txt
	3. X_test.txt
	4. Y_test.txt
	5. subject_train.txt
	6. subject_test.txt
	7. activity_labels.txt
	8. features.txt

# Data Transformation and creation of Tidy data set

	1. Data from X_train.txt and X_test.txt were merged.
	2. Data from subject_train.txt and subject_test.txt were merged and a variable name "subject" was created
	3. Data from Y_train.txt and Y_test.txt were merged and variable name "activitytype" was created
	4. Using feature names  listed in features.txt, the variable names for combined data set in step 1 is created
	5. Merge data sets from step 2,3 and 4
	6. Activitytype variable in the data set from step 5 is changed to descriptive activity using data from activity_labels.txt
	7. Extract only variables - subject, activitytype and  names of variables that have mean() and std() in their variable name
	8. Variable names are cleaned to make the names  descriptive, all lower case and remove characters like - () etc.
	9. A second tidy data set is created by grouping by subject and activitytype and getting mean of each variable
	10. Tidydata.txt is  created

## Description of variables  in the tidydata.txt

	Subject: 	**Integer**- subject ID

	Activity: 	**String** - activity name:
			Walking
			Walking Upstairs
			Walking Downstairs
			Sitting
			Standing
			Laying

	Activity Measurements : Total **66 variables**, all values are **floating point numbers**

	**Variables  that have time in their names have units Seconds, frequency in their name unit is Hz (hertz)**
	
	All the  **66 variables** described below **contain Mean value** of that measurement **for each subject, activitytype group**

	Mean indicates **Mean** and Std in the name indicates **Standard Deviation**

	Time domain body acceleration mean along X, Y, and Z:

		timebodyacclerationXaxisMean
		timebodyacclerationYaxisMean
		timebodyacclerationZaxisMean

	Time domain body acceleration standard deviation along X, Y, and Z:

		timebodyacclerationXaxisStd
		timebodyacclerationYaxisStd
		timebodyacclerationZaxisStd

	Time domain gravity acceleration mean along X, Y, and Z:

		timegravityacclerationXaxisMean
		timegravityacclerationYaxisMean
		timegravityacclerationZaxisMean

	Time domain gravity acceleration standard deviation along X, Y, and Z:

		timegravityacclerationXaxisStd
		timegravityacclerationYaxisStd
		timegravityacclerationZaxisStd

	Time domain body accleration jerk mean along X, Y, and Z:

		timebodyacclerationjerkXaxisMean
		timebodyacclerationjerkYaxisMean
		timebodyacclerationjerkZaxisMean

	Time domain body jerk standard deviation along X, Y, and Z:

		timebodyacclerationjerkXaxisStd
		timebodyacclerationjerkYaxisStd
		timebodyacclerationjerkZaxisStd

	Time domain gyroscope mean along X, Y, and Z:
		
		timebodygyroscopeXaxisMean
		timebodygyroscopeYaxisMean
		timebodygyroscopeZaxisMean

	Time domain gyroscope standard deviation along X, Y, and Z:

		timebodygyroscopeXaxisStd
		timebodygyroscopeYaxisStd
		timebodygyroscopeZaxisStd

	Time domain gyroscope jerk mean along X, Y, and Z:

		timebodygyroscopejerkXaxisMean
		timebodygyroscopejerkYaxisMean
		timebodygyroscopejerkZaxisMean

	Time domain gyroscope jerk standard deviation along X, Y, and Z:

		timebodygyroscopejerkXaxisStd
		timebodygyroscopejerkYaxisStd
		timebodygyroscopejerkZaxisStd

	Time domain body acceleration magnitude mean:
		
		timebodyacclerationmagnitudeMean
	
	Time domain body acceleration magnitude standard deviation:

		timebodyacclerationmagnitudeStd

	Time domain gravity acceleration magnitude mean:

		timegravityacclerationmagnitudeMean

	Time domain gravity acceleration magnitude standard deviation:
	
		timegravityacclerationmagnitudeStd

	Time domain body jerk magnitude mean:

		timebodyacclerationjerkmagnitudeMean

	Time domain body jerk magnitude standard deviation:

		timebodyacclerationjerkmagnitudeStd

	Time domain gyroscope magnitude mean:

		timebodygyroscopemagnitudemean

	Time domain gyroscope magnitude standard deviation:

		timebodygyromagnitudeStd

	Time domain gyroscope jerk magnitude mean:

		timebodygyrojerkmagnitudeMean

	Time domain gyroscope jerk magnitude standard deviation:
	
		timebodygyrojerkmagnitudeStd

	Frequency domain body acceleration mean along X, Y, and Z:

		frequencybodyacclerationXaxisMean
		frequencybodyacclerationYaxisMean
		frequencybodyacclerationZaxisMean

	Frequency domain body acceleration standard deviation along X, Y, and Z:

		frequencybodyacclerationXaxisStd
		frequencybodyacclerationYaxisStd
		frequencybodyacclerationZaxisStd

	Frequency domain body jerk mean along X, Y, and Z:

		frequencybodyacclerationjerkXaxisMean
		frequencybodyacclerationjerkYaxisMean
		frequencybodyacclerationjerkZaxisMean

	Frequency domain body jerk standard deviation along X, Y, and Z:

		frequencybodyacclerationjerkXaxisStd
		frequencybodyacclerationjerkYaxisStd
		frequencybodyacclerationjerkZaxisStd

	Frequency domain gyroscope mean along X, Y, and Z:
		
		frequencybodygyroscopeXaxisMean
		frequencybodygyroscopeYaxisMean
		frequencybodygyroscopeZaxisMean

	Frequency domain gyroscope standard deviation along X, Y, and Z:

		frequencybodygyroscopeXaxisStd
		frequencybodygyroscopeYaxisStd
		frequencybodygyroscopeZaxisStd

	Frequency domain body acceleration magnitude mean:

		frequencybodyacclerationmagnitudeMean
	
	Frequency domain body acceleration magnitude standard deviation:

		frequencybodyacclerationmagnitudeStd

	Frequency domain body jerk magnitude mean:

		frequencybodyacclerationjerkmagnitudeMean

	Frequency domain body jerk magnitude standard deviation:

		frequencybodyacclerationjerkmagnitudeStd

	Frequency domain gyroscope magnitude mean:
		
		frequencybodygyroscopemagnitudeMean

	Frequency domain gyroscope magnitude standard deviation:

		frequencybodygyroscopemagnitudeStd

	Frequency domain gyroscope jerk magnitude mean:
		
		frequencybodygyroscopejerkmagnitudeMean

	Frequency domain gyroscope jerk magnitude standard deviation:

		frequencybodygyroscopejerkmagnitudeStd
	

