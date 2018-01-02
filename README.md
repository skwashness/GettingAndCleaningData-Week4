# GettingAndCleaningData-Week4
Required files for week4 homework

For this exercise, I chose to take the WIDE definition of tidy data.

The run_analysis.R code achieves the required tasks by doing the following:

(1) Merge train and test data -- this is performed within step 2 (line 28). The merger is performed prior to adding activities, or subjects to the data.

(2) Extract mean and std variables -- for this, I interpreted this to mean any feature whose name includes "mean" or "std" would be included, and thus included those. There were 53 features with "mean" and 33 with "std". This is performed in step 4, where I create combined.means and combined.std data frames.

(3) Applies descriptive activity names -- this is achieved in step 2. First, I read in activity_labels, which gives descriptive names of the six activities, as well as the numeric code that corresponds. Then I merged them with y_train, which contains the numeric code for each activity by observation. Finally, I merged the named, numeric coded activities to the full dataset since that has the same number of observations and y_train.

(4) Applies descriptive varaibles names -- performed in step 3, where I apply the features.txt names to the dataset.

(5) Creates tidy dataset -- this is done in Step 5, where I group observations by subject and activity, then summarize each variable by its mean.
