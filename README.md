# E-Commerce Customer Behaviour Analysis
---

## Contents

[Project Overview](#project-overview)

[Dataset Summary](#dataset-summary)

[Tools Used](#tools-used)

[Data Cleaning and Preparation](#data-cleaning-and-preparation)

[Visualizations](#visualizations)

[Key Insights](#key-insights)

[Strategic Recommendations](#strategic-recommendations)

### Project Overview 

- **Project Title:** E-Commerce Customer Behaviour Analysis.

- **Project Description:** This project focuses on transforming raw e-commerce customer data into actionable insights using Power BI, SQL, and Excel. The goal is to analyze customer demographics, purchasing behavior, loyalty, and satisfaction to uncover trends that drive sales growth, customer retention, and marketing optimization. The project segments customers based on demographics, purchase frequency and spending patterns. It identifies the factors influencing buying decisions such as discount sensitivity, social media influence, and engagement with ads, to help the business make data-driven decisions. The result is an interactive Power BI dashboard that provides a complete view of customer behavior, with key insights and recommendations, enabling stakeholders to improve targeting, personalize campaigns, and enhance customer lifetime value.

- **Business Task:** To analyze customer behavior patterns and identify opportunities to:
  1. Increase customer retention and loyalty program participation.
  2. Optimize marketing strategies based on behavioral insights.
  3. Improve sales forecasting and campaign targeting.
  4. Understand key drivers of purchase intent, discount sensitivity, and customer satisfaction.

- **Objectives:** The objectives of this project include:
  1. Quantify revenue drivers: which categories, devices and channels produce the most revenue.
  2. Identify high-value customers and recommend retention/upsell strategies.
  3. Segment customers by behaviour.
  4. Evaluate marketing/channel effectiveness (social influence, ad engagement, discount sensitivity).
  5. Identify friction areas: high return rates, long time-to-decision, low satisfaction.
  6. Provide prioritized, data-driven recommendations for marketing and product teams.

- **Business Questions**
  1. What customer demographics and behavioral patterns drive the highest sales and loyalty?
  2. How do purchase frequency, product category, and purchase channel influence total revenue?
  3. What impact do discounts, social media, and ad engagement have on customer spending and retention?
  4. How do return rates and satisfaction levels affect repeat purchases?
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

### Data Cleaning and Preparation
- Aggregated and cleaned missing and inconsistent values for better accuracy.

- **Derived Columns:**
  1. **Monthly and Annual Revenue:** The dataset provides each customer’s average Purchase_Amount and Frequency_of_Purchase (monthly). To calculate total spending per customer, derived metrics, Monthly_Revenue and AnnualRevenue were created.

     [You can view the SQL query here](https://github.com/Winner-Dimiri/E-commerce-Customer-Behaviour-Analysis-Power-BI-SQL-Excel/blob/main/E-commerceCustomerAnalysis.sql#L1-L13)

  2. **Purchase_Month:** extracted month from purchase date to visualize seasonal sales trends and monthly revenue changes.

     [View the SQL query here](https://github.com/Winner-Dimiri/E-commerce-Customer-Behaviour-Analysis-Power-BI-SQL-Excel/blob/main/E-commerceCustomerAnalysis.sql#L16-L21)

  3. **Age_Group:**	categorized customers into defined age ranges (<25, 25-34, 35-33, >44) for demographic-based insights.
	 
	 [View the SQL query here](https://github.com/Winner-Dimiri/E-commerce-Customer-Behaviour-Analysis-Power-BI-SQL-Excel/blob/main/E-commerceCustomerAnalysis.sql#L24-L34)

  4. **RFM_Score:** the dataset represents one record per customer rather than transaction-level data. Therefore, a traditional RFM (Recency, Frequency, Monetary) model could not be directly applied. To derive similar insights, I implemented an Engagement-Weighted RFM approach, where “Recency” was redefined as engagement recency using ad interaction levels, that is the Engagement_with_Ad column, “Frequency” used the customer’s reported purchase frequency, and annual revenue for “Monetary”. This adaptation is to preserve the RFM analysis while aligning with the dataset’s structure. This approximation allows meaningful revenue-based analyses, such as identifying high-value customers and top-performing product categories.
	  
	  [You can view the SQL query here](https://github.com/Winner-Dimiri/E-commerce-Customer-Behaviour-Analysis-Power-BI-SQL-Excel/blob/main/E-commerceCustomerAnalysis.sql#L37-L84)

  5. **Customer_Segment:** grouped customers by RFM Score into three segments: Gold, Silver, and Bronze.
	  
	  [View the SQL query here](https://github.com/Winner-Dimiri/E-commerce-Customer-Behaviour-Analysis-Power-BI-SQL-Excel/blob/main/E-commerceCustomerAnalysis.sql#L87-L97)

  6. **Return_Behavior:** the original Return_Rate column contained limited variation (0, 1, 2), representing how often customers returned purchases rather than a true percentage. To make the feature analytically meaningful, I categorized it into behavioral segments: No Returns, Occasional Returns, and Frequent Returns in order to evaluate how return behavior correlates with loyalty, satisfaction, and spending.
	  
	  [View the SQL query here](https://github.com/Winner-Dimiri/E-commerce-Customer-Behaviour-Analysis-Power-BI-SQL-Excel/blob/main/E-commerceCustomerAnalysis.sql#L100-L110)

  7. **Loyalty_Score:** this is a multi-dimensional construct. I created a composite score combining three behavioral indicators: brand loyalty, customer satisfaction, and Engagement with Ads.
	  
	  [View the SQL query here](https://github.com/Winner-Dimiri/E-commerce-Customer-Behaviour-Analysis-Power-BI-SQL-Excel/blob/main/E-commerceCustomerAnalysis.sql#L112-L123)

  8. **Time_to_Decision_Bucket:** grouped customers based on the time taken between viewing and purchasing, to analyze decision speed patterns.

      [View the SQL query here](https://github.com/Winner-Dimiri/E-commerce-Customer-Behaviour-Analysis-Power-BI-SQL-Excel/blob/main/E-commerceCustomerAnalysis.sql#L126-L135)

### Visualizations
The dashboards below present the visual analysis and key findings

![Revenue Insights](https://github.com/Winner-Dimiri/E-commerce-Customer-Behaviour-Analysis-Power-BI-SQL-Excel/blob/main/E-commerce%20Revenue%20Insights%20Trends.png)

![Customer Behavior Analysis](https://github.com/Winner-Dimiri/E-commerce-Customer-Behaviour-Analysis-Power-BI-SQL-Excel/blob/main/Customer%20Insights%20and%20Behaviour%20Analysis.png)
  
### Key Insights

- **Demographics and Revenue Drivers:** Customers aged 25–44 and those with middle to high income levels contribute over 60% of total revenue, showing that mid-career professionals are the most profitable demographic group.

- **Behavioral Patterns:** Customers with slow decision speed generated the highest revenue with a large revenue gap from those with moderate and fast decision speeds. This suggests that more time spent on researching leads to higher purchase values. Wants-based and need-based intent generate more revenue than planned and impulsive Intent.

- **Seasonal Trends:** Sales are highest in August and during Quarter 3, while February and October record the lowest sales. This suggests that sales and marketing activities should be planned around these peak and low periods.

- **Purchase Channel and Device Trends:** Online, Mixed, and In-Store perform nearly equally, and desktop users spend slightly more than smartphone and tablet users, showing multi-device and channel engagement.

- **Discount Sensitivity and Influence Factors:** Revenue is nearly evenly split between customers who used discounts and those who didn’t, but “somewhat sensitive” buyers yield higher average revenue, suggesting they respond well to balanced promotional strategies. Additionally, high and low social media influence groups generate higher revenue, implying that both strong brand presence and organic engagement matter.

- **Product and Category Insights:** Toys & Games and Packages drive the highest revenue, while Jewelry & Electronics have higher return rates. Clothing and Arts & Crafts have low returns, suggesting strong satisfaction in those categories.

- **Customer Loyalty and Segmentation:** Silver customers (based on RFM segmentation) represent the largest and most valuable group, contributing nearly 48% of total revenue, followed by Gold at 44%, indicating solid loyalty potential in mid-tier segments. Bronze contributes minimally (8.7%).

- **Customer Satisfaction and Retention Indicators:** Despite a moderate average satisfaction score (5.4/10), customers still exhibit consistent spending behavior. This suggests potential to boost retention through improved product experience and loyalty incentives.

- **Gender and Education Insights:** Female customers drive slightly higher revenue than males, while those with Bachelor’s and High School education make up over two-thirds of total revenue.

### Strategic Recommendations
- **Enhance Customer Loyalty Programs:** Focus on Silver customers with personalized loyalty incentives and upgrade opportunities to Gold customers. These mid-tier buyers are most responsive and profitable.

- **Time promotions around seasonality:** Focus major promotions and stock planning in In Q2 and Q3 to take advantage of the high sales season. Run special offers or campaigns in February, May, and October to boost sales during these slow months.

- **Refine Target Marketing Strategies:** Prioritize marketing toward ages 25–44 and high-to-middle income earners. Invest more on desktop users, tablet users, and online channels where spending is strongest.

- **Utilize Discount Psychology:** Implement moderate discount campaigns that reward need-based and wants-based buyers without excessive reduction, appealing to “somewhat sensitive” customers who spend more overall, to maximize average revenue without erasing margins.

- **Improve Retention via Satisfaction Feedback:** Monitor satisfaction metrics and intervene in categories with return/satisfaction issues; experiment with post-purchase surveys or loyalty rewards to convert satisfied buyers into repeat customers and prevent churn.

- **Boost Engagement Through Social Media Personalization:** Build social media engagement strategies targeting both high and low-influence groups to maximize reach and retention.

- **Optimize Product Offerings by Profitability & Returns:** Promote Toys, Games, and Packages with high revenue while reassessing marketing for low-performing categories. Reduce return rates by implementing quality checks, product info improvements, and other return-reduction measures.

- **Encourage Research and Consideration:** Since slow decision-makers spend more, create interactive buying guides and product comparison tools to engage users longer before purchase, which brings about confidence and higher-value conversions.
