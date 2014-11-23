run_analysis <- function(){
	# Read raw data and write into a data frame
	Xtrain <- read.table("./train/X_train.txt")
	ytrain <- read.table("./train/y_train.txt")
	subj_train <- read.table("./train/subject_train.txt")

	Xtest <- read.table("./test/X_test.txt")
	ytest <- read.table("./test/y_test.txt")
	subj_test <- read.table("./test/subject_test.txt")
	
	features <- read.table("./features.txt")
	act_labels <- read.table("./activity_labels.txt")

	# 1. Merge training and test sets to create one data set.
	Xtotal <- rbind(Xtrain, Xtest)
	ytotal <- rbind(ytrain, ytest)
	subj_total <- rbind(subj_train, subj_test)
	colnames(subj_total) <- c("Subject")
	
	colnames(features) <- c("#","Feature") # for labeling
	features$Feature <- gsub("\\()","",features$Feature)
	f <- features$Feature	# for labeling
	colnames(Xtotal) <- f

	# 3. Uses descriptive activity names to name the activities in the data set. 
	ytotal$V2 <- "WALKING"
	ytotal$V2[ytotal$V1 == 2] <- "WALKING_UPSTAIRS"
	ytotal$V2[ytotal$V1 == 3] <- "WALKING_DOWNSTAIRS"
	ytotal$V2[ytotal$V1 == 4] <- "SITTING"
	ytotal$V2[ytotal$V1 == 5] <- "STANDING"
	ytotal$V2[ytotal$V1 == 6] <- "LAYING"
	colnames(ytotal) <- c("Act#","Activity")

	# 4. Appropriately labels the data set with variable names.
	#  1) Column names are set in #1.
	#  2) Below sets the Row names.
	x <- cbind(subj_total, ytotal$Activity, Xtotal)  # set column names by cbinding (subject and activity)
	colnames(x)[2] <- "Activity"

	# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
	meanloc <- grep("mean",features$Feature)
	Xmean <- Xtotal[,meanloc]  # 10299x46 mean measurement
	
	stdloc <- grep("std",features$Feature)
	Xstd <- Xtotal[,stdloc] # 10299x33 stdev measurement
	
	# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each activity and each subject.
	mean_subj_act <- cbind(subj_total, ytotal$Activity, Xmean)
 	colnames(mean_subj_act)[2] <- "Activity"
	write.table(mean_subj_act,file="./tidydata.txt", row.name=FALSE)

	# Print other result on the screen
	x	# Entire dataframe X (train & test) with col and row names

}