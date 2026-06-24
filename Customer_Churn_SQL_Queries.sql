SELECT
    COUNT(*) AS Total_Customers,
    SUM(Churn_Flag) AS Churned_Customers,
    ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*), 2) AS Churn_Rate,
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charges,
    ROUND(SUM(Monthly_Revenue_At_Risk), 2) AS Monthly_Revenue_At_Risk
FROM Customers;

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(Churn_Flag) AS Churned_Customers,
    ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*), 2) AS Churn_Rate,
    ROUND(SUM(Monthly_Revenue_At_Risk), 2) AS Monthly_Revenue_At_Risk
FROM Customers
GROUP BY Contract
ORDER BY Churn_Rate DESC;

SELECT
    Tenure_Group,
    COUNT(*) AS Total_Customers,
    SUM(Churn_Flag) AS Churned_Customers,
    ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*), 2) AS Churn_Rate,
    ROUND(SUM(Monthly_Revenue_At_Risk), 2) AS Monthly_Revenue_At_Risk
FROM Customers
GROUP BY Tenure_Group
ORDER BY Churn_Rate DESC;

SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(Churn_Flag) AS Churned_Customers,
    ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*), 2) AS Churn_Rate,
    ROUND(SUM(Monthly_Revenue_At_Risk), 2) AS Monthly_Revenue_At_Risk
FROM Customers
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;

SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(Churn_Flag) AS Churned_Customers,
    ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*), 2) AS Churn_Rate,
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charges,
    ROUND(SUM(Monthly_Revenue_At_Risk), 2) AS Monthly_Revenue_At_Risk
FROM Customers
GROUP BY InternetService
ORDER BY Churn_Rate DESC;

SELECT
    Monthly_Charge_Group,
    COUNT(*) AS Total_Customers,
    SUM(Churn_Flag) AS Churned_Customers,
    ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*), 2) AS Churn_Rate,
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charges,
    ROUND(SUM(Monthly_Revenue_At_Risk), 2) AS Monthly_Revenue_At_Risk
FROM Customers
GROUP BY Monthly_Charge_Group
ORDER BY Churn_Rate DESC;

