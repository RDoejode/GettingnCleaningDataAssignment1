#Set the working directory to the folder where the features.txt file exists. Features.txt has the variable names
setwd("/Users/bdcoe/Documents/r/coursera/GettingData/Assignment1/UCI HAR Dataset/")
features<-read.table("features.txt")

#Initialize two vectors to hold the column numbers and column name 
colnum <- c()
headerNames <- c()

#Filters used are "mean()" and "std" to glean out the column number and column names. colnum and headerNames vector at the end  of the for loop will have right column numbers and names
for(i in 1:nrow(features)) {
  
  if(((grepl("mean()",features[i,2])) & !(grepl("meanFreq",features[i,2]))) | grepl("std",features[i,2]))  {
    
    colnum <-c(colnum,i)
    headerNames <-c(headerNames,as.character(features[i,2]))
  }
}

#Set the working directory to the folder where the test data is
setwd("../test/")

#Build dataframe for Subject, Activity (y) and measurements (X) by reading the respective files
testSubject <-read.table("subject_test.txt", header=FALSE)
testY <- read.table("y_test.txt")
testX <-read.table("X_test.txt")

#Create a dataframe using the Subject and Activity dataframe
testdf <-cbind(testSubject,testY)

#Build a third column and store the text for the Activity
testdf$Activity [testdf[2] == "1"] <- "WALKING"
testdf$Activity [testdf[2] == "2"] <- "WALKING_UPSTAIRS"
testdf$Activity [testdf[2] == "3"] <- "WALKING_DOWNSTAIRS"
testdf$Activity [testdf[2] == "4"] <- "SITTING"
testdf$Activity [testdf[2] == "5"] <- "STANDING"
testdf$Activity [testdf[2] == "6"] <- "LAYING"

#Build a consolidated dataframe with test dataset by adding only the column numbers from colnum
for(i in c(colnum)) {
  
  testdf <- cbind(testdf,testX[i])
}

#Set the working directory to the folder where the train dataset is

setwd("../train/")

#Build dataframe for Subject, Activity (y) and measurements (X) by reading the respective files
trainSubject <-read.table("subject_train.txt", header=FALSE)
trainY <- read.table("y_train.txt")
trainX <-read.table("X_train.txt")

#Create a dataframe using the Subject and Activity dataframe
traindf <-cbind(trainSubject,trainY)

#Build a third column and store the text for the Activity
traindf$Activity [traindf[2] == "1"] <- "WALKING"
traindf$Activity [traindf[2] == "2"] <- "WALKING_UPSTAIRS"
traindf$Activity [traindf[2] == "3"] <- "WALKING_DOWNSTAIRS"
traindf$Activity [traindf[2] == "4"] <- "SITTING"
traindf$Activity [traindf[2] == "5"] <- "STANDING"
traindf$Activity [traindf[2] == "6"] <- "LAYING"

#Build a consolidated dataframe with train dataset
for(i in c(colnum)) {
  
  traindf <- cbind(traindf,trainX[i])
}

##Build a consolidated dataframe using train and test dataset
consolidateddf<-rbind(traindf,testdf)

#Build the complete header/colnames
consolidatedHeader <-c("Subject","Activity_Code","Activity",headerNames)

#Add the column name to the consolidated dataframe
colnames(consolidateddf) <-consolidatedHeader

#Melt consolidated dataframe
consolidateddfMelt <- melt(consolidateddf,id=c("Subject","Activity_Code","Activity"),measures.vars=c(headerNames))

#Use dcast to get the mean by Subject, Activity Code and Activity
subjectActivity_df <- dcast(consolidateddfMelt,Subject + Activity_Code + Activity ~ variable,mean)

#Save the file
write.table(subjectActivity_df,"SubjectActivity.txt",sep=",",col.names=TRUE,quote=FALSE, row.names=FALSE)
