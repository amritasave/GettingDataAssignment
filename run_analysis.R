## Reading the text files into data frames in R.

trainDF <- read.table("UCIHARDataset/train/X_train.txt" ,sep="")	#Training dataset

testDF <- read.table("UCIHARDataset/test/X_test.txt" ,sep="")	# Test dataset

YtrainDF<- read.table("UCIHARDataset/train/y_train.txt" ,sep="")	#Training labels

YtestDF <- read.table("UCIHARDataset/test/y_test.txt" ,sep="")	# Test labels

#Subjects who performed the activity for training data set

SubtrainDF<- read.table("UCIHARDataset/train/subject_train.txt" ,sep="")	

#Subjects who performed the activity for training data set

SubtestDF <- read.table("UCIHARDataset/test/subject_test.txt" ,sep="")

featuresDF <- read.table("UCIHARDataset/features.txt" ,sep="")	# Features list

activityDF <- read.table("UCIHARDataset/activity_labels.txt" ,sep="")	#labels and activity names

## Adding relevant column names to the data sets. 
## The features.txt has the set of variables which were 
## calculated for the features. Example Mean() , Standard Deviation () etc. 

 colnames(trainDF) <- featuresDF[,2] 

 colnames(testDF) <- featuresDF[,2]

## Adding new columns ‘Labels’ and ‘Subject’ to the test data set. 
## The YtestDF data frame contains the 
## test labels and the SubtestDF data frame contains the 
## subjects who performed the activities for test ## dataset.

 testDF$Labels <- YtestDF[,1]

 testDF$Subject <- SubtestDF[,1]

## Adding new columns ‘Labels’ and ‘Subject’ to the training  data set. 
## The YtrainDF data frame contains 
## thetest labels and the SubtrainDF data frame contains 
## the subjects who performed the activities for ## training dataset.

 trainDF$Labels <- YtrainDF[,1]

 trainDF$Subject <- SubtrainDF[,1]

## Merging the training and test dataset into one.

mergeDF  <- merge (trainDF[, 1: ncol(trainDF)],  testDF[, 1:ncol(testDF)]  , all=TRUE)

## Creating a meanSDDataset  from the mergeDF , which contains only columns where mean or    
## standard deviation has been computed for the features. The following command returns only those 
## columns which contain the words ”mean()” and “std()” . Columns 562 , 563 are the Labels and the 
## Subject columns.

meanSDDataset  <- mergeDF[,c(562,563 ,grep("std()" , colnames(mergeDF) , fixed=TRUE), grep("mean()" , colnames(mergeDF) , fixed=TRUE))]

## The ‘Labels’ column is been replaced with the actual activity names from  the activityDF.

meanSDDataset$Labels <- activityDF[match(meanSDDataset$Labels ,activityDF$V1),"V2"]

## Installing package data.table

install.packages(“data.table”)
library(data.table)

## Converting the data frame meanSDDataset to a data table.

tempDataTable <- data.table(meanSDDataset)

## Creating a group key of the columns Labels and Subject , as the average needs to be computed for 
## this group.

 setkey(tempDataTable,Labels ,Subject)

## Creating a new tidy dataset where the mean of each variable is calculated for each activity and 
## subject.

newTidyDataset <- tempDataTable[,lapply(.SD,mean),by=key(tempDataTable)]

## Creating a txt file of the new tidy dataset.

 write.table(newTidyDataset , file="NewTidyDataset.txt" , row.names=FALSE , append=FALSE , sep="\t")
