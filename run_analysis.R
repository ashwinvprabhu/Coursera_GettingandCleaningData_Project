library(plyr)
# Data collection
# "y_train.txt" and "y_test.txt" -- Activity variable
dataActivityTest <- read.table("UCI_HAR_Dataset/test/y_test.txt")
dataActivityTrain <- read.table("UCI_HAR_Dataset/train/y_train.txt")

# "subject_train.txt" and "subject_test.txt" -- Subject variable
dataSubjectTest <- read.table("UCI_HAR_Dataset/test/subject_test.txt")
dataSubjectTrain <- read.table("UCI_HAR_Dataset/train/subject_train.txt")

# "x_train.txt" and "x_test.txt" -- Features variable
dataFeaturesTest <- read.table("UCI_HAR_Dataset/test/x_test.txt")
dataFeaturesTrain <- read.table("UCI_HAR_Dataset/train/x_train.txt")

# Binding the train and test data for Activity, Subject and Features
dataActivity <- rbind(dataActivityTrain, dataActivityTest)
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)

names(dataActivity) <- c("Activity")
names(dataSubject) <- c("Subject")
dataFeaturesNames <- read.table("UCI_HAR_Dataset/features.txt")
names(dataFeatures) <- dataFeaturesNames$V2

# Merge all data into the data frame "CompleteData"
temp <- cbind(dataSubject, dataActivity)
CompleteData <- cbind(dataFeatures, temp)

# Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject
tidy_data <- ddply(CompleteData, .(Subject, Activity), function(x) colMeans(x[, 1:66]))
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)