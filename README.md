# Getting and cleaning data 
Course assignment, Coursera 2014 


##Running the provided R script
The Samsung data should be available unziped in the working directory.

The script `run_analysis.R` uses the following hard coded local filesystem paths, which need to be adjusted based on the used environment.

* setwd("C:/Users/marc/Documents/coursera-RR/course03")
* data_input_folder <- file.path(getwd(), "UCI HAR Dataset")

Afterwards as usual, it is needed to source the R file. To execute the script, it can be called with `course3()`


##Results

After the script finished, there will be an tidy data set available in your working directory entitled as `coursera_tidy_data.txt`. It will contain 68 variables and 180 observations. The observations are structured in 6 activities and 30 subjects.


##How it works

1) The script loads all the provided data files from the Samsung data set and merge them into one data set.

```R
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
```

2) The script adjusts the column names to match the lables for columns proveded in the `features.txt` file.

```R
##Uses descriptive activity names to name the activities in the data set
        features <- read.table(file.path(data_input_folder,"features.txt"),header=FALSE)
        colnames(features) <- c("Feature.Index","Feature.Name")
        
        colnames(merged.data) <- features$Feature.Name
        
        merged.final <- cbind(merged.sub.act, merged.data)
```

3) The script cleans the data set from not needed columns. Only the columns in the data set are of interest which represents `mean` or `std` obervations. Also keeps the column `subject` and `activity` in the cleaned data set.

```R
##Extracts only the measurements on the mean and standard deviation for each measurement. 
        cleaned.data <- merged.final[,grep("mean\\(\\)|std\\(\\)|activity|subject",colnames(merged.final))]
```

4) Substitute the numeric values in column activity with related labels provided from the mapping file `activity_labels.txt`

```R
##Appropriately labels the data set with descriptive variable names. 
        label.activity <- read.table(file.path(data_input_folder, "activity_labels.txt"),header=FALSE)

        cleaned.data$activity <- mapvalues(cleaned.data$activity, from = c("1","2","3","4","5","6"), to = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
```

5) The script creates the tidy data set and saves it to a file to finish the assignment.

```R
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

        formated.data <- data.table(cleaned.data)
        data.tidy<-formated.data[,lapply(.SD,mean),by="activity,subject"]
        write.table(data.tidy,file="coursera_tidy_data.txt",sep=",",row.names = FALSE)
```



