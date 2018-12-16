# Week 4 Assignment run_analysis

#Download the data
    filename <- "Assignment4_Final.zip"

# Checking if archieve already exists.
    if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method="curl")
    }  

# Checking if the unzipped folder exists and unzip if it doesn't
    if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
    }

library(readr)
# Read in the data and set column names on import
    features <- read_table2("./UCI HAR Dataset/features.txt", 
                            col_names = c("n","feature"))
    xTest <- read_table2("./UCI HAR Dataset/test/X_test.txt", 
                            col_names = features$feature)
    xTrain <- read_table2("./UCI HAR Dataset/train/X_train.txt", 
                            col_names = features$feature)
    yTest <- read_table2("./UCI HAR Dataset/test/y_test.txt", 
                            col_names = "activity_id")
    yTrain <- read_table2("./UCI HAR Dataset/train/y_train.txt", 
                            col_names = "activity_id")
    subTrain <- read_table2("./UCI HAR Dataset/train/subject_train.txt", 
                            col_names = "subject")
    subTest <- read_table2("./UCI HAR Dataset/test/subject_test.txt", 
                            col_names =  "subject")
    activityLabels <- read_table2("./UCI HAR Dataset/activity_labels.txt", 
                            col_names = c("activity_id","activity"))

# Merge the datasets
    xAll <- rbind(xTest, xTrain) # Combine the measurements
    xAll <- xAll[,grep("mean|std", tolower(names(xAll)))] # tolower used as some means have capital M and std have capital S.
    
    yAll <- rbind(yTest, yTrain) # Combine the activities
 
    subjectAll <- rbind(subTest, subTrain) # Combine the subjects
    
    combined.df <- cbind(subjectAll,yAll,xAll)
    combined.df <- merge(combined.df, activityLabels, 
                         by.x = "activity_id", by.y = "activity_id")

# Group by Subject and calculate mean values using dplyr
    library(dplyr)
    
    finalData <- combined.df %>%
                    group_by(subject, activity_id, activity) %>%
                    summarise_all(funs(mean)) 

# Tidy the data
        finalData <- finalData[,-2] # Remove the Activity ID leaving only the description
        names(finalData) <- (gsub("[()]","", names(finalData))) # Remove parenthesis
        names(finalData) <- (gsub("X","Xaxis",names(finalData)))
        names(finalData) <- (gsub("Y","Yaxis",names(finalData)))
        names(finalData) <- (gsub("Z","Zaxis",names(finalData)))
        names(finalData) <- (gsub("tB","time_B",names(finalData)))
        names(finalData) <- (gsub("tG","time_G",names(finalData)))
        names(finalData) <- (gsub("fG","freq_G",names(finalData)))
        names(finalData) <- (gsub("fB","freq_B",names(finalData)))
        names(finalData) <- (gsub("-","_",names(finalData)))
        
# Final Checks
        # Check for completeness
        summary(complete.cases(finalData)) 
        # 180 True (i.e no missing cases)

# Export data
        write.table(finalData, "finalData.txt", row.names = FALSE)
        
