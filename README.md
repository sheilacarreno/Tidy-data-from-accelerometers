==================================================================
Tidy data from accelerometers (Samsung Galaxy S smartphone)
==================================================================
Studyent: Sheila Carreño
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The data has:
	- 30 volunteers (age bracket of 19-48 years)
	- 6 activities:
		-- WALKING
		-- WALKING_UPSTAIRS
		-- WALKING_DOWNSTAIRS
		-- SITTING
		-- STANDING
		-- LAYING
	- Each activities has 561 variables (see in  BodeBook.txt)

==================================================================
INPUT:
	- 'features.txt': List of all features.

	- 'activity_labels.txt': Links the class labels with their activity name.

	- 'train/X_train.txt': Training set.

	- 'train/y_train.txt': Training labels.

	- 'test/X_test.txt': Test set.

	- 'test/y_test.txt': Test labels.

==================================================================
OUTPUT:
	- 'mean.txt': Measurements mean for each measurement
	- 'sd.txt': Measurements standard deviation for each measurement
	- 'subject_activity_average.txt': average of each variable for each activity and each subject
	



==================================================================
License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
