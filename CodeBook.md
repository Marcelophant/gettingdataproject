# Getting and Cleaning Data Course Project

## General Description

This is a course project for the coursera course "Getting and Cleaning Data". Raw data comes from a study where 30 subjects were asked to record their activity with a Samsung phone during six different activities. This produced signals from the accelerometer and gyroscope 3-axial raw signals which were further processed into the data contained in the dataset.

The script in this repository does all the steps from downloading the raw dataset through reading the data into R and merging all relevant data into one data frame to writing it into a text file.

The dataset was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## R Script run_analysis.R
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

### Quick explanation of terms appearing in the variable names
* time : Time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median                      filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
* frequency : Values obtained from a Fast Fourier Transform (FFT) of the original value.
* bodyacceleration / gravityacceleration : Triaxial acceleration from the accelerometer (total acceleration) and the                 estimated body acceleration. Acceleration signal was then separated into body and gravity                           acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
* bodygyroscope : Triaxial Angular velocity from the gyroscope or calculations on these.
* jerk : Body linear acceleration and angular velocity were derived in time to obtain Jerk signals.
* magnitude : The magnitude of these three-dimensional signals were calculated using the Euclidean norm.
* mean / standard deviation : This dataset was purposefully created including only measurements on mean and standard                  deviation of the value in question.
* x/y/z   : Denotes the 3-axial signals in the X, Y and Z directions.

### Variables in clean_data_set
The tydied data set is contained in the "clean_data_set" data.frame and is written to the "tidy_data_simple.txt" file. It contains the following columns:

1. subject:      An identifier of the subject who carried out the experiment. Its range is from 1 to 30. 
2. activity:     Its activity label taking one of six values: "walking", "walking_upstairs", "walking_downstairs",                    "sitting", "standing","laying" 
3. set:          The environment in which the data was recorded, with values "train" for the training environment  

* The following variables are understood by the combination of words explained in the previous chapter.

4. timebodyaccelerationmeanx
5. timebodyaccelerationmeany 
6. timebodyaccelerationmeanz                                 
7. timebodyaccelerationstandarddeviationx                     
8. timebodyaccelerationstandarddeviationy                     
9. timebodyaccelerationstandarddeviationz                     
10. timegravityaccelerationmeanx                               
11. timegravityaccelerationmeany                               
12. timegravityaccelerationmeanz                               
13. timegravityaccelerationstandarddeviationx                  
14. timegravityaccelerationstandarddeviationy                  
15. timegravityaccelerationstandarddeviationz                  
16. timebodyaccelerationjerkmeanx                              
17. timebodyaccelerationjerkmeany                              
18. timebodyaccelerationjerkmeanz                              
19. timebodyaccelerationjerkstandarddeviationx                 
20. timebodyaccelerationjerkstandarddeviationy                 
21. timebodyaccelerationjerkstandarddeviationz                 
22. timebodygyroscopemeanx                                     
23. timebodygyroscopemeany                                     
24. timebodygyroscopemeanz                                     
25. timebodygyroscopestandarddeviationx                        
26. timebodygyroscopestandarddeviationy                        
27. timebodygyroscopestandarddeviationz                        
28. timebodygyroscopejerkmeanx                                 
29. timebodygyroscopejerkmeany                                 
30. timebodygyroscopejerkmeanz                                 
31. timebodygyroscopejerkstandarddeviationx                    
32. timebodygyroscopejerkstandarddeviationy                    
33. timebodygyroscopejerkstandarddeviationz                    
34. timebodyaccelerationmagnitudemean                          
35. timebodyaccelerationmagnitudestandarddeviation             
36. timegravityaccelerationmagnitudemean                       
37. timegravityaccelerationmagnitudestandarddeviation          
38. timebodyaccelerationjerkmagnitudemean                      
39. timebodyaccelerationjerkmagnitudestandarddeviation         
40. timebodygyroscopemagnitudemean                             
41. timebodygyroscopemagnitudestandarddeviation                
42. timebodygyroscopejerkmagnitudemean                         
43. timebodygyroscopejerkmagnitudestandarddeviation
44. frequencybodyaccelerationmeanx                             
45. frequencybodyaccelerationmeany                             
46. frequencybodyaccelerationmeanz                             
47. frequencybodyaccelerationstandarddeviationx                
48. frequencybodyaccelerationstandarddeviationy                
49. frequencybodyaccelerationstandarddeviationz                
50. frequencybodyaccelerationjerkmeanx                         
51. frequencybodyaccelerationjerkmeany                         
52. frequencybodyaccelerationjerkmeanz                         
53. frequencybodyaccelerationjerkstandarddeviationx            
54. frequencybodyaccelerationjerkstandarddeviationy            
55. frequencybodyaccelerationjerkstandarddeviationz            
56. frequencybodygyroscopemeanx                                
57. frequencybodygyroscopemeany                                
58. frequencybodygyroscopemeanz                                
59. frequencybodygyroscopestandarddeviationx                   
60. frequencybodygyroscopestandarddeviationy                   
61. frequencybodygyroscopestandarddeviationz                   
62. frequencybodyaccelerationmagnitudemean                     
63. frequencybodyaccelerationmagnitudestandarddeviation        
64. frequencybodybodyaccelerationjerkmagnitudemean           
65. frequencybodybodyaccelerationjerkmagnitudestandarddeviation
66. frequencybodybodygyroscopemagnitudemean
67. frequencybodybodygyroscopemagnitudestandarddeviation
68. frequencybodybodygyroscopejerkmagnitudemean
69. frequencybodybodygyroscopejerkmagnitudestandarddeviation

### Variables in additional_data_set
The additional data set ("additional_data_set" written to the "tidy_set_means.txt" file) contains the following variables:

* subject & activity:   Identical to subject and activity in clean_data_set.
* all other variables:  Mean of the equivalent value in clean_data_set for each subject and activity.

## Study Description and Credits
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The study was carried out by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto at the Smartlab - Non Linear Complex Systems Laboratory of Università degli Studi di Genova.