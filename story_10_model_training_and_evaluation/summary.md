## Story 10 – Model Training and Evaluation

### Overview
In this story, a basic machine learning model was developed and evaluated using the Titanic dataset. The goal was to understand how a model learns from data and how its performance can be measured using different evaluation techniques.

---

### Story 10.1 – Model Training

In this phase, the cleaned dataset was used for building the model. The data was divided into training and testing sets to ensure that the model is evaluated on unseen data. A Logistic Regression model was chosen as it is suitable for binary classification problems like predicting survival.

- The dataset was split into:
  - **80% Training Data**
  - **20% Testing Data**
- The model was trained using the training dataset.
- Predictions were made on the test dataset.
- Performance was initially evaluated using:
  - **Accuracy Score**
  - **Confusion Matrix (visualized using heatmap)**

The confusion matrix helped in understanding how many predictions were correct and where the model was making mistakes.

---

### Story 10.2 – Model Evaluation

After training the model, a deeper evaluation was performed using additional metrics. This step helped in understanding the model performance beyond just accuracy.

- The following metrics were calculated:
  - **Precision**
  - **Recall**
  - **F1 Score**
- A **Classification Report** was generated to summarize results for:
  - Survived (1)
  - Not Survived (0)

These metrics provided a better understanding of how well the model performs in identifying both classes correctly.

---

### Key Learnings

- Accuracy alone does not give a complete picture of model performance.
- Precision helps in understanding how correct the positive predictions are.
- Recall shows how well the model captures actual positive cases.
- **F1 Score is the most important metric** in this problem as it balances both precision and recall.
- Confusion Matrix provides a clear visual understanding of prediction results.

---

### Conclusion

This story demonstrates the complete workflow of training and evaluating a simple machine learning model. It highlights the importance of using multiple evaluation metrics to better understand model performance and make more reliable conclusions.
