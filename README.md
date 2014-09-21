gettingData
===========

Course Project for "Getting and Cleaning Data"

The run_analysis.R script, as commented in the file, does:

1. reads 3 components for both testing and training data from the corresponding "./test" and "./train" directories. 
  
    1. X file (X_Train.txt, X_Test.txt) containing 561 columns of data
    2. Y file (x_train.txt, y_train.txt) containing codes describing the activity (SITTING, WALKING, etc).
    3. subject file (subject_train.txt, subject_test.txt) containing a number (1-30) of the subject (i.e. person) for the data

2. reads 2 common components used with both the testing and training data. 
    1. activity_labels (./activity_labels.txt) contains the labels (SITTING, WALKING, etc) corresponding to the numeric code in the Y files.
    2. features (./features.txt) contains the names corresponding to the columns in the X files.

3. sets various heading names
    1. Puts "Activity" for the name of the column in the activity_lavels data
    2. Puts "Subject" for the name of the column in the Y files.
    3. Sets the names of the columns for the X files to be the features, cleaned up in a few ways:
         1. removed brackets
         2. Expanded Acc and Gyro to Accelerometer and Gyroscope
	 3. Changed leading "f" and "t" to Frequency and Time
         4. removed commas and dashes, while upper-casing the letter immediately following, so that the names are all CamelCased.

4. column-binds the X, Y and subject files for both test and training data

5. row-binds the test and training data into 1 data set

6. converts the activity table from a number to a descriptive label using the activity_labels data

7. Extracts any columns containing the text "mean" into a new table. 

8. Extracts any column containing the text "std" into a new table. 

9. Combines the "mean" and "std" tables into one with "cbind" (column bind). Fixed up the Subject and Activity names, because they included  the table name from the previous data set ("data_full$Subject" instead of "Subject").

10. Calculates the means of the mean_and_std table, group by distinct values of "subject" and "activity" column.

