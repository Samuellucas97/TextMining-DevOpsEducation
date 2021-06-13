#!/bin/bash

# Visit this website for more information: https://www.cs.waikato.ac.nz/~remco/weka_bn/node13.html


## COMMOM VARIABLES
TRAINING_PATH="/home/samuel/Documents/TextMining-DevOpsEducation/datasets/"
FOLDS_CROSS_VALIDATION=10
MODEL_SUPERVISED="weka.classifiers.functions.MultilayerPerceptron"
FILE_NAMES=("challenges_dataset_preprocessed_sample_80" "recommendations_dataset_preprocessed_sample_80")
OUTPUT_PATH="/home/samuel/Documents/"


## MLP model parameters 

##### Best results:
# challenges [Base reduzida 1 (80%) - 133 neuronios, 1.000 iterações e 0.1 de taxa de aprendizado] - 72.41
# recommedations [Base reduzida 1 (80%) - 207 neurônios, 100 iterações e 0.1 de taxa de aprendizado ] 80.88
#####

SEEDS=(5 10 15 20 25 30)

## Creating with challenges parameters by default
LEARNING_RATE=0.1
EPOCH=1000
NUMBER_OF_NEURONIAN=133



for FILE_NAME in "${FILE_NAMES[@]}"
do
	if [ "${FILE_NAME}" = "challenges_dataset_preprocessed_sample_80" ]
	then
		
		echo "Executing challenges....\n"
		
		for SEED in "${SEEDS[@]}"
		do
			java -classpath weka.jar -Xmx1024M  \
		 		$MODEL_SUPERVISED -L $LEARNING_RATE -M 0.8 -N $EPOCH -V 0 -S $SEED -E 20 -H $NUMBER_OF_NEURONIAN \
				-t "${TRAINING_PATH}${FILE_NAME}.arff" -x $FOLDS_CROSS_VALIDATION \
				>& "${OUTPUT_PATH}mlp_${FILE_NAME}_learnig${LEARNING_RATE}_neuro${NUMBER_OF_NEURONIAN}_epochs${EPOCH}_seed_${SEED}.txt" &
		done		
	else 
	
		echo "Executing recommendations....\n"
		
		LEARNING_RATE=0.1
		EPOCH=100
		NUMBER_OF_NEURONIAN=207
		
		for SEED in "${SEEDS[@]}"
		do
			java -classpath weka.jar -Xmx1024M  \
		 		$MODEL_SUPERVISED -L $LEARNING_RATE -M 0.8 -N $EPOCH -V 0 -S $SEED -E 20 -H $NUMBER_OF_NEURONIAN \
				-t "${TRAINING_PATH}${FILE_NAME}.arff" -x $FOLDS_CROSS_VALIDATION \
				>& "${OUTPUT_PATH}mlp_${FILE_NAME}_learnig${LEARNING_RATE}_neuro${NUMBER_OF_NEURONIAN}_epochs${EPOCH}_seed_${SEED}.txt" &
		done	
	fi
done

echo "Finished execution!\n"

