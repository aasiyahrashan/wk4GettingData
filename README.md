---
title: "README"
output: html_document
---
The data I submitted can be read into R using this code assuming the data is in the working directory. The data is in the long format. Each variable conatains the mean for each group. Variable names follow the names of the variables in the original data.
```{r}
data <- read.table("Week4data", header = TRUE)
```
The steps I have taken to solve this assignment are as follows.
Download and unzip the data in the working directory using this link.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

I read the readme file in the folder and I came to the conculsion that for the train and test datasets the x files contained the summary data of the experiment, the y files contained the activity codes, the sub files contained the subject id and the features file contained variable names for the 561 varaibles in the x files.

I first assigned the variable names to the vaiables in the x files using the features file.
Then I used cbind to bind the y files and the sub files to the x files. I did this separatley for the test and train data and I renamed the subject and activity variables.

Then I used rbind to combine the test and train datasets. This worked because the variable names were the same for both datasframes.

Then I selected the varaibles whose names contained  "mean()" or "std()". This included the meanFreq() variables since they also contain mean values. I also included the subject and activity variables since these are needed later on.

I then replaced the activity numbers with meaningful names by making the variable and factor and naming the levels.

I did not rename the vaiables since I have used the variable names in the original data. I consider these names meaningful and also easy to use since they are standardised e.g. all varables containing standard deviations have "std()" in the name.

I then calculated the mean for each of the varaibles in the dataset for each possible combination of subject and activity. I then created a new variable with the subject and activity names combined.

Finally I dropped the variables which had become redundant and exported the data to a .txt file.

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
