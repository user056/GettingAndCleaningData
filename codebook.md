#Codebook
Coursera assignment, 2014

##Overview 

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  The full data set and further descriptions is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This Codebook describes a shortened data set with a subset of extracted columns from the full data set. The extracted columns shows only the values for the standard deviation and mean values inside the full data set.




##Description Variables

-Unit of column `subject` is int 1:30
-Unit of COLUMN `activity` is one of the following value: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- Unit of all other falues is floating numbers 


| Variable        | Description |         
| ------------- |:-------------:|
| activity      | Activity name|
| subject      | Subject ID who performed the activity  |
| tBodyAcc-mean()-X | Body Acc mean value for axial signals in the X direction	|
| tBodyAcc-mean()-Y	 |   Body Acc mean value for axial signals in the Y direction      |
| tBodyAcc-mean()-Z	 |   Body Acc mean value for axial signals in the Z direction	|
| tBodyAcc-std()-X	 |   Body Acc std value for axial signals in the X direction	|
| tBodyAcc-std()-Y	 |   Body Acc std value for axial signals in the Y direction	|
| tBodyAcc-std()-Z	 |  Body Acc std value for axial signals in the Z direction	|
| tGravityAcc-mean()-X	 | Body GravityAcc mean value for axial signals in the X direction	      |
| tGravityAcc-mean()-Y	 | Body GravityAcc mean value for axial signals in the Y direction	            |
| tGravityAcc-mean()-Z	 | Body GravityAcc mean value for axial signals in the Z direction	            |
| tGravityAcc-std()-X	 |  Body GravityAcc std value for axial signals in the X direction	           |
| tGravityAcc-std()-Y	 | Body GravityAcc std value for axial signals in the Y direction	            |
| tGravityAcc-std()-Z	 | Body GravityAcc std value for axial signals in the Z direction	            |
| tBodyAccJerk-mean()-X	 |Body AccJerk mean value for axial signals in the X direction	             |
| tBodyAccJerk-mean()-Y	 |Body AccJerk mean value for axial signals in the Y direction       |
| tBodyAccJerk-mean()-Z	 |Body AccJerk mean value for axial signals in the Z direction       |
| tBodyAccJerk-std()-X	 |Body AccJerk std value for axial signals in the X direction              |
| tBodyAccJerk-std()-Y	 |Body AccJerk std value for axial signals in the Y direction                     |
| tBodyAccJerk-std()-Z	 |Body AccJerk std value for axial signals in the Z direction                     |
| tBodyGyro-mean()-X	 | Body Gyro mean value for axial signals in the X direction                    |
| tBodyGyro-mean()-Y	 | Body Gyro mean value for axial signals in the Y direction                           |
| tBodyGyro-mean()-Z	 | Body Gyro mean value for axial signals in the Z direction                           |
| tBodyGyro-std()-X	 | Body Gyro std value for axial signals in the X direction                           |
| tBodyGyro-std()-Y	 | Body Gyro mean value for axial signals in the Y direction                           |
| tBodyGyro-std()-Z	 |  Body Gyro mean value for axial signals in the Z direction                          |
| tBodyGyroJerk-mean()-X	 | Body GyroJerkmean mean value for axial signals in the X direction                           |
| tBodyGyroJerk-mean()-Y	 | Body GyroJerkmean mean value for axial signals in the Y direction                                 |
| tBodyGyroJerk-mean()-Z	 | Body GyroJerkmean mean value for axial signals in the Z direction                                 |
| tBodyGyroJerk-std()-X	 |Body GyroJerkmean std value for axial signals in the X direction                                  |
| tBodyGyroJerk-std()-Y	 | Body GyroJerkmean std value for axial signals in the X direction                                        |
| tBodyGyroJerk-std()-Z	 | Body GyroJerkmean mean value for axial signals in the Z direction                                        |
| tBodyAccMag-mean()	 | Body AccMag mean value   |
| tBodyAccMag-std()	 | Body AccMag std value |
| fBodyBodyAccJerkMag-std()	 | Body AccJerkMag std value  |
| fBodyBodyGyroMag-mean()	 | Body GyroMag mean value   |
| fBodyBodyGyroMag-std()	 |Body GyroMag std value    |
| fBodyBodyGyroJerkMag-mean()	 |Body GyroJerkMag mean value  |
| fBodyBodyGyroJerkMag-std() | Body GyroJerkMag std value  |


##More information
Check the `README.md` file for further details about this dataset. 

