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
 3. Joins information in a single Vector for each variable: Subjects, Data, Labels.
 4. Generates mean, standard deviation vectors from Data and stores them into mW and sdW repectively. Also generates lW vector from Labels. 
 5. Vectors Subjects, lW, mW and sdW are column binded together to form a tbl_df object called cran
 6. Finally, cran is summarized and converted into Summary which gets printed into "Run_Analisys.txt" file
