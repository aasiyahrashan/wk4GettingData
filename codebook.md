---
title: "codebook"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

The subjects performed the activites while carrying a smartphone. Measurements were then obtained using the phone.

The original data was here.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The tidy dataset contains the mean, per subject-activity combination, of each measurement taken. 

There are 180 observations in the tidy data, which means that there are 180 combinations of subset and activity. There are 80 variables, 79 of which are mean or sd variables and 1 variable, subject_activity, contains the subject-activity combination.

The 79 variables which contain the mean of the measurements are recorded in the same units as the variables in the original data were recorded.

Each variable conatains the mean measurement for each group. Variable names are the same as names of the variables in the original data.

The variable subject_activity contains the group (combination of subject and activity) for which the means have been calculated.