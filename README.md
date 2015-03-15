# Getting and cleaning data 
Course assignment, Coursera 2014 


##Running the provided R script
The Samsung data should be available unziped in the working directory.

The script `run_analysis.R` uses the following hard coded local filesystem paths, which need to be adjusted based on the used environment.

* setwd("C:/Users/marc/Documents/coursera-RR/course03")
* data_input_folder <- file.path(getwd(), "UCI HAR Dataset")

Afterwards as usual, it is needed to source the R file. To execute the script, call it with 'course3()'


##Results

After the script finished, there will be an tidy data set available in your working directory entitled as `coursera_tidy_data.txt`. It will contain 68 variables and 180 observations. The observations are structured in 6 activities and 30 subjects.


##How it works

1) Load all the provided data files from the Samsung data set and merge them into one data set.

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

