### Story 9 – Data Exploration and Preprocessing Summary

In this task, I worked on the Titanic dataset to understand the basics of data exploration and preprocessing.

I began by loading the dataset and analyzing its structure using functions like `head()`, `info()`, and `describe()`. This helped me get a clear understanding of the dataset, including the different columns, their data types, and overall statistics.

Next, I checked for missing values and duplicate records in the dataset. I found that some columns such as **Age** and **Embarked** had missing values, while the **Cabin** column contained a large number of missing entries. To handle this, I filled the missing values in the Age column using the median, as it is less affected by extreme values. For the Embarked column, I used the mode since it is a categorical feature. The Cabin column was dropped because it had too many missing values and was not useful for basic analysis.

After cleaning the data, I focused on understanding the problem. The target variable in this dataset is **Survived**, which indicates whether a passenger survived or not. This makes it a classification problem because the output is binary (0 or 1). I selected important features such as passenger class (Pclass), gender (Sex), age, fare, and embarkation point, as these are key factors that influence survival chances.

To prepare the dataset for machine learning, I converted categorical variables like **Sex** and **Embarked** into numerical format using one-hot encoding. This step is important because machine learning models require numerical input rather than text values.

Finally, I created a cleaned version of the dataset with all preprocessing steps applied and saved it as **titanic_cleaned.csv**. This cleaned dataset will be used for further machine learning tasks in the next steps.
