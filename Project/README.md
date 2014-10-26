
#README.md

Repository includes the follwoing files:

* CodeBook.md : Describes the variables and transformations to the data
* run_analysis.R : Script for reading, and creating the tidyData file. 
* tidyData.txt : Tidy data generated through the run_analysis script
* /UCI HAR Dataset folder : Raw Data in multiple text files.

#run_analysis
The script works as follows,
1. Files are declared, and read using read.table()
2. Labels are cleaned and changed to use descriptive labels.
3. Activity columns are changed to use descriptive activity names.
4. Columns are concatenated, for Test data and Train Data.
5. Test and Train Data are merged together.
6. Merged data is cleaned by usuing regex to get only: subject, activity, mean and std deviations for each measuement.
7. A tidyData file is created.

