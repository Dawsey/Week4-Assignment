# Week 4 Assignment run_analysis

library(readr)
# Read in the data
    xTest <- read_table2("X_test.txt", col_names = FALSE)
    xTrain <- read_table2("X_train.txt", col_names = FALSE)
    features <- read_table2("features.txt", col_names = FALSE)
    

    # Review the data
    nrow(xTrain)+nrow(xTest) # Total length of both datasets - should = 10299
    head(xTest)
    head(xTrain)

    summary(complete.cases(xTest ))
    summary(complete.cases(xTrain ))
    sum(complete.cases(xTrain))-nrow(xTrain)
    sum(complete.cases(xTest))-nrow(xTest)


# Merge the datasets
    merged <- rbind(xTest, xTrain)
    names(merged) <- features$X2 # need to clean up features names

# Tidy the data
    # Remove parenthesis from column names using gsub
    names(merged) <- (gsub("[()]","",names(merged)))

    # Check for completeness
    summary(complete.cases(merged)) # All True (no missing cases)
    
# RUle of Tidy data - Names of Variables should not be duplicated
    # The following if statement checks for duplicate column names and then
    # presents the user with a selection to show the names or not.
    
    if (any(duplicated(names(merged))==TRUE)) { # Duplicates present
           
        if(menu(c("Yes", "No"), 
                graphics=FALSE, 
                title=paste0("There are ",
                             length(which(duplicated(names(merged)))),
                             " duplicate column names, would you like to see them?"))==1) {
            
            # 'Yes' is selected so list the duplicate column names   
            names(merged[(which(duplicated(names(merged))))])

        } # 'No' Selected so do nothing.
        
    } # No duplicates, so do nothing.
    
    # Duplicate examples:
    names(merged[,c(331,317)])
    # Do they contain duplicate data?
    summary(merged[,c(331,317)])
    # Apparently not.
    
# Extract only the mean and stdev measurements
    
    # mean(): Mean value
    # std(): Standard deviation
    
    mean <- merged[,grep("mean|std", tolower(names(merged)))] # tolower used as some means have capital M.
    
