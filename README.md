# Customer Subscription Analysis
---

## Contents

[Project Overview](#project-overview)

[Dataset Summary](#dataset-summary)

[Tools Used](#tools-used)

[Data Cleaning and Preparation](#data-cleaning-and-preparation)

[Exploratory Data Analysis](#exploratory-data-analysis)

[Visualizations](#visualizations)

[Insights](#insights)

[Recommendations](#recommendations)

### Project Overview 

- **Project Title:** Sales Performance Analysis For Business Optimization.

- **Project Description:** This project focuses on leveraging customer subscription data to uncover actionable insights into customer behavior, subscription lifecycles, and revenue performance. The analysis aims to highlight key customer segments, cancellation patterns, and revenue drivers. The final deliverable is a Power BI dashboard with insights that enable stakeholders to monitor subscription trends, understand churn behavior, and make data-driven decisions to improve customer retention and revenue growth.

- **Business Task:** To analyze customer subscription data to identify trends, patterns, and anomalies in cancellations, renewals, and revenue, enabling the business to design targeted strategies for customer retention and revenue optimization.

- **Objectives:** The objectives of this project are:
  1. **Customer Segmentation:** Identify customer groups by region, subscription type, and cancellation behavior.

  2. **Churn Analysis:** Track subscription cancellations and end dates to understand churn patterns.

  3. **Revenue Trends:** Monitor revenue contributions by region, subscription type, and customer segment.

  4. **Subscription Lifecycle Insights:** Track start and end dates to analyze subscription duration and renewal patterns.

  5. **Interactive Reporting:** Build a Power BI dashboard with slicers and filters for real-time, drill-down analysis.
	
	
 ### Dataset Summary

- **Dataset Structure:** The dataset contains the following data fields, as described below:

	| Column               | Description                                                              |
	|----------------------|--------------------------------------------------------------------------| 
	| CustomerID           | Unique identifier for each Customer                                      |
	| CustomerName         | Name of each customer                                                    |
	| Region               | Geographical location of each customer                                   | 
	| SubscriptionType     | Type of subscription a customer enrolled                                 |
	| SubscriptionStart    | The date when a customer’s subscription began                            |
 	| SubscriptionEnd      | The date when a customer’s subscription ended                            |
	| Canceled             | Indicates whether the subscription was canceled                          |
  	| Revenue              | Total revenue generated from a customer during their subscription period |

The subscription categories include Basic, Standard, Premium while the regions are East, West, North, and South.

- **Data Source:** the data used for this analysis is the Capstone Project Dataset provided by the Incubator Hub as part of the 2024 Data Analysis Training Program.

### Tools Used

- **Microsoft Excel:** for data cleaning, formatting, and preliminary analysis
- **Structured Query Language (SQL):** for data querying and exploration
- **Power BI:** for data visualization and dashboard creation.

### Data Cleaning and Preparation
During the data cleaning and preparation phase, I carried out the following actions:
- **Data loading and inspection:** loaded the dataset and inspected its structure for inconsistencies.
- **Handling Currency:** I renamed the `Revenue` column to `Revenue_NGN` to reflect that the values are in Naira (₦), in order to provide clearer insight and prevent potential misinterpretation of financial data. [Click here to view the SQL query](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L3-L5)
- **Handling missing values:** checked for missing values. I noticed that the dataset provided for this capstone project included sales data across two years (2023 and 2024). However, 2024 only contained data for 8 months (January to August), while 2023 had full-year data. To ensure a fair year-over-year comparison and avoid bias due to unequal time periods, I filtered the 2023 data to include only January to August. This allowed me to accurately analyze trends and performance across consistent timeframes. While part of this analysis considers the complete sales data for 2023, the primary focus is on the corresponding January–August timeframe to ensure a fair comparison with the available 2024 data. [Click here to view the SQL query](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L7-L12)
- **Data Type Conversion:** Converted the data types of Quantity and UnitPrice from SMALLINT to INT to accommodate larger values in the Revenue column. [Click here to view the SQL query](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L16-L21)
- **Column Creation:** for a more efficient and insightful analysis, I introduced additional derived columns, including:
  1.
  2.

### Exploratory Data Analysis
- **Descriptive Analysis:** To get the initial insight from the data by calculating: Total customers, total revenue, total active vs. churned customers, Average subscription duration,
Cancellation counts by region and subscription type. The SQL Results are shown below.

- **Segmentation Analysis:** This section comprises of a dive into finding how 
