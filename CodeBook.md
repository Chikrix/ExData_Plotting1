
                                                    STUDY DESIGN
  This data is from the for accelerometer and gyroscope readings of Human activity using Samsung Galaxy S II Smartphone. The experiment involved 30 volunteers between ages 19-48 and these individuals did the following activities; "Walking","WalkingUpstairs","WalkingDownstairs","Sitting","Standing","Laying". While the volunteers performed these activities, they wore the Samsung Galaxy S II smartphone on their waist, with the accelerometer and gyroscope which is enbedded with the Samsung Galaxy smartphone, the experimenters derived 3-axial(XYZ) linear acceleration and 3-axial(XYZ) angular velocity reading both at a constant rate of 50hz for each volunteer. They also got some other readings which is explained below. Finally the dataset obtained from this experiment was randomly divided into two different sets;
  
  The train_set: Which is the dataset readings of 70% of the volunteers.
  
  The test_set: which is the dataset reading of 30% of the volunteers.

The train_set has the following datasets; subject_train.txt, X_train.txt, Y_train.txt, Inertial Signals folder.

The test_set has the following datasets; subject_test.txt,X_test.txt, Y_test.txt, Inertial Signals folder.

subject_train.txt and subject_test.txt are both identifiers of the volunteers who performed the experiments. Altogether it ranges from 1 to 30 which corresponds to the number of volunteers in the experiment

Y_train.txt and Y_test.txt are both labels for the activities preformed, it ranges from numbers 1 to 6 where each number represents each of the six activities performed ("Walking","WalkingUpstairs","WalkingDownstairs","Sitting","Standing","Laying") respectively.

X_train.txt: This is the actual reading of the train set. It is a 561 column of the time signal and frequency (to help remove the noise) for the various variables.

X_test.txt: This is the actual reading of the test set. It is a 561 column of the time signal and frequency (to help remove the noise) for the various variables


                                                     CODEBOOK

The X_test.txt and X_train.txt both has 561 columns, below are the columns and what they represent
  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions for the readings and so for each variable, the readings are for the X,Y,Z, t stands for time, and f for frequency.

tBodyAcc-mean()-XYZ: Mean value of the body acceleration signal

tGravityAcc-mean()-XYZ: Mean value of the body acceleration signal

tBodyAccJerk-mean()-XYZ

tBodyGyro-mean()-XYZ

tBodyGyroJerk-mean()-XYZ

tBodyAccMag-mean()

tGravityAccMag-mean()

tBodyAccJerkMag-mean()

tBodyGyroMag-mean()

tBodyGyroJerkMag-mean()

fBodyAcc-XYZ-mean()

fBodyAccJerk-XYZ-mean()

fBodyGyro-XYZ-mean()

fBodyAccMag-mean()

fBodyAccJerkMag-mean()

fBodyGyroMag-mean()

fBodyGyroJerkMag-mean()

For the above columns, the following were measured for each XYZ axis of the signal reading

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

Other column names are;

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

The meaning of each column is better explained in the "Features_info.txt" which ids downloaded with the samsung data

In my analysis, I used the column names as provided in the "Features_info.txt" except for the following

SubJects: This numbers represents the identifiers for each experiment participant

Activities: This are the activities the participants performed

                                                     PROCEDUREs FOR MY ANALYSIS
                                                            
I downloaded the file of the experiment outside R from the link "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and I also unzipped it outside R and put it on my desktop so I can easily locate it for analysis to be done. To chhose my working directory, I created a folder on my desktop where I put the .txt files of the samsung data I will be reading and using in the analysis which will also be the working directory I will use for the analysis. In the pane on the right in RStudio,(note that I am working with RStudio), I click on files, then ... which allowed me to choose that folder I created, I then click on "More" which is above the "..." on the right in RStudio, then I choose "Set As Working Directory" which set this folder as my working directory. The rest are outlined in the run_analysis.R
