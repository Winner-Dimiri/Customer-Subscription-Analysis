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

- **Project Description:** This project focuses on transforming raw e-commerce customer data into actionable insights using Power BI, SQL, and Excel. The goal was to analyze customer purchasing behavior, loyalty, and satisfaction to uncover trends that drive sales growth, customer retention, and marketing optimization.

Using interactive visualizations and data modeling techniques, the project segments customers based on purchase frequency and spending patterns. It identifies the factors influencing buying decisions such as discount sensitivity, social media influence, and engagement with ads, to help businesses make data-driven decisions.

The result is a dynamic Power BI dashboard that provides a complete view of customer behavior, enabling stakeholders to improve targeting, personalize campaigns, and enhance customer lifetime value.

- **Business Task:** To analyze customer behavior patterns and identify opportunities to:
  1. Increase customer retention and loyalty program participation.
  2. Optimize marketing strategies based on behavioral insights.
  3. Improve sales forecasting and campaign targeting.
  4. Understand key drivers of purchase intent, discount sensitivity, and customer satisfaction.

- **Objectives:** The objectives of this project are:
  1. Quantify revenue drivers: which categories, devices and channels produce the most revenue.
  2. Identify high-value customers and recommend retention/upsell strategies.
  3. Segment customers by behaviour.
  4. Evaluate marketing/channel effectiveness (social influence, ad engagement, discount sensitivity).
  5. Identify friction areas: high return rates, long time-to-decision, low satisfaction.
  6. Provide prioritized, data-driven recommendations for marketing and product teams.

**Business Questions**
  1. What customer demographics and behavioral patterns drive the highest sales and loyalty?
  2. How do purchase frequency, product category, and purchase channel influence total revenue?
  3. What impact do discounts, social media, and ad engagement have on customer spending and retention?
  4. How do product ratings, return rates, and satisfaction levels affect repeat purchases?
  5. Which customer segments and marketing strategies offer the greatest potential for business growth?

	
 ### Dataset Summary

- **Key Features**:
  1. **Customer Demographics:** age, income, gender, and education level for better segmentation and targeted marketing.
  2. **Purchase Behavior:** Includes purchase amount, frequency, category, and channel preferences to assess spending patterns.
  3. **Customer Loyalty:** Features like brand loyalty, engagement with ads, and loyalty program membership provide insights into long-term customer retention.
  4. **Product Feedback:** Customer ratings and satisfaction levels for analysis of product quality and customer sentiment.
  5. **Decision-Making:** Time spent on product research, time to decision, and purchase intent reflecting how customers make purchasing decisions.
  6. **Influences on Purchase:** Factors such as social media influen.ce, discount sensitivity, and return rates are included to analyze how external factors affect purchasing behavior.

- **Assumptions and Data Understanding:**
  1. The dataset is customer-level (1000 unique customers). Columns like Purchase_Amount and Frequency_of_Purchase appear to describe per-customer behaviour (not raw transactions).

  2. Frequency_of_Purchase = number of purchases per month.

  3. Purchase_Amount = average amount per purchase. I used the common assumption: MonthlyRevenue = Purchase_Amount * Frequency_of_Purchase.

- **Data Source:** Kaggle - Ecommerce Consumer Behavior Analysis Data by Salahuddin Ahmed

### Tools Used

- **Microsoft Excel:** for data cleaning, formatting, and preliminary analysis
- **Structured Query Language (SQL):** for data querying and exploration
- **Power BI:** for data visualization and dashboard creation.

### Data Preparation
1. The dataset provides each customer’s average Purchase_Amount and Frequency_of_Purchase (monthly).To calculate total spending per customer, derived metrics, Monthly_Revenue and AnnualRevenue were created:
Monthly_Revenue = Purchase_Amount × Frequency_of_Purchase
Annual_Revenue = Monthly_Revenue × 12
[You can view the SQL query here]()






**RFM Adaptation:** The dataset represents one record per customer rather than transaction-level data. Therefore, a traditional RFM (Recency, Frequency, Monetary) model could not be directly applied. To derive similar insights, I implemented an Engagement-Weighted RFM approach, where “Recency” was redefined as engagement recency using ad interaction levels i.e the Engagement_with_Ad column, “Frequency” used the customer’s reported purchase frequency, and “Monetary” reflected their annual revenue. This adaptation is to preserve the RFM analysis while aligning with the dataset’s structure. This approximation allows meaningful revenue-based analyses, such as identifying high-value customers and top-performing product categories.

**Return Behavior:** The original ReturnRate column contained limited variation (0, 1, 2), representing how often customers returned purchases rather than a true percentage. To make the feature analytically meaningful, I categorized it into behavioral segments: No Returns, Occasional Returns, and Frequent Returns in order to evaluate how return behavior correlates with loyalty, satisfaction, and spending.

**Loyalty_Score:** Customer loyalty is a multi-dimensional construct, so I created a composite score combining several behavioral indicators.
