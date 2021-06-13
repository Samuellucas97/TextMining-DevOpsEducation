#!/bin/bash

# Visit this website for more information: https://www.cs.waikato.ac.nz/~remco/weka_bn/node13.html

## COMMOM VARIABLES
TRAINING_PATH="/home/samuel/Documents/TextMining-DevOpsEducation/datasets/"
OUTPUT_PATH="/home/samuel/Documents/"

FILE_NAMES=("challenges_dataset_preprocessed_without_class" "recommendations_dataset_preprocessed_without_class")

MODEL_SUPERVISED="weka.clusterers.HierarchicalClusterer"
FOLDS_CROSS_VALIDATION=10


## Hierarchical model parameters 
NUMBER_GROUPS=(2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 )

MEASURE_DISTANCE="MEAN"
DISTANCE_FUNCTION="weka.core.EuclideanDistance -R first-last" 


for FILE_NAME in "${FILE_NAMES[@]}"
do
	if [ "${FILE_NAME}" = "challenges_dataset_preprocessed_sample_80" ]
	then
		echo "Executing hierarchical model to challenges...\n\n"
		
		for NUMBER_GROUP in "${NUMBER_GROUPS[@]}"
		do		
			java -classpath weka.jar -Xmx1024M  \
		 		$MODEL_SUPERVISED -N $NUMBER_GROUP -L $MEASURE_DISTANCE -P -A $DISTANCE_FUNCTION \
				-t "${TRAINING_PATH}${FILE_NAME}.arff" -x $FOLDS_CROSS_VALIDATION \
				>& "${OUTPUT_PATH}_hierarchical_${FILE_NAME}_numberGroups_${NUMBER_GROUP}_euclideanDistance_${MEASRE_DISTANCE}.txt" &
		done		
	else 
		echo "Executing hierarchical model to recommendations...\n"
		
		for NUMBER_GROUP in "${NUMBER_GROUPS[@]}"
		do		
			java -classpath weka.jar -Xmx1024M  \
		 		$MODEL_SUPERVISED -N $NUMBER_GROUP -L $MEASURE_DISTANCE -P -A $DISTANCE_FUNCTION \
				-t "${TRAINING_PATH}${FILE_NAME}.arff" -x $FOLDS_CROSS_VALIDATION \
				>& "${OUTPUT_PATH}_hierarchical_${FILE_NAME}_numberGroups_${NUMBER_GROUP}_euclideanDistance_${MEASRE_DISTANCE}.txt" &
		done	
	fi
done
