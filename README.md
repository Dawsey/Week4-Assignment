# Assignment 4 - Getting and Cleaning Data

This README document summarises the analysis undertaken in the `run_analysis.r` file.

### Assessment Criteria

The following criteria have been met:

1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

# Importing the Data

Data was imported using `read.table2` and column names applied at the same time. The path specification was also applied to allow files to be read from the unzipped file, so files do not need to be individually moved to the working folder.

# The Analysis

### 1. Merges the training and the test sets to create one data set

The `test`, `train` and `subject` datasets were first combined using `rbind` to append them to their x/y and test/train equivalents.

All data sets were then bound together using `cbind` into the `combined.df` dataframe. 

### 2. Extracts only the measurements on the mean and standard deviation for each measurement

The mean (mean) and standard deviation (std) variables were extracted. I chose to include leading upper case `Mean` and `Std` variables as well using `tolower(names(xAll))` and gives 86 variables.

### 3. Uses descriptive activity names to name the activities in the data set

The data was joined with the `activitylabels` using the `merge` function.

### 4. Appropriately labels the data set with descriptive variable names

There was not a large amount of changes required here, since the code book defines the variable names. However in order to comply with tidy data guidelines, the following was undertaken:

- parenthesis were removed from the variable names
- x, y and z values were suffixed with "axis"
- the initial t value was replaced with "time"
- the initial f value was replaced with "frequency"
- hyphens were replaced with underscores for consistency

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

Summarising the data was done using the `dplyr` package grouping on `subject`, `activity_id` and `activity`. The `summarise_all(funs(mean))` function then calculated the mean of all other variables.
