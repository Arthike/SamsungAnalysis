run_analysis.R <- funciont() {
        if(!file.exists("SamsungData")) {
                dir.create("SamsungData")
        }
        #Assuming the zip file from Samsung is placed under current working directory
        #set unzip path, and unzip file to the directory
        unzipdir <- "./SamsungData"
        unzip("getdata-projectfiles-UCI HAR Dataset.zip",exdir=unzipdir)
        
        WD <- "./SamsungData/UCI HAR Dataset/" ## Working Directory
        ## Reading from Textfile without headers into a Data Frame
        Activity_df<- read.table(paste(WD,"activity_labels.txt",sep=""), header=FALSE, quote="\"", sep=" ")
        
        con <- file(paste(WD,"test/subject_test.txt",sep=""), "rt") ## TEST Subjects
        TestSubjects <- readLines(con, -1) ## Negative numbers make it to the end of the file
        close(con)
        unlink(con)
        
        con <- file(paste(WD,"test/X_test.txt",sep=""), "rt") ## TEST DATA
        TestData <- readLines(con, -1) ## Negative numbers make it to the end of the file
        close(con)
        unlink(con)
        
        con <- file(paste(WD,"test/y_test.txt",sep=""), "rt") ## TEST Labels
        TestLabels <- readLines(con, -1) ## Negative numbers make it to the end of the file
        close(con)
        unlink(con)
        
        con <- file(paste(WD,"train/subject_train.txt",sep=""), "rt") ## TRAIN Subjects
        TrainSubjects <- readLines(con, -1) ## Negative numbers make it to the end of the file
        close(con)
        unlink(con)
        
        con <- file(paste(WD,"train/X_train.txt",sep=""), "rt") ## TRAIN DATA
        TrainData <- readLines(con, -1) ## Negative numbers make it to the end of the file
        close(con)
        unlink(con)
        
        con <- file(paste(WD,"train/y_train.txt",sep=""), "rt") ## TRAIN Labels
        TrainLabels <- readLines(con, -1) ## Negative numbers make it to the end of the file
        close(con)
        unlink(con)
        
        library(dplyr)
        Subjects <- as.numeric(append(TestSubjects, TrainSubjects))
        Data <- append(TestData, TrainData)
        ## Getting Means and Standard Deviations from Data
        mW <- sdW <- 0
        lW <- " "
        Data <- strsplit(Data, " ")
        Labels <- as.numeric(append(TestLabels, TrainLabels))
        
        for (i in 1:length(Data)) {
                tempData <- as.numeric(Data[[i]])
                mW <- append(mW,mean(tempData, na.rm=TRUE)) ## Generating Means
                sdW <- append(sdW,sd(tempData, na.rm=TRUE)) ## Generating Standard Deviations
                lW <- append(lW,as.character(Activity_df[Labels[i],2])) ## Generation Activity Labels
        }
        mW <- mW[-1] ## Removing first Element
        sdW <- sdW[-1] ## Removing first Element
        lW <- lW[-1] ## Removing first Element
        
        mydf <- cbind(Subjects, lW, mW, sdW) ## Tidy Data Set in Data Frame Format
        names(mydf) <- c("subjectid", "activity", "measurementsmean", "measurementsstd")
        mydf<-as.data.frame(mydf)
        
        
        library(dplyr)
        cran <- tbl_df(mydf) ## Tidy Data Set in Table Data Frame Format (dplyr)
        rm("mydf")
                        
        x <- by_Subject_Activity <- group_by(cran, as.numeric(Subjects), lW) ## Second Data Set by Subject_ID and Activity
        Summary <- summarize(by_Subject_Activity, mean(as.numeric(as.character(mW))), mean(as.numeric(as.character(sdW))))
        names(Summary)<- c("Subject_ID","Activity","mW","sdW")
        write.table(Summary,"Run_Analysis.txt", row.name=FALSE) ## Recording Summary Analysis on Text File.
}
