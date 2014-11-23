Getting-and-Cleaning-Data-Final-Project
=======================================
This is a README file for the Final Project of the Johns Hopkins Data Science course on Coursera, Getting and Cleaning Data.
This file describes how the script works.

Scrript does the following:

1. Merges the training and the test sets to create one data set.
 - rbind of (Xtrain, Xtest)->Xtotal and of (ytrain, ytest)->ytotal

2. Extracts only the measurements on the mean and standard deviation for each measurement.
 - grep to find location(index) of mean & standard deviation
 - Extract those columns from Xtotal -> Xmean, Xstd

3. Uses descriptive activity names to name the activities in the data set. 
 - create a second column to ytotal with default "WALKING"
 - replace the label correspondingly to each number (1~6)

4. Appropriately labels the data set with variable names.
 - Set table headers using features.
 - Set column names by cbinding (subject and activity)

5. From the data set in step 4, creates a second, independent tidy data set with the average of each activity and each subject.
 - cbind column for Subject and column for Activity column with Xmean data frame
