# read training data
train_x <- read.table('./train/X_Train.txt')
train_y <- read.table('./train/y_train.txt')
train_subject <- read.table('./train/subject_train.txt')
# read testing data
test_x <- read.table('./test/X_Test.txt')
test_y <- read.table('./test/y_test.txt')
test_subject <- read.table('./test/subject_test.txt')

# read common data
activity_labels = read.table('./activity_labels.txt')
features <- read.table('./features.txt')

#name columns in 1 column data set
names(test_y) <- c("Activity")
names(train_y) <- c("Activity")
names(test_subject) <- c("Subject")
names(train_subject) <- c("Subject")

# names for the data sets (test_x, train_x) with 561 columns
feature_names <- gsub("[\\(\\)]","", features[,2])
feature_names <- gsub("Acc", "Accelerometer", feature_names) # expand some abbreviations
feature_names <- gsub("Gyro", "Gyroscope", feature_names)
feature_names <- gsub("^f", "Frequency", feature_names) # change first letter "f" to Frequency
feature_names <- gsub("^t", "Time", feature_names) # change first letter "t" to Time
feature_names <- gsub("[,-]([a-zA-Z0-9])", "\\U\\1", feature_names, perl=TRUE) # remove dashes or commas, and capitalize the following letter
names(test_x) <- feature_names
names(train_x) <- feature_names
train = cbind(train_x, train_y, train_subject)
test = cbind(test_x, test_y, test_subject)
full_data = rbind(train, test)
full_data$Activity = activity_labels[full_data$Activity[],2] # convert the activity column to descriptive names
mean_cols <- grep("mean", feature_names, ignore.case=TRUE)
stdev_cols <- grep("std", feature_names, ignore.case=TRUE)
means = cbind(full_data$Subject, full_data$Activity, full_data[, mean_cols])
names(means)[0] = "Subject"
names(means)[1] = "Activity"
std = cbind(full_data$Subject, full_data$Activity, full_data[, stdev_cols])
names(std)[0] = "Subject"
names(std)[1] = "Activity"