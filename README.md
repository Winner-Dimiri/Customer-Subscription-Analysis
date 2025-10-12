# Customer Behaviour Analysis
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

- **Project Title:** E-Commerce Customer Behaviour Analysis.

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

**Business Questions**
- Who are our top customers?
- What categories or channels drive the highest revenue?
- How do demographics influence purchase behaviour?
- How does discount usage affect loyalty and returns?
- Which segments should marketing target for retention or upsell?

### Data Preparation
The dataset provides each customer’s average Purchase_Amount and Frequency_of_Purchase (monthly).To calculate total spending per customer, derived metrics, Monthly_Revenue and AnnualRevenue were created:
Monthly_Revenue = Purchase_Amount × Frequency_of_Purchase
Annual_Revenue = Monthly_Revenue × 12


**RFM Adaptation:** The dataset represents one record per customer rather than transaction-level data. Therefore, a traditional RFM (Recency, Frequency, Monetary) model could not be directly applied. To derive similar insights, I implemented an Engagement-Weighted RFM approach, where “Recency” was redefined as engagement recency using ad interaction levels i.e the Engagement_with_Ad column, “Frequency” used the customer’s reported purchase frequency, and “Monetary” reflected their annual revenue. This adaptation is to preserve the RFM analysis while aligning with the dataset’s structure. This approximation allows meaningful revenue-based analyses, such as identifying high-value customers and top-performing product categories.

**Return Behavior:** The original ReturnRate column contained limited variation (0, 1, 2), representing how often customers returned purchases rather than a true percentage. To make the feature analytically meaningful, I categorized it into behavioral segments: No Returns, Occasional Returns, and Frequent Returns in order to evaluate how return behavior correlates with loyalty, satisfaction, and spending.

**Loyalty_Score:** Customer loyalty is a multi-dimensional construct, so I created a composite score combining several behavioral indicators.
