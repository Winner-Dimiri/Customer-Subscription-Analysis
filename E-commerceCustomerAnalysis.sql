--Adding the Monthy_Revenue Column
ALTER TABLE [dbo].[Ecommerce_Consumer_Data]
ADD Monthly_Revenue INT

UPDATE [dbo].[Ecommerce_Consumer_Data]
SET Monthly_Revenue = Purchase_Amount * Frequency_of_Purchase

--Adding the Annual_Revenue Column
ALTER TABLE [dbo].[Ecommerce_Consumer_Data]
ADD Annual_Revenue INT

UPDATE [dbo].[Ecommerce_Consumer_Data]
SET Annual_Revenue = Monthly_Revenue * 12
  
  
--Extracting Purchase_Month from Time of Purchase
ALTER TABLE [dbo].[Ecommerce_Consumer_Data]
ADD Purchase_Month INT

UPDATE [dbo].[Ecommerce_Consumer_Data]
SET Purchase_Month = MONTH(Time_of_Purchase)

  
--Adding Age_Group Column
ALTER TABLE [dbo].[Ecommerce_Consumer_Data]
ADD Age_Group varchar(10)

UPDATE [dbo].[Ecommerce_Consumer_Data]
SET Age_Group = CASE 
					WHEN Age < 25 THEN '<25'
					WHEN Age BETWEEN 25 AND 34 THEN '25-34'
					WHEN Age BETWEEN 35 AND 44 THEN '35-44'
					ELSE '>44'
				END

  
--Adding the Recency_Score Column
ALTER TABLE [dbo].[Ecommerce_Consumer_Data]
ADD Recency_Score INT

UPDATE [dbo].[Ecommerce_Consumer_Data]
SET Recency_Score = CASE 
						WHEN Engagement_with_Ads = 'None' THEN 0
						WHEN Engagement_with_Ads = 'Low' THEN 1
						WHEN Engagement_with_Ads = 'Medium' THEN 3
						WHEN Engagement_with_Ads = 'High' THEN 5
					END

--Adding the Frequency_Score Column
ALTER TABLE Ecommerce_Consumer_Data
ADD Frequency_Score INT

WITH Frequency AS (
	SELECT Customer_ID,
		   NTILE(5) OVER (ORDER BY Frequency_of_Purchase ASC) AS Frequency_Score
	FROM Ecommerce_Consumer_Data
	)
UPDATE e
SET e.Frequency_Score = f.Frequency_Score
FROM Ecommerce_Consumer_Data AS e
JOIN Frequency AS f
ON e.Customer_ID = f.Customer_ID
					
--Adding the Monetary_Score Column
ALTER TABLE Ecommerce_Consumer_Data
ADD Monetary_Score INT

WITH Frequency AS (
	SELECT Customer_ID,
		   NTILE(5) OVER (ORDER BY Annual_Revenue ASC) AS Monetary_Score
	FROM Ecommerce_Consumer_Data
	)
UPDATE e
SET e.Monetary_Score = f.Monetary_Score
FROM Ecommerce_Consumer_Data AS e
JOIN Frequency AS f
ON e.Customer_ID = f.Customer_ID

--Adding the RFM_Score Column
ALTER Table Ecommerce_Consumer_Data
ADD RFM_Score INT

UPDATE Ecommerce_Consumer_Data
SET RFM_Score = Recency_Score + Frequency_Score + Monetary_Score


--Adding Customer_Segment Column
ALTER Table Ecommerce_Consumer_Data
ADD Customer_Segment VARCHAR(50)

UPDATE Ecommerce_Consumer_Data
SET Customer_Segment =
					CASE 
					  WHEN RFM_Score >= 11 THEN 'Gold'
					  WHEN RFM_Score BETWEEN 6 AND 10 THEN 'Silver'
					ELSE 'Bronze'
					END

  
--Adding the Return_Behavior Column
ALTER TABLE Ecommerce_Consumer_Data
ADD Return_Behavior VARCHAR (50)

UPDATE Ecommerce_Consumer_Data
SET Return_Behavior =
			CASE 
				WHEN Return_Rate = 0 THEN 'No Returns'
			  WHEN Return_Rate = 1 THEN 'Occasional Returns'
				WHEN Return_Rate >= 2 THEN 'Frequent Returns'
			END 

--Adding the Loyalty_Score Column
ALTER TABLE Ecommerce_Consumer_Data
ADD Loyalty_Score INT

UPDATE Ecommerce_Consumer_Data
SET Loyalty_Score = (0.4*Brand_Loyalty) 
                 + (0.3 * Customer_Satisfaction)
                 + (0.3*CASE Engagement_with_Ads
                          WHEN 'High' THEN 5
                          WHEN 'Medicum' THEN 3
                          WHEN 'Low' THEN 1
                          ELSE 0 END)

  
--Adding Time_to_Decision_Bucket Column
ALTER TABLE [dbo].[Ecommerce_Consumer_Data]
ADD Time_to_Decision_Bucket varchar(50)

UPDATE [dbo].[Ecommerce_Consumer_Data]
SET Time_to_Decision_Bucket = CASE 
					WHEN Time_to_Decision <= 2 THEN 'Fast'
					WHEN Time_to_Decision BETWEEN 3 AND 5 THEN 'Moderate'
					ELSE 'Slow'
				END

  
--Calcualting Revenue by Purchase Category
SELECT Purchase_Category, SUM(Annual_Revenue) AS Total_Revenue
FROM Ecommerce_Consumer_Data
GROUP BY Purchase_Category
ORDER BY Total_Revenue

  
--Calcualting Revenue by Location
SELECT Location, SUM(Annual_Revenue) AS Total_Revenue
FROM Ecommerce_Consumer_Data
GROUP BY Location
ORDER BY Total_Revenue

  
--Calculating the top 5 customers
SELECT Customer_ID, Annual_Revenue
FROM Ecommerce_Consumer_Data
LIMIT 5

  
--Calculating Revenue contribution by region
WITH Revenue AS (
  SELECT Location, SUM(Annual_Revenue) AS Revenue
  FROM Ecommerce_Consumer_Data 
  GROUP BY Location
)

  
--Calculating Discount Impact
SELECT Discount_Sensitivity, AVG(Annual_Revenue) AS AvgRevenue
FROM Ecommerce_Consumer_Data 
GROUP BY Discount_Sensitivity
