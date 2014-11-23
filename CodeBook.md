Getting-and-Cleaning-Data-Final-Project (Code Book)
=======================================
This is a Code Book for the Final Project of the Johns Hopkins Data Science course on Coursera, Getting and Cleaning Data.
This file describes the variables, the data, and any transformation done to clean up the data.

* The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
* The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

* Below are the data files.

 - 'features.txt'(561x2): List of all features.
 - 'activity_labels.txt': Links the class labels with their activity name.(6 activities)
 - 'train/X_train.txt'(7352x561): Training set.
 - 'train/y_train.txt'(7352x1): Training labels.
 - 'train/subject_train.txt'(7352x1): Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
 - 'test/X_test.txt'(2947x561): Test set.
 - 'test/y_test.txt'(2947x1): Test labels. 
 - 'test/subject_test.txt'(2947x1): Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* The following files are available for the train and test data. Their descriptions are equivalent. 

 - 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
 - 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
 - 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

* Raw Data and/or Variables

 - Xtrain: 7352x561 data frame, measurement of 561 features for 7352 subjs/activities
 - ytrain: 7352x1 data frame, representing different activities (1~6)
 - subj_train: 7352x1 data frame, identifying who performed the activities
 - Xtest: 2947x561 data frame, measurement of 561 features for 2947 subjs/activities
 - ytest: 2947x1 data frame, representing different activities (1~6)
 - subj_test: 2947x1 data frame, identifying who performed the activities	
 - features: 561x2 data frame, list of all measurement features
 - act_labels: 6 class labels with their activity name.

* Transformed data as part of the project component.
 - Merge training and test sets to create one data set.
   - Xtotal: from rbind(Xtrain, Xtest)
    - ytotal: from rbind(ytrain, ytest)

 - Extracted measurements on the mean and standard deviation for each measurement.
   - colnames(features): give column names to features, c("v1","v2")
    - meanloc: index for mean, grep("mean",features$v2)
    - Xmean: data frame of mean measurement(10299x49), Xtotal[,meanloc]
    - stdloc: index for stdev, grep("std",features$v2)
    - Xstd: data frame of stdev measurement(10299x33), Xtotal[,stdloc]
  
 - Uses descriptive activity names to name the activities in the data set.
   - ytotal: created a second column with descriptive activity names that correspond to each number.

 - Appropriately labels the data set with variable names.
   - Set table headers using features.
    - Set column names by cbinding (subject and activity)

 - From the data set in step 4, creates a second, independent tidy data set with the average of each activity and each subject.
   - mean_subj_act: cbind Subject column, Activity column with Xmean data frame
    - x: entire X data frame with Subject column and Activity column
    - tidydata.txt: output text file of the mean_subj_act table

