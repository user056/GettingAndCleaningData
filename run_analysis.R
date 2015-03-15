course3 <- function(){
        
        library(plyr)
        library(reshape2)
        library(dplyr)
        library(data.table)
 
        setwd("C:/Users/marc/Documents/coursera-RR/course03") # Home Directory
        
        data_input_folder <- file.path(getwd(), "UCI HAR Dataset") #Here are the data files

##Merges the training and the test sets to create one data set        

        test.data <- read.table(file.path(data_input_folder, "test", "X_test.txt"),header=FALSE)
        test.data.activity <- read.table(file.path(data_input_folder, "test", "Y_test.txt"),header=FALSE)
        testData.subject <- read.table(file.path(data_input_folder, "test", "subject_test.txt"),header=FALSE)

        train.data <- read.table(file.path(data_input_folder, "train", "X_train.txt"),header=FALSE)
        train.data.activity <- read.table(file.path(data_input_folder, "train", "Y_train.txt"),header=FALSE)
        train.data.subject <- read.table(file.path(data_input_folder, "train", "subject_train.txt"),header=FALSE)    

        merged.subjects <- rbind(train.data.subject, testData.subject)
        colnames(merged.subjects) <- c("subject")
        merged.activity <- rbind(train.data.activity, test.data.activity)
        colnames(merged.activity) <- c("activity")
        merged.sub.act <- cbind(merged.subjects, merged.activity)        

        merged.data <- rbind(train.data, test.data)

##Uses descriptive activity names to name the activities in the data set
        features <- read.table(file.path(data_input_folder,"features.txt"),header=FALSE)
        colnames(features) <- c("Feature.Index","Feature.Name")
        
        colnames(merged.data) <- features$Feature.Name
        
        merged.final <- cbind(merged.sub.act, merged.data)

##Extracts only the measurements on the mean and standard deviation for each measurement. 
        cleaned.data <- merged.final[,grep("mean\\(\\)|std\\(\\)|activity|subject",colnames(merged.final))]


##Appropriately labels the data set with descriptive variable names. 
        label.activity <- read.table(file.path(data_input_folder, "activity_labels.txt"),header=FALSE)

        cleaned.data$activity <- mapvalues(cleaned.data$activity, from = c("1","2","3","4","5","6"), to = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))


##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

        formated.data <- data.table(cleaned.data)
        data.tidy<-formated.data[,lapply(.SD,mean),by="activity,subject"]
        write.table(data.tidy,file="coursera_tidy_data.csv",sep=",",row.names = FALSE)

}