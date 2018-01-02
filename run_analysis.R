# Clean environment
rm(list=ls())
gc()

# Set wd
setwd("C:/users/kchibanda002/R/Coursera/Getting_Cleaning_Data/Week_4/UCI Har Dataset/")


#################################################################################################################
########################################### STEP 1: Read in data ################################################
#################################################################################################################

# Read in data (train)
train <- read.table("train/X_train.txt")
subject.train <- read.table("train/subject_train.txt")
y.train <- read.table("train/y_train.txt")

# Read in data (test)
test <- read.table("test/X_test.txt")
subject.test <- read.table("test/subject_test.txt")
y.test <- read.table("test/y_test.txt")

#################################################################################################################
########################################## STEP 2: Merges #######################################################
#################################################################################################################

# First merge train and test data
combined <- rbind(train,test)

# Activity labels - these are the same for both train and test data
activity.labels <- read.table("activity_labels.txt")

# Merge activitiy labels and subjects (train)
activities.train <- merge(y.train,activity.labels,by.x="V1",sort=F)

# Merge activitiy labels and subjects (test)
activities.test <- merge(y.test,activity.labels,by.x="V1",sort=F)

# Merge train and test for activities
activities <- rbind(activities.train,activities.test)

# Combine activities with combined data
combined$activity <- activities$V2


# Merge subject.train and subject.test (i.e. the subject #s)
subject <- rbind(subject.train, subject.test)

# Now I'll add the subjects to the combined data
combined$subject <- as.factor(subject$V1)

# Re-order columns
combined <- combined[,c(563,562,1:561)]

##################################################################################################################
######################################## STEP 3: Descriptive Names ###############################################
##################################################################################################################

# Read in Column Names
features <- read.table("features.txt")[2]

# Converting features to character so I can rename variable names
try <- NULL
for (i in 1:dim(features)[1]){
  t <- as.character(features[i,])
  try <- c(try,t)
}
colnames(combined)[3:563] <- try
names(combined)

##################################################################################################################
######################################## STEP 4: Extract Mean, Std ###############################################
##################################################################################################################

# Extract all columns with mean
combined.means <- combined[grep("ean",names(combined))]


# Extract all columns with sd
combined.std <- combined[grep("std",names(combined))]


# Merge mean and std tables (also subject and activity)
combined.narrow <- cbind(combined$subject,combined$activity, combined.means,combined.std)
names(combined.narrow)[1:2] <- c("subject", "activity")

##################################################################################################################
######################################## STEP 5: Tidy Dataset ####################################################
##################################################################################################################

# Average of each variable for each activity and subject
combined.tidy <- combined.narrow %>% group_by(subject,activity) %>% 
  summarize_all(funs(mean))

combined.tidy <- as.data.frame(combined.tidy)

write.table(combined.tidy, file="tidy.data.txt")

