Project:  Getting and Cleaning Data Course Project
Data:     Sourced from UC Irvine Machine Learning Repository

Script Requirements:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Process:

This project accomplishes the above five (5) requirements in several parts.  First, the complete training data is created.  Second, the complete testing data is created.  Third, the training and testing datasets are combined to make one dataset.  Fourth, the activity labels are brought into the dataset.  Fifth, and finally, the data is melted to create a Tidy Dataset.

1. CREATE THE COMPLETE TRAINING DATA
In this section the X training data are read in, the column names are added to the training data, and only the mean or standard deviation columns are retained.  Note I took care to exclude the meanFreq columns.  Next the training label_ids corresponding to movements like "walking" are brought in and joined with the training x data.  The label column is then renamed as Activity_ID.  The training subject ids corresponding to the 30 participants in the study are brought in next and joined with the rest of the training data.

2. CREATE THE COMPLETE TESTING DATA
The entire process followed in Step 1 is repeated with the testing data. 

3. COMPLETE DATASET
The training and testing data are merged into one dataset. 

4. BRING IN THE ACTIVITY LABELS
The activity labels (e.g. walking) are read into a table and merged with Activity IDs. 

5. MAKE TIDY DATA
Finally the Data set is melted to create a tidy dataset where the measurements become "variables" the values become values.