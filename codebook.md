---
title: "codebook"
author: "Eder Orjuela"
date: "1/10/2020"
output: html_document
---

#Codebook

##Tidy Dataset
The tidy data set is located on your working directory after the script run_analysis.R is executed. The name of the tidy Dataset is called tidyDataSet.txt
*Dataset dimensions <- 180 rows X 82 columns
*Columns
+First: Subject: This column refers to the person who uses the device.
+Second: Activity: Six different activities to be measured (Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying) 
+Other: The other columns show data about accelerometer and gyroscope information. Specifically, the mean and the standard deviation.

##Data transformation
1. The different files were analyzed to identify which of them were necessary to work with. The files selected were those related with: Train data, test data, activity labels, and features labels.
2. Train data: loaded into r and combined by columns – 3 different data set.
3. Test data: loaded into r and combined by columns - 3 different data set.
4. Activity: loaded into R to be used to identify the different activities through the dataset.
5. Features: loaded into R. Some text is replaced to identify clearly Mean and Standard Deviation features.
6. Merge data: Train data and test data are merged by rows. According to the data set merged the column names are: first column = Subject, second column = Activity, other columns = features, specifically those that specify information about mean and standard deviation.
7. Transform activities into factors.
8. The final dataset is reshaped in order to become subjects and activities into variables.
9. The dataset is saved as tidyDataSet.txt. This file is located on your working directory.
