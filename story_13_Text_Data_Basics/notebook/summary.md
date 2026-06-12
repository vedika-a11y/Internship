
# Story 13.1 – Working with Text in Python


In this task, text data from a Women's E-Commerce Clothing Reviews dataset was analyzed using Python. The objective was to learn the basics of text processing and extract meaningful insights from customer review data.

The dataset contained customer reviews about clothing products. The review text was cleaned and prepared for analysis by removing missing values, converting all text to lowercase, removing punctuation marks, and eliminating unnecessary spaces. These preprocessing steps ensured that the text was consistent and suitable for further analysis.

After cleaning the data, all reviews were combined into a single text corpus. The text was then tokenized into individual words, and word frequency analysis was performed to identify the most commonly used terms by customers.

Initially, all words were counted, including common English words such as "the", "and", and "is". To obtain more meaningful insights, stop words were removed. The remaining words were analyzed again to identify the most important terms used in customer feedback.

The top 20 most frequent words were displayed using a bar chart, making it easier to visualize the dominant topics discussed in reviews. A Word Cloud was also generated, where larger words represented higher frequencies, providing a quick visual summary of customer opinions.

## Technologies Used

* Python
* Pandas
* Regular Expressions (re)
* Collections (Counter)
* Matplotlib
* WordCloud



## Key Findings

The analysis revealed that customers frequently discussed:

* Dress
* Love
* Size
* Fit
* Fabric
* Comfortable
* Beautiful
* Wear

These words indicate that customers mainly focus on product fit, comfort, sizing, fabric quality, appearance, and overall satisfaction when reviewing clothing products.


## Conclusion

This task demonstrated the complete workflow of basic text analytics, including text cleaning, preprocessing, word frequency analysis, stop word removal, and visualization. The results provided valuable insights into customer opinions and purchasing experiences while introducing fundamental Natural Language Processing (NLP) concepts.



Story 13.2 – Simple Sentiment Analysis


This project performs Sentiment Analysis on customer reviews from a women's e-commerce clothing review dataset using Python, Pandas, and TextBlob. The objective is to analyze review text and automatically determine whether customer feedback is Positive, Negative, or Neutral.

The dataset was loaded and cleaned by selecting the Review.Text column and handling missing values. The TextBlob Natural Language Processing (NLP) library was used to calculate the sentiment polarity score for each review. Based on the polarity value, a custom function classified reviews into Positive, Negative, or Neutral categories.

After sentiment classification, the sentiment labels were added as a new column to the dataset. The distribution of sentiments was then analyzed using frequency counts and visualized with a bar chart to understand overall customer opinion.

output:The bar chart clearly showed that the majority of customer reviews were Positive, indicating high customer satisfaction with the products.
