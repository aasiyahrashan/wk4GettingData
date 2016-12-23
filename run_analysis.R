#Week 4 assignment
test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/Y_test.txt")
test_sub <- read.table("test/subject_test.txt")

train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/Y_train.txt")
train_sub <- read.table("train/subject_train.txt")

#Variable names are in the features.txt file. I am asigning the contents of this file as 
#the variable names of the x files

na <- read.table("features.txt")
na <- na$V2
na <- as.character(na)
names(train_x) <- na
names(test_x) <- na

#The y files contain the labels with the activity code. cbinding the activity ot the x files
train_xy <- cbind(train_x,train_y)
test_xy <- cbind(test_x,test_y)
test_xy$activity <- test_xy$V1
train_xy$activity <- train_xy$V1
train_xy$V1 <- NULL
test_xy$V1 <- NULL
##The sub files contain the subjects. cbinding to get train and test datasets
#Then assigning new name to subject variable and deleting old one
train <- cbind(train_xy,train_sub)
str(train_sub$V1)
str(train$V1)
test <- cbind(test_xy,test_sub)
test$subject <- test$V1
train$subject <- train$V1
train$V1 <- NULL
test$V1 <- NULL
##rbinding train and test to get full dataframe
tt <- rbind(train,test)

##Step 2 in the assignment
##Selecting only variables containing mean() or std(). Including the freq one. Also keeping
##activity and subject varaibles since these are key.

tt <- tt[,grep("mean()|std()|activity|subject", names(tt))]

##Step 3 in the assignment
##Naming the activities
tt$activity <- factor(tt$activity, levels = c(1, 2, 3, 4, 5, 6), 
     labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", 
                "STANDING", "LAYING"))
##Step 4 in the assignment
##The variables are already named using the original naming method.
##I think these are meaningful and informative

##Step 5 getting the means.
summary(tt$subject)
nt <- aggregate(tt, list(tt$subject, tt$activity) ,mean)
##The number in the subject_activity variable is the subject and the word is the activity
nt$subject_activity <- paste(nt$Group.1,nt$Group.2,sep="_")
#Removing old variables containing individual subject and activity
nt$Group.1 <- NULL
nt$Group.2 <- NULL
nt$activity <- NULL
nt$subject <- NULL
##Exporting nt out.
write.table(nt,"Week4data",row.names = FALSE)
data <- read.table("Week4data", header = TRUE)
