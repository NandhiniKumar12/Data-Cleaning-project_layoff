# Data Cleaning Project: Layoff Analysis

## Introduction

This project involves cleaning and preparing a dataset related to layoffs in various companies across different industries and locations. The dataset includes key information such as the company name, location, industry, the total number and percentage of employees laid off, the date of layoffs, company stage, country, and total funds raised in millions.

### Dataset Overview

The dataset contains the following fields:

- **Company**: Name of the company where layoffs occurred.
- **Location**: The geographic location of the company.
- **Industry**: The business sector to which the company belongs.
- **Total Laid Off**: The number of employees laid off.
- **Percentage Laid Off**: The percentage of the company's workforce affected by the layoffs.
- **Date**: The date when layoffs were announced or occurred.
- **Stage**: The stage of the company (e.g., startup, growth stage).
- **Country**: The country where the company operates.
- **Funds Raised (Millions)**: Total amount of funding the company has raised, in millions.

### Project Goals

The main objective of this project is to clean and transform the dataset to ensure it is ready for analysis. To achieve this, **MySQL** was used for the data cleaning process, involving the following key steps:

- **Handling missing or incomplete data** using SQL queries to identify and address gaps in location, industry, and funding fields.
- **Joining multiple tables** where necessary to enrich the dataset with additional context, using SQL `JOIN` operations.
- **Grouping and aggregating data** to ensure consistency and remove duplicates or irrelevant data points.
- **Using Common Table Expressions (CTEs)** to break down complex queries and perform sequential transformations on the data.
- **Standardizing data formats** such as date fields, percentage calculations, and currency values to ensure uniformity across the dataset.

### Tools and Techniques

The entire data cleaning process was executed using SQL queries within a **MySQL** database environment. Some of the key SQL techniques employed include:

- **JOIN** operations to combine related tables.
- **GROUP BY** and aggregation functions to summarize the data.
- **Common Table Expressions (CTEs)** to simplify complex transformations.
- **Data validation and filtering** to remove duplicates and outliers.

### Datasets

- **Uncleaned Dataset**: [[Link to Uncleaned Data]](https://github.com/NandhiniKumar12/Data-Cleaning-project_layoff/blob/main/layoffs.csv)(#)
- **Cleaned Dataset**: [Link to Cleaned Data](#)

### Conclusion

By the end of this project, the dataset has been cleaned, validated, and transformed, making it ready for further analysis. The cleaned dataset can now be used to explore trends in layoffs across industries, examine the impact of company funding on layoffs, and analyze geographic patterns in workforce reductions.
