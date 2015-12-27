# Getting and Cleaning Data Course Project

This repository contains two files in addition to this README file:
* An R Script that downloads and converts the data set for the course project into readable data frames. The code is explained in its comments. This one script does all the work required for the assignment. It will write two files:
1. The tidy data set produced in steps 1-4 of the assignment called tidy_data_simple.txt
2. The tidy data set produced in step 5 of the assignment called tidy_data_means.txt
* The corresponding codebook explaining the variables and what the script does.

For further info please consult the code book.

## Update
Since the assignment asks for an explanation of what the code does, I have copied here the section on the R script from the code book:

Attention: For performing the analysis in the run_analysis.R script you need to have the dplyr package installed.

What the R script does is explained in the following steps. <i>The first two steps are commented out because apparently for grading these steps are not required.</i>
1. Check if the current working directory is the correct working directory. If not, the working directory is - if necessary - created and set.
2. If not already in the working directory the dataset is downloaded and extracted - unless this has been done before.
3. All relevant files are read into R with read.table or readLines. Already at this stage the column names later extracted from the dataset are preprocessed.
A conscious choice was taken to exclude the angle() variables with means over them and only include those that are direct calculations of means from signal values according to the instructions "Extracts only the measurements on the mean and standard deviation for each measurement".
4. Relevant columns are selected from the original dataset and columns for activity, subject, and environment of the set are attached. This step is realized using the dplyr package.
5. Both training and test sets are combined to make a single data frame.
6. Column names are improved by setting to all lowercase (less error prone) and spelling out features.
7. Activity labels are added to the activity column.
8. The additional data set required in step 5 of the assignment is created by grouping the data frame by subject and activity and then calculating the means of each variable.
9. Finally, both resulting data frames are written to text files.