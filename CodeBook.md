Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean the data:   
 0. It sets the default working directory as the actual working directory with setwd(getwd())
 1. Unzips the "getdata-projectfiles-UCI HAR Dataset.zip" file to the "./SamsungData" directory.
 2. Reads: 
  * "activity_labels.txt" data into Activity_df 
  * "subject_test.txt" data into TestSubjects
  * "X_test.txt" data into TestData
  * "y_test.txt" data into TestLabels
  * "subject_train.txt" data into TrainSubjects
  * "X_train.txt" data into TrainData
  * "y_train.txt" data into TrainLabels
 3. Join information in a single Vector:
  * For numeric representation of Subjects: 
   - Subjects <- as.numeric(append(TestSubjects, TrainSubjects))
   - For Data: Data <- append(TestData, TrainData)
    * Extract number values and calculates the mean and standard deviation for each subject sampled:
    * Data <- strsplit(Data, " ")
    * for (i in 1:length(Data)) {
                tempData <- as.numeric(Data[[i]])
                mW <- append(mW,mean(tempData, na.rm=TRUE)) ## Generating Means
                sdW <- append(sdW,sd(tempData, na.rm=TRUE)) ## Generating Standard Deviations
                lW <- append(lW,as.character(Activity_df[Labels[i],2])) ## Generation Activity Labels
        }

