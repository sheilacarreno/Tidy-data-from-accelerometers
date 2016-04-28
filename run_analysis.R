
# Tidy data from accelerometers (Samsung Galaxy S smartphone)
#----------------------------------------------------------------------
# 0. STEP - Choose the path where de files are
# 1. STEP- Merges the training and the test sets to create one data set.
#          Appropriately labels the data set with descriptive variable names
# 2. STEP - Uses descriptive activity names to name the activities in the data set
# 3. STEP - Extracts only the measurements on the mean and standard deviation for each measurement
# 4. STEP - From the data set in step 4, creates a second, independent tidy data set with the 
#          average of each variable for each activity and each subject.


#0. STEP - Choose the path where de files are
#--------------------------------------------------------------------
#Path
setwd("E:/Tesis/2016_04_04_GettingAndCleaningData/Proyecto/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/")

# 1. STEP- Merges the training and the test sets to create one data set.
# Appropriately labels the data set with descriptive variable names
#-----------------------------------------------------------------------
# Read lables that we need
labels<-read.table("features.txt",strip.white=TRUE)[,2]
activity_labels<-read.table("activity_labels.txt",strip.white=TRUE)

#Read train data, subject and labeles
train<-read.table("train/X_train.txt",strip.white=TRUE)
names(train)<-labels
train_subject<-read.table("train/subject_train.txt",strip.white=TRUE)
names(train_subject)<-"subject"
train_activity<-read.table("train/y_train.txt",strip.white=TRUE)
names(train_activity)<-"activity"

# subject + labels + train data
train<-cbind(train_subject,train_activity,train)

# Read test data, subject and labeles
test<-read.table("test/X_test.txt",strip.white=TRUE)
names(test)<-labels
test_subject<-read.table("test/subject_test.txt",strip.white=TRUE)
names(test_subject)<-"subject"
test_activity<-read.table("test/y_test.txt",strip.white=TRUE)
names(test_activity)<-"activity"

# subject + labels + test data
test<-cbind(test_subject,test_activity,test)

# Join train and test: data= train + test
data<-rbind(train,test)

# 2. STEP - Uses descriptive activity names to name the activities in the data set
#-----------------------------------------------------------
#Change activity number for activity labels
for(i in 1:dim(activity_labels)[1]){
    data[which(data$activity==i),2]<-as.character(activity_labels[i,2])
}
#Change "-" from the name to "_"
names(data)<-gsub("-","_",names(data)) 

# 3. STEP - Extracts only the measurements on the mean and standard deviation for each measurement
#----------------------------------------------------------------------
#Extracts only the measurements on the mean and standard deviation for each measurement.
# Create mean.txt file and sd.txt file
MEAN<-apply(data[,-c(1,2)],2,mean)
names(MEAN)<-c("subject","activity","mean")
write.table(t(MEAN),"mean.txt",sep=";",col.names=TRUE,row.names=FALSE,quote=FALSE)

SD<-apply(data[,-c(1,2)],2,sd)
write.table(t(SD),"sd.txt",sep=";",col.names=TRUE,row.names=FALSE,quote=FALSE)

# 4 STEP - From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
#-------------------------------------------------------------------------------
data2<-NULL
for(i in 1:30){
  Ni<-which(data[,1]==i)
  for(j in 1:dim(activity_labels)[1]){
        Nj<-which(data[Ni,2]==activity_labels[j,2])
        MEAN2<-apply(data[Ni[Nj],-c(1,2)],2,mean)
        data2<-rbind(data2,c(i,as.character(activity_labels[j,2]),MEAN2))
  }
}
names(data2)[1:2]<-c("subject","activity")
write.table(data2,"subject_activity_mean.txt",sep=";",col.names=TRUE,row.names=FALSE,quote=FALSE)
