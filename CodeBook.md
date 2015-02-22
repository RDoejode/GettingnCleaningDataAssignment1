1.The file features.txt has the header/variables for the measurements. features.txt is read into a dataframe called "feature".  The column numbers and column names for activities that have the  mean and std for different measurements could be built by looking for the word "mean()" and "std" in the "features" dataframe.
2.The vectors "colnum" and "headerNames" have the column numbers and the column names for the the mean and std for different measurements.
3.The headerNames vector is below. 
headerNames
 [1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
 [5] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
 [9] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
[17] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"        "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
[21] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[29] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
[33] "tGravityAccMag-mean()"       "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
[37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[41] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
[45] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[53] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
[57] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"           "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
[65] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 


4.Set the working directory to the folder where the test data is
5.From the folder that has the test data, read the "Subject" data into a dataframe called testSubject,"Activity" data into a dataframe called testY, and the measurements into a dataframe called testX.
6.The testdf dataframe will have all the data from the test dataset. cbind is used to add testSubject and testY to begin with. The column containing data from testY is used to add a third column containing the text of the activity type. 
7.colnum vector is used to cbind the right column from the testX dataframe to testdf.

8.Set the working directory to the folder where the train data is
9.From the folder that has the train data, read the "Subject" data into a dataframe called trainSubject,"Activity" data into a dataframe called trainY, and the measurements into a dataframe called trainX.
10.The traindf dataframe will have all the data from the train dataset. cbind is used to add trainSubject and trainY to begin with. The column containing data from trainY is used to add a third column containing the text of the activity type. 
11.colnum vector is used to cbind the right column from the trainX dataframe to traindf.
12.consolidateddf will have the consolidated/merged data from testdf and traindf.
13.consolidatedHeader vector will have the full header/column name for consolidateddf. colnames is used to add the column name
14.melt is used to melt by the activities mean and std. consolidateddfMelt is the melted dataframe
15.Finally, dcast is to build the table by subject, activity and the mean for each of mean and std measurements. 
16. File is saved as "SubjectActivity.txt".
