# Week 4 Assignment run_analysis

library(readr)
# Read in the data
    features <- read_table2("features.txt", col_names = c("n","feature")) #col.names = 
    xTest <- read_table2("X_test.txt", col_names = features$feature)
    xTrain <- read_table2("X_train.txt", col_names = features$feature)
    yTest <- read_table2("y_test.txt", col_names = "activity_id")
    yTrain <- read_table2("y_train.txt", col_names = "activity_id")
    subTrain <- read_table2("subject_train.txt", col_names = "subject")
    subTest <- read_table2("subject_test.txt", col_names =  "subject")
    activityLabels <- read_table2("activity_labels.txt", col_names = c("activity_id","activity"))

# Merge the datasets
    xAll <- rbind(xTest, xTrain) # Combine the measurements
    #xAll <- xAll[,grep("mean|std", tolower(names(xAll)))] # tolower used as some means have capital M.
    xAll <- xAll[,grep("mean|std", names(xAll))] # remove lower case means and std.
    
    yAll <- rbind(yTest, yTrain) # Combine the activities
 
    subjectAll <- rbind(subTest, subTrain) # Combine the subject IDs
    
    combined.df <- cbind(subjectAll,yAll,xAll)
    combined.df <- merge(combined.df, activityLabels, 
                         by.x = "activity_id", by.y = "activity_id")

# Group and calculate mean values using dplyr
    library(dplyr)
    
        finalData <- combined.df %>%
            group_by(subject, activity_id, activity) %>%
                summarise_all(funs(mean)) 
        
        finalData <- finalData[,-2] # Remove the Activity ID leaving only the description
        names(finalData) <- (gsub("[()]","",names(finalData))) # Remove parenthesis

# Final Checks
        # Check for completeness
        summary(complete.cases(finalData)) # 180 True (i.e no missing cases)
        
