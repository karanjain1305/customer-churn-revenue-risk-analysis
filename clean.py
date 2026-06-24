import pandas as pd

# Load dataset
df = pd.read_csv("WA_Fn-UseC_-Telco-Customer-Churn.csv")

# Preview data
print(df.head())
print(df.info())

# Clean TotalCharges
df["TotalCharges"] = pd.to_numeric(df["TotalCharges"], errors="coerce")

# Drop rows with missing TotalCharges
df = df.dropna(subset=["TotalCharges"])

# Create churn flag: Yes = 1, No = 0
df["Churn_Flag"] = df["Churn"].map({"Yes": 1, "No": 0})

# Create monthly revenue at risk
df["Monthly_Revenue_At_Risk"] = df["MonthlyCharges"] * df["Churn_Flag"]

# Create tenure groups
df["Tenure_Group"] = pd.cut(
    df["tenure"],
    bins=[0, 12, 24, 48, 72],
    labels=["0-12 months", "13-24 months", "25-48 months", "49-72 months"],
    include_lowest=True
)

# Create monthly charge groups
df["Monthly_Charge_Group"] = pd.cut(
    df["MonthlyCharges"],
    bins=[0, 35, 70, 105, 150],
    labels=["Low Charge", "Medium Charge", "High Charge", "Very High Charge"],
    include_lowest=True
)

# Save cleaned file
df.to_csv("Telco_Churn_Cleaned.csv", index=False)

print("Cleaned rows:", len(df))
print("Churn rate:", round(df["Churn_Flag"].mean() * 100, 2), "%")
print("Monthly revenue at risk:", round(df["Monthly_Revenue_At_Risk"].sum(), 2))
