install.packages("dplyr")
library('dplyr')
install.packages("stringr")
library(stringr)
library(reshape2)
library(tidyr)

#read in column names
df_cols <- read.table('./data/features.txt')



#### CREATE THE COMPLETE TRAINING DATA ####


#read in the train data and add the column names
df_xtrain <- read.table("./data/train/X_train.txt", col.names=df_cols$V2)

#select columns of df_train that contain mean and std in their name
# REQUIREMENT 2: Extracts only the measurements on the mean and standard deviation for each measurement.
df_xtrain <-  select(df_xtrain, matches('mean[^A-Z].*[XYZ]$|std.*[XYZ]$'))

#read in the train-activity-labels
df_ytrain <- read.table("./data/train/y_train.txt")

# combine the train features with the train label
df_train <- cbind(df_xtrain, df_ytrain$V1)

# rename the label column
# REQUIREMENT 4: Appropriately labels the data set with descriptive variable names. 
df_train <- rename(df_train, c('Activity_ID' = 'df_ytrain$V1'))

#read in the train activity labels
df_train_subject = read.table("data/train/subject_train.txt")

# combine the test features with the test label
df_train <- cbind(df_train, df_train_subject$V1)

# rename the Subject column
# REQUIREMENT 4: Appropriately labels the data set with descriptive variable names. 
df_train <- rename(df_train, c('Subject_ID' = 'df_train_subject$V1'))





#### CREATE THE COMPLETE TESTING DATA ####


#read in the test data and add the column names
# REQUIREMENT 4: Appropriately labels the data set with descriptive variable names. 
df_xtest <- read.table("./data/test/X_test.txt", col.names=df_cols$V2)

#select columns of df_test that contain mean and std in their name
# REQUIREMENT 2: Extracts only the measurements on the mean and standard deviation for each measurement.
df_xtest <- select(df_xtest, matches('mean[^A-Z].*[XYZ]$|std.*[XYZ]$'))

#read in the test activity labels
df_ytest <- read.table("./data/test/y_test.txt")

# combine the test features with the test label
df_test <- cbind(df_xtest, df_ytest$V1)

# rename the label column
# REQUIREMENT 4: Appropriately labels the data set with descriptive variable names. 
df_test <- rename(df_test, c('Activity_ID' = 'df_ytest$V1'))

#read in the test subject labels
df_test_subject = read.table("data/test/subject_test.txt")

# combine the test features with the test label
df_test <- cbind(df_test, df_test_subject$V1)

# rename the Subject column
# REQUIREMENT 4: Appropriately labels the data set with descriptive variable names. 
df_test <- rename(df_test, c('Subject_ID' = 'df_test_subject$V1'))



######## COMPLETE DATASET ########
#merge the dataset to create one dataset
# REQUIREMENT 1: Merges the Training and test sets to create one data set.
df <- merge(df_train,df_test,all=TRUE)


######## BRING IN THE ACTIVITY LABELS ########
# read in the activity labels
df_activity_labels <- read.table('./data/activity_labels.txt', 
                                 col.names=c('Activity_ID', 
                                             'Activity_Title')
                                 )

# merge the activity labels onto the data
# REQUIREMENT 3: Uses descriptive activity names to name the activities in the data set
df <- merge(df, df_activity_labels, by='Activity_ID')

######## MAKE TIDY DATA ########
# melt the data to make it tidy
# REQUIREMENT 5:  creates a second, independent tidy data set with the average of each variable for each activity and each subject
df_tidy <- melt(df, id=c( 'Subject_ID', 'Activity_ID', 'Activity_Title'))
write.table(df_tidy, 'tidy_data.txt', row.name=FALSE
            )
