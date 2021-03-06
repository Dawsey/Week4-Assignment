## Data Summary

The original data was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

There are 88 variables in the final data set. Each subject (30 of them) undertook six activities which therefore provides 6 x 30 = 180 rows.

An example of the final data set is provided below:

subject activity time_BodyAcc_me~ time_BodyAcc_me~ time_BodyAcc_me~ time_BodyAcc_st~
    <int> <chr>               <dbl>            <dbl>            <dbl>            <dbl>
1       1 WALKING             0.277         -0.0174           -0.111           -0.284 
2       1 WALKING~            0.255         -0.0240           -0.0973          -0.355 

## Unit of Measure

The original units are compiled from normalised z-scores (min = -1 and max = 1) this can be demonstrated by using the `summary` function on the original data set. 

The final dataset provides the mean value of these scores. The class of variables is integer for `subject`, character for 'activity' and numeric for all remaining variables.

## Variables

All variables for the final data set are provided below.

[1] "subject"                               
 [2] "activity"                              
 [3] "time_BodyAcc_mean_Xaxis"               
 [4] "time_BodyAcc_mean_Yaxis"               
 [5] "time_BodyAcc_mean_Zaxis"               
 [6] "time_BodyAcc_std_Xaxis"                
 [7] "time_BodyAcc_std_Yaxis"                
 [8] "time_BodyAcc_std_Zaxis"                
 [9] "time_GravityAcc_mean_Xaxis"            
[10] "time_GravityAcc_mean_Yaxis"            
[11] "time_GravityAcc_mean_Zaxis"            
[12] "time_GravityAcc_std_Xaxis"             
[13] "time_GravityAcc_std_Yaxis"             
[14] "time_GravityAcc_std_Zaxis"             
[15] "time_BodyAccJerk_mean_Xaxis"           
[16] "time_BodyAccJerk_mean_Yaxis"           
[17] "time_BodyAccJerk_mean_Zaxis"           
[18] "time_BodyAccJerk_std_Xaxis"            
[19] "time_BodyAccJerk_std_Yaxis"            
[20] "time_BodyAccJerk_std_Zaxis"            
[21] "time_BodyGyro_mean_Xaxis"              
[22] "time_BodyGyro_mean_Yaxis"              
[23] "time_BodyGyro_mean_Zaxis"              
[24] "time_BodyGyro_std_Xaxis"               
[25] "time_BodyGyro_std_Yaxis"               
[26] "time_BodyGyro_std_Zaxis"               
[27] "time_BodyGyroJerk_mean_Xaxis"          
[28] "time_BodyGyroJerk_mean_Yaxis"          
[29] "time_BodyGyroJerk_mean_Zaxis"          
[30] "time_BodyGyroJerk_std_Xaxis"           
[31] "time_BodyGyroJerk_std_Yaxis"           
[32] "time_BodyGyroJerk_std_Zaxis"           
[33] "time_BodyAccMag_mean"                  
[34] "time_BodyAccMag_std"                   
[35] "time_GravityAccMag_mean"               
[36] "time_GravityAccMag_std"                
[37] "time_BodyAccJerkMag_mean"              
[38] "time_BodyAccJerkMag_std"               
[39] "time_BodyGyroMag_mean"                 
[40] "time_BodyGyroMag_std"                  
[41] "time_BodyGyroJerkMag_mean"             
[42] "time_BodyGyroJerkMag_std"              
[43] "freq_BodyAcc_mean_Xaxis"               
[44] "freq_BodyAcc_mean_Yaxis"               
[45] "freq_BodyAcc_mean_Zaxis"               
[46] "freq_BodyAcc_std_Xaxis"                
[47] "freq_BodyAcc_std_Yaxis"                
[48] "freq_BodyAcc_std_Zaxis"                
[49] "freq_BodyAcc_meanFreq_Xaxis"           
[50] "freq_BodyAcc_meanFreq_Yaxis"           
[51] "freq_BodyAcc_meanFreq_Zaxis"           
[52] "freq_BodyAccJerk_mean_Xaxis"           
[53] "freq_BodyAccJerk_mean_Yaxis"           
[54] "freq_BodyAccJerk_mean_Zaxis"           
[55] "freq_BodyAccJerk_std_Xaxis"            
[56] "freq_BodyAccJerk_std_Yaxis"            
[57] "freq_BodyAccJerk_std_Zaxis"            
[58] "freq_BodyAccJerk_meanFreq_Xaxis"       
[59] "freq_BodyAccJerk_meanFreq_Yaxis"       
[60] "freq_BodyAccJerk_meanFreq_Zaxis"       
[61] "freq_BodyGyro_mean_Xaxis"              
[62] "freq_BodyGyro_mean_Yaxis"              
[63] "freq_BodyGyro_mean_Zaxis"              
[64] "freq_BodyGyro_std_Xaxis"               
[65] "freq_BodyGyro_std_Yaxis"               
[66] "freq_BodyGyro_std_Zaxis"               
[67] "freq_BodyGyro_meanFreq_Xaxis"          
[68] "freq_BodyGyro_meanFreq_Yaxis"          
[69] "freq_BodyGyro_meanFreq_Zaxis"          
[70] "freq_BodyAccMag_mean"                  
[71] "freq_BodyAccMag_std"                   
[72] "freq_BodyAccMag_meanFreq"              
[73] "freq_BodyBodyAccJerkMag_mean"          
[74] "freq_BodyBodyAccJerkMag_std"           
[75] "freq_BodyBodyAccJerkMag_meanFreq"      
[76] "freq_BodyBodyGyroMag_mean"             
[77] "freq_BodyBodyGyroMag_std"              
[78] "freq_BodyBodyGyroMag_meanFreq"         
[79] "freq_BodyBodyGyroJerkMag_mean"         
[80] "freq_BodyBodyGyroJerkMag_std"          
[81] "freq_BodyBodyGyroJerkMag_meanFreq"     
[82] "angletime_BodyAccMean,gravity"         
[83] "angletime_BodyAccJerkMean,gravityMean" 
[84] "angletime_BodyGyroMean,gravityMean"    
[85] "angletime_BodyGyroJerkMean,gravityMean"
[86] "angleXaxis,gravityMean"                
[87] "angleYaxis,gravityMean"                
[88] "angleZaxis,gravityMean"
