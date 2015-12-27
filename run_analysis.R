## Apparently downloading the content and setting the working directory is not part of the assignment. 
## Should you not have the dataset in your working directory please uncomment the following lines.
## If already in folder getting_data_project, skip next two steps
#if(!grepl("getting_data_project",getwd())) {
#        # Set working directory to a fresh directory created for this purpose
#        if(!file.exists("getting_data_project")) {
#                dir.create("getting_data_project")
#                }
#        # then set working directory
#        setwd("getting_data_project")
#}
## Downloaded the file to working directory if it doesn't exist already
#if(!file.exists("course_project_dataset.zip")) {
#        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile= "course_project_dataset.zip", method="curl")
#}
# Unzip the file if not done yet.
if(!file.exists("UCI HAR Dataset")) {
        unzip("course_project_dataset.zip")
}

# Get column names & activity labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("ID","Feature"),colClasses = c("numeric","character"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("ID","Activity_Name"))

# Preprocess column names & introduce a capital Q where there are opening brackets. The capital Q does not otherwise occur here.
# This is needed in order to identify the correct "means" columns when subsetting columns later. Then remove all non-letter characters.
coltitles <- sub("\\(","Q",features$Feature)
coltitles <- make.names(coltitles)
coltitles <- gsub("\\.","",coltitles)

# Get test data
test_set <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = coltitles)
test_activity_ID <- as.numeric(readLines("UCI HAR Dataset/test/y_test.txt"))
test_subject <- as.numeric(readLines("UCI HAR Dataset/test/subject_test.txt"))

# Get training data
train_set <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = coltitles)
train_activity_ID <- as.numeric(readLines("UCI HAR Dataset/train/y_train.txt"))
train_subject <- as.numeric(readLines("UCI HAR Dataset/train/subject_train.txt"))


library(dplyr)

# Label test and training sets before joining tables
test_set <- test_set %>% select(matches('meanQ|stdQ')) %>%
        mutate(subject = test_subject, activity = test_activity_ID, set = "test")
train_set <- train_set %>% select(matches('meanQ|stdQ')) %>%
        mutate(subject = train_subject, activity = train_activity_ID, set = "train")

# Combine test set and training set
clean_data_set <- rbind(test_set,train_set)
# reorder columns so the ID columns, i.e. subject, activity and set are first
clean_data_set <- clean_data_set[,c(67:69,1:66)]
# Remove the capital Q used for marking the needed columns from column names
colnames(clean_data_set) <- gsub("Q","",colnames(clean_data_set))
# Improve readability of column names
colnames(clean_data_set) <- tolower(colnames(clean_data_set))
colnames(clean_data_set) <- gsub("acc","acceleration",colnames(clean_data_set))
colnames(clean_data_set) <- gsub("^t","time",colnames(clean_data_set))
colnames(clean_data_set) <- gsub("^f","frequency",colnames(clean_data_set))
colnames(clean_data_set) <- gsub("std","standarddeviation",colnames(clean_data_set))
colnames(clean_data_set) <- gsub("mag","magnitude",colnames(clean_data_set))
colnames(clean_data_set) <- gsub("gyro","gyroscope",colnames(clean_data_set))

# Convert subject, activity, and set variables to factor variables (for activity with labels from the activity_labels.txt file)
clean_data_set$subject <- factor(clean_data_set$subject)
clean_data_set$activity <- factor(clean_data_set$activity,label = tolower(activity_labels$Activity_Name))
clean_data_set$set <- factor(clean_data_set$set)

# Create the additional dataset required in step 5 calculating the means of each variable for each subject and activity.
additional_data_set <- group_by(clean_data_set,subject,activity)
additional_data_set <- summarise_each(additional_data_set,funs(mean),-one_of("subject","activity","set"))
colnames(additional_data_set)[4:68] <- paste0("meanof",colnames(additional_data_set)[4:68])

write.table(clean_data_set,"tidy_data_simple.txt", row.names = FALSE)
write.table(additional_data_set,"tidy_data_means.txt",row.names = FALSE)
