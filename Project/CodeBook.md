
#CodeBook.md

Data shown in the tidyData corresponds to the following information, transformed from the following files

'subject' corresponds to the information loaded from the following files,
* /UCI HAR Dataset/train/subject_train.txt
* /UCI HAR Dataset/test/subject_test.txt

'activity' corresponds to the information loaded from,
* /UCI HAR Dataset/train/X_train.txt
* /UCI HAR Dataset/test/X_test.txt

'activity' labels are assigned from the follwing activity list described in
* /UCI HAR Dataset/activity_labels.txt

All measurements were read from
* /UCI HAR Dataset/train/y_train.txt
* /UCI HAR Dataset/test/y_test.txt

Labels were assigned accordingly to the labels in,
* /UCI HAR Dataset/features.txt

'features' labels were transformd for a better compenhension. Characters were removed and the following abbreviations where removed:
"Acc"-> "acceleration"
"t"-> "time"
"f"-> "frequency"
"Gyro" -> "gyroscope"
"Mag" -> "magnitude"
"std" -> "standarddeviation"
