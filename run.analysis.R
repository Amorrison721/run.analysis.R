#Read Test and Training Data from text file
X_train <- read.table("E:/Coursera/UCI HAR Dataset/train/X_train.txt", quote="\"")
X_test <- read.table("E:/Coursera/UCI HAR Dataset/test/X_test.txt", quote="\"")

subject_test <- read.table("E:/Coursera/UCI HAR Dataset/test/subject_test.txt", quote="\"")
subject_train <- read.table("E:/Coursera/UCI HAR Dataset/train/subject_train.txt", quote="\"")

Y_train <- read.table("E:/Coursera/UCI HAR Dataset/train/y_train.txt", quote="\"")
Y_test <- read.table("E:/Coursera/UCI HAR Dataset/test/y_test.txt", quote="\"")

activity_labels <- read.table("E:/Coursera/UCI HAR Dataset/activity_labels.txt", quote="\"")
features <- read.table("E:/Coursera/UCI HAR Dataset/features.txt", quote="\"")

#Merge training set and test sets
merged_data<-rbind(X_train,X_test) 
#Add Column Names from features datasethea
colnames(merged_data)<-features[,2]
#select only mean and std (delete duplicate columns)
library(dplyr)
data_nodups <- merged_data[, !duplicated(colnames(merged_data))]
data_mean_sd<-select(data_nodups,contains("mean"),contains("std"))


#Merge subject training and test sets
merged_subject<-rbind(subject_train,subject_test)
#Add Column Name
colnames(merged_subject)<-"Subject"

#Merge training labels and test labels
merged_labels<-rbind(Y_train,Y_test)
colnames(merged_labels)<-"Activity"
#Add descriptive labels to table
merged_labels<-merge(merged_labels,activity_labels,by=1)[,2]

#Put them all together!
tidy_data<-cbind(merged_labels,merged_subject,data_mean_sd)
#Rename label column "Activity"
names(tidy_data)[1]<-"Activity"
library(reshape2)
#Compute the means, grouped by subject/activity
melted<-melt(tidy_data,id.var=c("Subject", "Activity"))
means = dcast(melted , Subject + Activity ~ variable, mean)
#save table as .txt file

write.table(means, "tidy_data.txt")

#save as excel
library(xlsx)
write.xlsx(means, "tidy_data.xlsx")

#output final dataset
means
