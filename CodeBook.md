## Data Sources

Downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following files were used:

1. X_train.txt -- contains the 561 variables/features by subject and activity (train data). 7352 observations
2. y_train.txt -- contains numeric listing of each activity (1-6) (train data) for each observation
3. subject.train -- contains listing of each subject (1-30) (train data) corresponding to each observation

4. X_test.txt -- contains the 561 variables/features by subject and activity (test data). 2947 observations
5. y_test.txt -- contains numeric listing of each activity (1-6) (test data) for each observation
6. subject.test -- contains listing of each subject (1-30) (test data)  corresponding to each observation

7. activity_labels.txt -- contains named activities (i.e. STANDING, WALKING etc.) for both train and test data
8. features.txt -- contains names of variables/features of each activity, of which there are 561.

## Data Set Information

The data records 30 volunteers performing 6 activities over a period of time. The activities were recorded while wearing a Samsung Galaxy SII smartphone on the waist and are:
I.   WALKING
II.  WALKING_UPSTAIRS
III. WALKING_DOWNSTAIRS
IV.  SITTING
V.   STANDING
VI.  LAYING

Each activity was video recorded and the data was labeled manually, capturing 3-axial linear acceleration and 3-axial angular velocity at a constate rate of 50Hz. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Work performed on the data

In this dataset, the train and test observations were combined, and each observation represents an indvidual subject and the corresponding activity they performed.

I combined the X_train, y_train and subject datasets, as well as incorporated the activity labels and features. In addition, I combined the train and test data, and performed the aggregation by activity and subject.

## Atribute Inforamtion

The following code summarizes the attributes in my tidy dataset, including the class type and mean of each attribute


combined.tidy <- read.table("tidy.data.txt")
make.codeBook <- function(set) {
      df <- data.frame(
            row.names = NULL,
            column.names = names(set),
            class = sapply(set, class),
            mean = sapply(set, function(x)
                  if (class(x) == "numeric")
                        mean(x)
                  else
                        "Not available")
      )
      write.table(df, "codeBook.att.rmd", sep = " | ")
      return(df)
}
make.codeBook(combined.tidy)

Results:

