#!/bin/bash

# Visit this website for more information: https://www.cs.waikato.ac.nz/~remco/weka_bn/node13.html


## COMMOM VARIABLES
TRAINING_PATH="/home/samuel/Documents/TextMining-DevOpsEducation/datasets/"
FOLDS_CROSS_VALIDATION=10
FILE_NAMES=("challenges_dataset_preprocessed_sample_80" "recommendations_dataset_preprocessed_sample_80")
OUTPUT_PATH="/home/samuel/Documents/"

MODEL_SUPERVISED="weka.clusterers.SimpleKMeans"

## k-Means model parameters 
Ks=(2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 )
SEEDS=(5 10 15 20 25 30)
DISTANCE_FUNCTION="weka.core.EuclideanDistance -R first-last" 

for FILE_NAME in "${FILE_NAMES[@]}"
do
	if [ "${FILE_NAME}" = "challenges_dataset_preprocessed_sample_80" ]
	then
		echo "Executing k-Mean to challenges...\n\n"
		
		for K in "${Ks[@]}"
		do
			for SEED in "${SEEDS[@]}"
			do
				java -classpath weka.jar -Xmx1024M  \
			 		$MODEL_SUPERVISED -init 0 -max-candidates 100 -periodic-pruning 10000 -min-density 2.0 \
			 		-t1 -1.25 -t2 -1.0 -N $K -A ${DISTANCE_FUNCTION} -I 500 -num-slots 1 -S $SEED \
					-t "${TRAINING_PATH}${FILE_NAME}.arff" \
					>& "${OUTPUT_PATH}mlp_${FILE_NAME}_learnig${LEARNING_RATE}_neuro${NUMBER_OF_NEURONIAN}_epochs${EPOCH}_seed_${SEED}.txt" &
			done
		done		
	else 
		echo "Executing k-Means to recommendations...\n"
		
		for K in "${Ks[@]}"
		do
			for SEED in "${SEEDS[@]}"
			do
				java -classpath weka.jar -Xmx1024M  \
			 		$MODEL_SUPERVISED -init 0 -max-candidates 100 -periodic-pruning 10000 -min-density 2.0 \
			 		-t1 -1.25 -t2 -1.0 -N $K -A ${DISTANCE_FUNCTION} -I 500 -num-slots 1 -S $SEED \
					-t "${TRAINING_PATH}${FILE_NAME}.arff" \
					>& "${OUTPUT_PATH}mlp_${FILE_NAME}_learnig${LEARNING_RATE}_neuro${NUMBER_OF_NEURONIAN}_epochs${EPOCH}_seed_${SEED}.txt" &
			done
		done	
	fi
done
