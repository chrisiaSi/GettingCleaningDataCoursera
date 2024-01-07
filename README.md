# GettingCleaningDataCoursera
Getting and Cleaning Data course for Coursera


Step 1:
Retrieving the data files for Train and Test data from saved location
Merging X and Y of Training data along with the subject
Merging X and Y of Test data along with the subject
Merging all the train and test data sets for given subjects
Reading the feature.txt file and saving to features variable
Adding the appropriate headers for the merged dataset with the features dataset

Step 2:
Extracting only the measurements on the mean and standard deviation for each measurement along with activity and subject details 

Step 3 :
Using descriptive activity names to name the activities in the data set
retrieving activity names from "activity_labels.txt"

Merging the activity names with the Merged Mean and Standard devisation data
Dropping activity column to prevent data redundancy

Step 4:
Appropriately labels the data set with descriptive variable names
Dropping special characters from the column names
Adding more descriptive names to the variables
Replacing "t" with time, "f" with frequency, "acc" with accelaration, "mag" with magnitude

Saving the Tidy data into a file called "uciHarTidyData.txt" excluding the header

Step 5:
From the tidy data set in previous step, create a new independent tidy data set with the 
average of each variable for each activity and each subject.