column.names   class                 mean
1                               subject integer        Not available
2                              activity  factor        Not available
3                     tBodyAcc.mean...X numeric    0.274554356617316
4                     tBodyAcc.mean...Y numeric  -0.0175486873443231
5                     tBodyAcc.mean...Z numeric   -0.108924884740879
6                  tGravityAcc.mean...X numeric    0.686408641430209
7                  tGravityAcc.mean...Y numeric  -0.0049783813598292
8                  tGravityAcc.mean...Z numeric   0.0823914176016753
9                 tBodyAccJerk.mean...X numeric   0.0788491669572253
10                tBodyAccJerk.mean...Y numeric  0.00771790679779697
11                tBodyAccJerk.mean...Z numeric -0.00521597926133305
12                   tBodyGyro.mean...X numeric   -0.029905848327269
13                   tBodyGyro.mean...Y numeric  -0.0759996579354172
14                   tBodyGyro.mean...Z numeric   0.0890371780793373
15               tBodyGyroJerk.mean...X numeric  -0.0974863174106806
16               tBodyGyroJerk.mean...Y numeric  -0.0420883477368071
17               tBodyGyroJerk.mean...Z numeric  -0.0548573545701142
18                   tBodyAccMag.mean.. numeric   -0.570533918209112
19                tGravityAccMag.mean.. numeric   -0.570533918209112
20               tBodyAccJerkMag.mean.. numeric   -0.668531532966286
21                  tBodyGyroMag.mean.. numeric   -0.622087523695279
22              tBodyGyroJerkMag.mean.. numeric   -0.775798777115443
23                    fBodyAcc.mean...X numeric   -0.643982164633186
24                    fBodyAcc.mean...Y numeric   -0.554389741512341
25                    fBodyAcc.mean...Z numeric   -0.689269832839734
26                fBodyAcc.meanFreq...X numeric   -0.207652359093737
27                fBodyAcc.meanFreq...Y numeric   0.0157815359190466
28                fBodyAcc.meanFreq...Z numeric   0.0433445617805814
29                fBodyAccJerk.mean...X numeric   -0.676185040600269
30                fBodyAccJerk.mean...Y numeric   -0.643089074638921
31                fBodyAccJerk.mean...Z numeric   -0.764202618970272
32            fBodyAccJerk.meanFreq...X numeric  -0.0345582475364837
33            fBodyAccJerk.meanFreq...Y numeric   -0.210108886666639
34            fBodyAccJerk.meanFreq...Z numeric   -0.117065038756731
35                   fBodyGyro.mean...X numeric    -0.68388401247455
36                   fBodyGyro.mean...Y numeric   -0.724441601768897
37                   fBodyGyro.mean...Z numeric   -0.660947300261025
38               fBodyGyro.meanFreq...X numeric   -0.109877095386923
39               fBodyGyro.meanFreq...Y numeric   -0.182804839096797
40               fBodyGyro.meanFreq...Z numeric  -0.0499620963585901
41                   fBodyAccMag.mean.. numeric   -0.607179314033848
42               fBodyAccMag.meanFreq.. numeric   0.0785392628448625
43           fBodyBodyAccJerkMag.mean.. numeric   -0.641396225928874
44       fBodyBodyAccJerkMag.meanFreq.. numeric    0.176082428924956
45              fBodyBodyGyroMag.mean.. numeric   -0.712180053022393
46          fBodyBodyGyroMag.meanFreq.. numeric   -0.050228931839067
47          fBodyBodyGyroJerkMag.mean.. numeric   -0.793375389491002
48      fBodyBodyGyroJerkMag.meanFreq.. numeric    0.124433160173899
49          angle.tBodyAccMean.gravity. numeric   0.0062356149018741
50 angle.tBodyAccJerkMean..gravityMean. numeric  0.00147880649903344
51     angle.tBodyGyroMean.gravityMean. numeric   0.0138835199712599
52 angle.tBodyGyroJerkMean.gravityMean. numeric -0.00821954545839227
53                 angle.X.gravityMean. numeric   -0.515039904703351
54                 angle.Y.gravityMean. numeric    0.069080726740714
55                 angle.Z.gravityMean. numeric  -0.0458626472107429
56                     tBodyAcc.std...X numeric   -0.629498617596261
57                     tBodyAcc.std...Y numeric   -0.526938160607057
58                     tBodyAcc.std...Z numeric   -0.639486002029284
59                  tGravityAcc.std...X numeric   -0.965778650072633
60                  tGravityAcc.std...Y numeric   -0.953861688842098
61                  tGravityAcc.std...Z numeric   -0.938296296518877
62                 tBodyAccJerk.std...X numeric   -0.659526748567478
63                 tBodyAccJerk.std...Y numeric   -0.623142764857171
64                 tBodyAccJerk.std...Z numeric   -0.782167044181808
65                    tBodyGyro.std...X numeric   -0.729944419747787
66                    tBodyGyro.std...Y numeric   -0.699573665030452
67                    tBodyGyro.std...Z numeric   -0.671679438476039
68                tBodyGyroJerk.std...X numeric   -0.743687896986898
69                tBodyGyroJerk.std...Y numeric   -0.801944293958274
70                tBodyGyroJerk.std...Z numeric   -0.750464788714009
71                    tBodyAccMag.std.. numeric   -0.611097422948502
72                 tGravityAccMag.std.. numeric   -0.611097422948502
73                tBodyAccJerkMag.std.. numeric   -0.648066067418822
74                   tBodyGyroMag.std.. numeric   -0.677592271246152
75               tBodyGyroJerkMag.std.. numeric   -0.791877014272709
76                     fBodyAcc.std...X numeric   -0.625172953674363
77                     fBodyAcc.std...Y numeric   -0.544046125749364
78                     fBodyAcc.std...Z numeric   -0.643164198992835
79                 fBodyAccJerk.std...X numeric   -0.673205951044632
80                 fBodyAccJerk.std...Y numeric   -0.627483088521831
81                 fBodyAccJerk.std...Z numeric   -0.799012762093611
82                    fBodyGyro.std...X numeric   -0.746335816223536
83                    fBodyGyro.std...Y numeric   -0.690098282664331
84                    fBodyGyro.std...Z numeric   -0.707127819999287
85                    fBodyAccMag.std.. numeric    -0.67555450244239
86            fBodyBodyAccJerkMag.std.. numeric   -0.659755860133309
87               fBodyBodyGyroMag.std.. numeric   -0.712446347753304
88           fBodyBodyGyroJerkMag.std.. numeric   -0.805394220143377
> 




