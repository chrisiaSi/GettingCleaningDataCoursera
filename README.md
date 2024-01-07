# GettingCleaningDataCoursera
Getting and Cleaning Data course for Coursera

The script works in the following manner:

Retrieving the data files for Train and Test data from saved location
Merging X and Y of Training data along with the subject
Merging X and Y of Test data along with the subject
Merging all the train and test data sets for given subjects
Reading the feature.txt file and saving to features variable
Adding the appropriate headers for the merged dataset with the features dataset

Extracting only the measurements on the mean and standard deviation for each measurement along with activity and subject details 

Using descriptive activity names to name the activities in the data set
retrieving activity names from "activity_labels.txt"

Merging the activity names with the Merged Mean and Standard devisation data
Dropping activity column to prevent data redundancy

Appropriately labels the data set with descriptive variable names
Dropping special characters from the column names
Adding more descriptive names to the variables
Replacing "t" with time, "f" with frequency, "acc" with accelaration, "mag" with magnitude


From the tidy data set in previous step, create a new independent tidy data set with the 
average of each variable for each activity and each subject.

Saving the Tidy data into a file called "uciHarTidyDataAvg.txt" excluding the header
