Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean the data:   
 0. Unzip the getdata-projectfiles-UCI HAR Dataset.zip file and locate the data in the "./SamsungData" directory.
 
0b. Read activity_labels.txt data into Activity_df and subject_test.txt data into Subjects
 1. 1. Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and store them in *trainData*, *trainLabel* and *trainSubject* variables respectively.       
 2. Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and store them in *testData*, *testLabel* and *testsubject* variables respectively.  
