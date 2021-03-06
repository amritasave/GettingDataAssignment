GettingDataAssignment
=====================

Getting and Cleaning Data assignment for peer assessment

Assumptions.

1.	The getdata-projectfiles-UCI HAR Dataset zip file is downloaded and unzipped manually n the current working directory. The contents of the zip file is unzipped in a folder named “UCIHARDataset”.

2.	While extracting mean and standard deviation for each feature , columns which contain the words “mean()” or “std() “ has been picked.

3.	Package data.table has been installed for using some of its functions.

4.	A TXT file is created of the tidy dataset in the current working directory.

Steps carried out for the analysis.

1. Reading the text files into data frames in R.

2. trainDF a data frame is created from the X_train.txt which is the training dataset.

3. testDF a data frame is created from the X_test.txt which is the test dataset.

4. YtrainDF a data frame is created from the y_train.txt which is the training labels dataset.

5. YtestDF a data frame is created from the y_test.txt which is the test labels dataset.

6. SubtrainDF  a data frame is created from the subject_train.txt which contains the subject who performed the activity for the training dataset.

7. SubtestDF  a data frame is created from the subject_test.txt which contains the subject who performed the activity for the test dataset.

8. featuresDF a data frame is created from the features list txt file.

9. activityDF a data frame is created from the activity_labels.txt which has the activity names.

10. Adding relevant column names to the trainDF and testDF data frame  from the featuresDF data frame. The featuresDF  has the set of variables which were  calculated for the features. Example Mean() , Standard Deviation () etc. 

11. Adding new columns ‘Labels’ and ‘Subject’ to the testDF and trainDF data frames. 

12. The YtestDF /YtrainDF data frame contains the test labels and the SubtestDF / SubtrainDF data frame contains the subjects who performed the activities for test  dataset.

13. Merging the training and test dataset into one called the mergeDF. 

14. Creating a meanSDDataset  from the mergeDF , which contains only columns where mean or standard deviation has been computed for the features. Only those columns which contain the words ”mean()” and “std()” have been picked for the computation  along with the columns  Labels and Subject.

15. The ‘Labels’ column values are  replaced with the actual activity names from  the activityDF.

16. Converting the data frame meanSDDataset to a data table, tempDataTable.

17. Creating a group key of the columns Labels and Subject , as the average needs to be computed for  this group.

18. Creating a  newTidyDataset data frame where the mean of each variable is calculated for each activity and subject.

19. Creating a NewTidyDataset.txt file of the new tidy dataset.

