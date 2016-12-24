# Overview

"run_analysis.R" script performs all the steps mentioned in the problem statement of the course project.
1) First, all the data related to Activity, Subject and Features are extracted from the files
2) Then, all the similar data is merged using the rbind() function. Activity consists of data from "y_train.txt" and "y_test.txt". Subject consists of data from "subject_train.txt" and "subject_test.txt". Features consists of data from "x_train.txt" and "x_test.txt".
3) Then, only the columns with mean and standard deviation are extracted from the dataset. Correct names for these columns is available in "features.txt".

# Variables
1) dataFeaturesTrain, dataActivityTrain, dataFeaturesTest, dataActivityTest, dataSubjectTrain and dataSubjectTest contain the data from the downloaded files.
2) dataFeatures, dataActivity and dataSubject merge the previous datasets to further analysis.
3) "features.txt" contains the correct names for the dataFeatures dataset, which is then extracted and applied to dataFeatures data set.
4) CompleteData merges dataFeatures, dataActivity and dataSubject into a big dataset.
5) Finally, tidy_data contains the relevant averages which will be later stored into  "tidy_data.txt" file. ddply() from the plyr package is used to apply colMeans() and get the average.
