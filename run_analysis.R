# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
# The goal is to prepare tidy data that can be used for later analysis.

# process() funtion is to processes data set.
	process <- function (dataset, features, labels) {
			prefix <- paste(dataset, '/', sep = '')
			fileData <- paste(prefix, 'X_', dataset, '.txt', sep = '')
			fileLabel <- paste(prefix, 'y_', dataset, '.txt', sep = '')
			fileSubject <- paste(prefix, 'subject_', dataset, '.txt', sep = '')

		# Read file data into a data.frame and then transform it into data.table
		data <- read.table(fileData)[, features$index]
		names(data) <- features$name
		
		# Assemble label
		labelDataset <- read.table(fileLabel)[, 1]
		data$label <- factor(labelDataset, levels=labels$level, labels=labels$label)
		
		# Assemble subject
		subjectDataset <- read.table(fileSubject)[, 1]
		data$subject <- factor(subjectDataset)
		
		# Tranform to data.table
		data.table(data)
}

# action() function is to tidy data
	action <- function () {
	  # Change path to locate file 
		setwd('csv/UCI HAR Dataset/')
		
		# Locate the features
		featureDataset <- read.table('features.txt', col.names = c('index', 'name'))
		featureDataset <- subset(featureDataset, grepl('-(mean|std)[(]', featureDataset$name))
		
		# Locate the labels
		labelDataset <- read.table('activity_labels.txt', col.names = c('level', 'label'))
		
		# Process train and test datasets
		trainDataset <- process('train', featureDataset, labelDataset)
		testDataset <- process('test', featureDataset, labelDataset)

		# Assemble raw dataset
		rawDataset <- rbind(trainDataset, testDataset)
		
		# Generate tidy dataset
		tidyDataset <- rawDataset[, lapply(.SD, mean), by=list(label, subject)]
		
		# rename variables
		names <- names(tidyDataset)
		names <- gsub('-mean', '_mean', names)
		names <- gsub('-std', '_std', names)
		names <- gsub('[()-]', '', names)
		names <- gsub('BodyBody', 'Body', names) # Replace `BodyBody' by `Body'		
		setnames(tidyDataset, names)
		
		# Write raw dataset and tidy dataset to files
		setwd('../../')
		write.table(rawDataset, file = 'rawdata.txt', row.names = FALSE)
		write.table(tidyDataset, file = 'tidydata.txt', row.names = FALSE, quote = FALSE)

    # Return tidy dataset
		tidyDataset	
}
