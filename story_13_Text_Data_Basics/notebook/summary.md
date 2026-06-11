
# Story 13.1 – Working with Text in Python

## Project Summary

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

## Methodology

1. Loaded the customer review dataset.
2. Selected the review text column for analysis.
3. Removed missing review entries.
4. Converted all text to lowercase.
5. Removed punctuation and special characters.
6. Removed extra spaces from the text.
7. Combined all reviews into a single text corpus.
8. Split text into individual words.
9. Calculated word frequencies using Counter.
10. Removed common stop words.
11. Identified the top 20 most frequent meaningful words.
12. Visualized results using a bar chart.
13. Generated a Word Cloud for text visualization.

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

## Output Explanation

### 1. Dataset Inspection

The dataset structure, dimensions, column information, and missing values were examined to understand the quality of the data before analysis.

### 2. Text Cleaning Output

The review text became standardized by:

* Converting all text to lowercase.
* Removing punctuation marks.
* Removing extra spaces.
* Removing missing records.

This improved consistency and reduced noise in the analysis.

### 3. Word Frequency Analysis

The frequency count showed how often each word appeared in customer reviews. This helped identify the most commonly discussed topics.

### 4. Top 20 Words Bar Chart

A bar chart was created to display the twenty most frequently occurring meaningful words. Higher bars represented words that appeared more often in customer reviews.

### 5. Word Cloud Visualization

A Word Cloud was generated to visually represent word frequency. Larger words indicate higher occurrence within the review text. This visualization quickly highlighted customer interests and common discussion themes.

## Conclusion

This task demonstrated the complete workflow of basic text analytics, including text cleaning, preprocessing, word frequency analysis, stop word removal, and visualization. The results provided valuable insights into customer opinions and purchasing experiences while introducing fundamental Natural Language Processing (NLP) concepts.
