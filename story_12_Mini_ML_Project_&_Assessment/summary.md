Story 12.1 – Build a Mini ML Project


This project builds a Machine Learning Classification Model using the Online Shoppers Intention Dataset to predict whether a website visitor will generate revenue (make a purchase) or not. The objective is to analyze customer browsing behavior and identify potential buyers.

The dataset was loaded, cleaned, and preprocessed by converting categorical features into numerical values using Label Encoding. The dataset was then divided into 80% and 20% subsets to compare model performance on different data sizes.

For both subsets, the data was split into training and testing sets. A Random Forest Classifier was trained to predict the Revenue outcome. Model performance was evaluated using Accuracy Score, Classification Report, and Confusion Matrix. Feature Importance analysis was also performed to identify which customer behavior factors most influence purchase decisions.

Technologies Used
Python
Pandas
NumPy
Scikit-learn
Random Forest Classifier
Jupyter Notebook

Output
Successfully predicted customer purchase behavior.
Generated training and testing accuracy scores.
Produced classification reports and confusion matrices.
Identified the most influential features affecting revenue generation.

Story 12.2 – Food Delivery Delay Prediction


This project develops a Machine Learning Classification Model to predict whether a food order will be delivered on time or late based on delivery-related factors. The goal is to help businesses improve delivery planning and customer satisfaction.

The Food Delivery dataset was loaded and cleaned by removing missing values. A new target variable called Late_Delivery was created by converting delivery time into two categories: delayed and on-time deliveries. Categorical features such as weather conditions, traffic levels, time of day, and vehicle type were converted into numerical values using Label Encoding.

The dataset was divided into training and testing sets, and a Random Forest Classifier was trained to predict delivery delays. Model performance was evaluated using Accuracy Score, Classification Report, and Confusion Matrix. Feature Importance analysis was performed to determine which factors most influence delivery delays.

The results showed that Traffic Level and Preparation Time were among the most important factors affecting delivery performance.

Output
Predicted whether deliveries would be delayed.
Generated accuracy score.
Produced classification report and confusion matrix.
Identified key factors affecting delivery delays.
Found that traffic conditions and preparation time significantly impact delivery performance.
