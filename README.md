## Introduction

This repository contains a aplication of Text Mining technique in DevOps Challenges and Recommendations to teach related in the paper [Challenges and Recommendations in DevOps Education: A Systematic Literature Review](https://dl.acm.org/doi/10.1145/3422392.3422496). 


### Table of Content

- [Problem description](#problem-description)
- [Datasets description](#datasets-description)
- [Preprocessing](#preprocessing)

## Problem description

In previous work, It was realized  a systematic literature review where DevOps challenges and recommendations was found. Also, these challenges and recommendations was manually thematized in 7 themes: [assessment](#assessment), [curriculum](#curriculum), [tools](#tools), [classes preparation](#classes-preparation), [devops concepts](#devops-concepts), [environment setup](#environment-setup) and [pedagogy](#pedagogy). **Therefore, as work propose, I wait to realize a thematization of theses challenges and recommendations using some models of classification**.

|        Theme        |                                                                                                                                                    Description                                                                                                                                                   |
|:-------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|      Curriculum     | The Curriculum theme is related to the content, hourly load and the number of  subjects needed to use DevOps. The relationship between the DevOps discipline  and the prerequisite disciplines of this subject is also considered, as well  as the interaction with the others of a software engineering course. |
|        Tools        |                                                                       The Tool theme includes software used to operationalize DevOps practices.  They can be those widely used in the industry or those created with a teaching  standard.                                                                       |
|      Assessment     |                                                       The Assessment theme includes necessary and permanent didactic tasks in  the teacher's work with the objective of diagnosing the learning situation  of each student, in relation to the curriculum.                                                       |
| Classes preparation |                                                                             The topic Classes preparation refers to the planning of the course, including,  for example, a research of reference material and preparation of classes.                                                                            |
|   Devops concepts   |                                                                                                           The DevOps Concepts are related to its main foundations, techniques  and mentality (culture).                                                                                                          |
|  Environment setup  |                                                                                 The Environment setup theme refers to the preparatory activities  of the environments used in the practices of students' exercises and projects.                                                                                 |
| Pedagogy            | References to the subject of Pedagogy are related to a set of  techniques, principles, methods, and strategy for education and teaching.                                                                                                                                                                         |

## Datasets description

There are 2 dataset file (in _Weka_ format ): `challenges_dataset.arff` and `recommendations_dataset.arff`. In the [challenges_dataset.arff](https://github.com/Samuellucas97/TextMining-DevOpsEducation/blob/main/datasets/challenges_dataset.arff), there are 73 instances and 2 atributtes: `challenge` and `theme`.  In the [recommendations_dataset.arff](https://github.com/Samuellucas97/TextMining-DevOpsEducation/blob/main/datasets/recommendations_dataset.arff), there are 85 instances and 2 atributtes: `recommendation` and `theme`.  



