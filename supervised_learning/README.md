# supervised_learning_challenge report

## Overview of the analysis

The purpose of this analysis is to see the effect of one kind of machine learning model called 'Logistic Regression classifier' and to see the effect of one kind of random resampling method called 'Random Over Sampling'. <br><br>
The data used in this analysis is from a company that provides a peer-to-peer lending services, and the data is composed of historical lending activity of the company. <br><br>
The variable that are are trying to predict is about the status of the loan, where '0' means it is a healthy loan, and where '1' means it is a high-risk loan. Since most of the loans are healthy, there is an imbalance in the proportion of healthy loans and high-risk loans. In our given data, there are 75,036 (96.78%) healty loan data, and there are 2,500 (3.22%) of high-risk loan data. Due to this imbalance in the data, in part 2, we will use resampling method to over-sample the high-risk loan data (minority data), and we will perform Logistic Regression again to see the effect of the resampling method in prediction <br><br>
The stages of the 'Logistic Regression' will run as follow: <br>
1. Split the data into training data and test data
2. Instantiate the model 
3. fit the training data
4. Predict
5. Use balanced_accuracy_score, confusion_matrix, and classification_report to evaluate the model
<br>


The stages of the resampling (Random Over Sampling in this case) will run as follow: <br>
1. Split the data into training data and test data
2. Instantiate the model
3. fit and resample the training data
4. Use value_counts to see the result of resampled data
5. Use the resampled data to run the Logistic Regression
<br><br>

Logistic regression classifier: one kind of machine learning model that is used for two-class classification. It uses sigmoid function and maximum likelihood in order to classify data into two groups (yes vs. no, spam vs. ham, etc.) <br><br>
Random Over Sampling: This is one method of resampling technique in order to obtain a more balanced data. Ramdom over sampling randomly duplicates the data that is in the minority class


## Results
Machine Learing Model 1: <br>
- Accuracy: 96.80%
- Precision: Healthy loans (100%), High-risk loans (84%)
- Recall: Healthy loans (99%), High-risk loans (94%)

<br>

Machine Learning Model 2 (with random over sampling): <br>
- Accuracy: 99.36%
- Precision: Healthy loans (100%), High-risk loans (84%)
- Recall: Healthy loans (99%), High-risk loans (99%) 


## Summary
In summary, the Logistic Regression was able to predict the healthy loans and high-risk loans well (Accuracy was higher than 90%, and precision and recall were all higher than 80%). It was specially very good at predicting the healthy loans ('0') because we had a lot more of the healthy loan data than high-risk data. However, without oversampling, the model was not very good at predicting the high-risk loans ('1'). <br>
With oversampling method, the model was able to increase its recall with high-risk loans (from 94% to 99%), but the model was still unable to improve the precision with high-risk loans (from 84% to 84%). However, this would still be okay in our case, because increase in high-risk loan's recall means the model had improvement in detecting higk-risk loans. No improvement in precision means the model had no improvement in filtering false positive cases, but that would not be much of a concern since false positive cases will be further investigated and will be re-classified as healthy loans (cumbersome, but there won't be substantial financial consequence by not detecting high-risk loans). Therefore, since our case will value recall of high-risk loans than precision, I would say this resampling method was a good approach, and I would recommend this model in detecting credit risk of loans.




## References
- Wikipedia confusion matrix: https://en.wikipedia.org/wiki/Confusion_matrix
- Random over sampling: https://machinelearningmastery.com/random-oversampling-and-undersampling-for-imbalanced-classification/
- Logistic regression classifier: https://www.datacamp.com/tutorial/understanding-logistic-regression-python