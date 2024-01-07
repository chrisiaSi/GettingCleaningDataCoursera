library(dplyr)
'
  Merge the training and the test sets to create one data set.
  
  Extracts only the measurements on the mean and standard deviation for each measurement. 
  
  Uses descriptive activity names to name the activities in the data set
  
  Appropriately labels the data set with descriptive variable names. 
  
  From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
'

#Step 1:
#Retrieving the data files for Train and Test data from saved location
urlDataset <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/"
trainSub <- read.table(paste0(urlDataset, "train/subject_train.txt"), header=FALSE)
testSub <- read.table(paste0(urlDataset, "test/subject_test.txt"), header=FALSE)
trainX <- read.table(paste0(urlDataset, "train/X_train.txt"), header=FALSE)
testX <- read.table(paste0(urlDataset, "test/X_test.txt"), header=FALSE)
trainY <- read.table(paste0(urlDataset,"train/y_train.txt"), header=FALSE)
testY <- read.table(paste0(urlDataset,"test/y_test.txt"), header=FALSE)

#Merging X and Y of Training data along with the subject
trainXY <- bind_cols(trainSub, trainX, trainY)

#Merging X and Y of Test data along with the subject
testXY <- bind_cols(testSub, testX, testY)

#Merging all the train and test data sets for given subjects
trainTestXYData <- bind_rows(trainXY, testXY)

#Reading the feature.txt file and saving to features variable
features <- read.table(paste0(urlDataset, "features.txt"), header=FALSE)

#Adding the appropriate headers for the merged dataset with the features dataset
colnames(trainTestXYData) <- bind_rows(data.frame(V1=563, V2="subject"),features,data.frame(V1=562, V2="activity"))$V2

#Step 2:
##Extracting only the measurements on the mean and standard deviation for each measurement along with activity and subject details 
trainTestXYMeanStd <- select(trainTestXYData, contains("-mean()") | contains("-std()") | contains("activity")| contains("subject"))

#Step 3 :
#Using descriptive activity names to name the activities in the data set
#retrieving activity names from "activity_labels.txt"
activity <- read.table(paste0(urlDataset,"activity_labels.txt"), header=FALSE)
colnames(activity) <- c("activity", "activityname")

#Merging the activity names with the Merged Mean and Standard devisation data
trainTestXYMeanStd <- merge(x = trainTestXYMeanStd, y = activity, by = "activity", all.x = TRUE)
#Dropping activity column to prevent data redundancy
trainTestXYMeanStd <- subset(trainTestXYMeanStd, select = -c(activity))

#Step 4:
#Appropriately labels the data set with descriptive variable names
#Dropping special characters from the column names
colnames(trainTestXYMeanStd) <- gsub("[^0-9a-zA-Z]", "", colnames(trainTestXYMeanStd))

##Adding more descriptive names to the variables
#Replacing "t" with time, "f" with frequency, "acc" with accelaration, "mag" with magnitude
colnames(trainTestXYMeanStd) <- gsub("tBody", "timeBody", colnames(trainTestXYMeanStd))
colnames(trainTestXYMeanStd) <- gsub("tGravity", "timeGravity", colnames(trainTestXYMeanStd))
colnames(trainTestXYMeanStd) <- gsub("fBody", "frequencyBody", colnames(trainTestXYMeanStd))
colnames(trainTestXYMeanStd) <- gsub("Acc", "Acceleration", colnames(trainTestXYMeanStd))
colnames(trainTestXYMeanStd) <- gsub("Mag", "Magnitude", colnames(trainTestXYMeanStd))

#Saving the Tidy data into a file called "uciHarTidyData.txt" excluding the header
write.table(trainTestXYMeanStd, "./uciHarTidyData.txt", col.names = FALSE, sep = "\t", row.names = FALSE, quote = FALSE)

#Step 5:
# From the tidy data set in previous step, create a new independent tidy data set with the 
#average of each variable for each activity and each subject.
uciHarTidyDataAvg <- trainTestXYMeanStd %>%
  group_by(trainTestXYMeanStd$activityname, trainTestXYMeanStd$subject) %>%
  summarise_at(vars(-activityname, -subject), mean , na.rm=TRUE)

