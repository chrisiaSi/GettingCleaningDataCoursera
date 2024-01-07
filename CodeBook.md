To clean the data below steps are followed:

Import dplyr library

Step 1:
Retrieved the data files for Train and Test data from saved location
Get the relative path of the dataset files and save in variable urlDataset
Read training and test data of Subject, X and Y variables and save them under variables: trainSub, testSub, trainX, testX, trainY, testY

Merged X and Y of Training data along with the subject, and save under variable trainXY

Merged X and Y of Test data along with the subject and save under variable testXY

Merged all the train and test data sets for given subjects, and save under variable trainTestXYData

Reading the feature.txt file and saving to features variable

Added the appropriate headers for the merged dataset with the features dataset using colnames() function

Step 2:
Extracted only the measurements on the mean and standard deviation for each measurement along with activity and subject details, and saving under variable named trainTestXYMeanStd

Step 3 :
Using descriptive activity names to name the activities in the data set
Retrieving activity names from "activity_labels.txt" and saving under activity variable

Merged the activity names with the Merged Mean and Standard deviation data
Dropping activity column to prevent data redundancy in variable trainTestXYMeanStd

Step 4:
Appropriately labeled the data set with descriptive variable names
Dropped special characters from the column names in trainTestXYMeanStd variable

Adding more descriptive names to the variables
Replaced "t" with time, "f" with frequency, "acc" with accelaration, "mag" with magnitude in trainTestXYMeanStd variable

Saved the Tidy data in variable trainTestXYMeanStd into a file called "uciHarTidyData.txt" excluding the header

Step 5:
From the tidy data set in variable trainTestXYMeanStd, created a new independent tidy data set with the Average of each variable for each activity and each subject is saved in variable uciHarTidyDataAvg