CREATE TABLE marketing_data (
    Date DATE,
    Region VARCHAR(50),
    Marketing_Channel VARCHAR(100),
    Campaign_Name VARCHAR(100),
    Product_Category VARCHAR(50),
    
    Marketing_Spend FLOAT,
    Revenue FLOAT,
    Cost FLOAT,
    Conversions INT,
    Clicks INT,
    Impressions INT,
    
    Customer_Rating FLOAT,
    Discount_Rate FLOAT,
    
    Profit FLOAT,
    CTR FLOAT,
    CPC FLOAT,
    ROI FLOAT,
    
    High_Spend_Low_Conversion BOOLEAN,
    Negative_ROI BOOLEAN,
    Zero_Clicks BOOLEAN
);


		select * from marketing_data

-- 'Which marketing channels are wasting money?'
SELECT
	MARKETING_CHANNEL,
	SUM(MARKETING_SPEND) AS TOTAL_SPEND,
	SUM(REVENUE) AS TOTAL_REVENUE,
	SUM(PROFIT) AS TOTAL_PROFIT,
	AVG(ROI) AS AVG_ROI
FROM
	MARKETING_DATA
GROUP BY
	MARKETING_CHANNEL
ORDER BY
	AVG_ROI ASC

-- 'Which campaigns are wasting the MOST money?'
SELECT DISTINCT
	(CAMPAIGN_NAME)
FROM
	MARKETING_DATA



SELECT
	CAMPAIGN_NAME,
	SUM(REVENUE) AS TOTAL_REVENUE,
	SUM(PROFIT) AS TOTAL_PROFIT,
	SUM(MARKETING_SPEND) AS TOTAL_SPEND,
	AVG(ROI) AS AVG_ROI
FROM
	MARKETING_DATA
GROUP BY
	CAMPAIGN_NAME
ORDER BY
	TOTAL_SPEND ASC

-- 'Where are we losing customers?'

SELECT
	MARKETING_CHANNEL,
	SUM(IMPRESSIONS) AS TOTAL_IMPRESSION,
	SUM(CLICKS) AS TOTAL_CLICKS,
	SUM(CONVERSIONS) AS TOTAL_CONVERSIONS,
	(SUM(CLICKS) * 100.0 / SUM(IMPRESSIONS)) AS CTS,
	(SUM(CONVERSIONS) * 100.0 / SUM(CLICKS)) AS CONVERSIONS_RATE
FROM
	MARKETING_DATA
GROUP BY
	MARKETING_CHANNEL
ORDER BY
	CTS ASC


