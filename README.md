# Customer Segmentation using RFM Analysis (SQL & Power BI)

## Project Overview
This project implements **customer segmentation using RFM (Recency, Frequency, Monetary) analysis** on a large retail transactions dataset.
The objective is to analyze customer purchasing behavior and classify customers into actionable segments that support **targeted marketing,
customer retention, and revenue optimization**.

All analytical logic is performed in **SQL**, while **Power BI** is used exclusively for data modeling and visualization.

---

## Business Context
Retail businesses generate large volumes of transactional data but often lack a structured approach to identify
high-value customers, churn risks, and growth opportunities.  
This project addresses that gap by applying RFM methodology to convert raw transaction data into meaningful customer segments
that can directly inform business strategy.

---

## Dataset
- **Source:** Online Retail Dataset (UCI / Kaggle)
- **Volume:** ~219,000 transaction records
- **Customers:** ~1,000+
- **Granularity:** Transaction-level retail sales data

---

## Tools & Technologies
- **SQL (MySQL)** – Data cleaning, aggregation, window functions, and segmentation logic
- **Power BI** – Data modeling, DAX measures, and dashboard visualization
- **Excel** – Used only as an intermediate export format

---

## Analytical Approach
- Cleaned raw transactional data by removing returns and invalid pricing
- Aggregated transaction-level data to the customer level
- Calculated Recency, Frequency, and Monetary metrics
- Assigned RFM scores using window functions
- Segmented customers using clear, business-driven classification logic
- Built an executive-ready dashboard to communicate insights

---

## Customer Segments
- **Champions:** Recently active, high-frequency, high-spend customers
- **Loyal Customers:** Consistent repeat buyers with stable value
- **Potential Customers:** Large segment with strong growth opportunity
- **At Risk:** Customers showing declining engagement
- **Lost Customers:** Previously high-value customers who have churned

---

## Key Insights
- Lost customers contribute the largest share of total revenue, indicating churn among historically high-value customers
- Potential customers form the largest segment by count, representing significant upsell and conversion opportunities
- Loyal customers provide consistent revenue and are ideal targets for retention strategies
- At-risk customers require early intervention to prevent revenue loss

---

## Dashboard
The Power BI dashboard presents:
- Total revenue and average revenue per customer
- Customer distribution by segment
- Revenue contribution by customer segment

![Customer Segmentation Dashboard](screenshots/dashboard.png)

---

## Repository Structure
```
customer-segmentation-rfm/
│
├── README.md
│
├── data/
│   └── RAWDATA/
│       ├── README.md
│       └── online_retail_II.zip
│
├── sql/
│   ├── README.md
│   ├── rfm_base.sql
│   └── rfm_scoring.sql
│
├── powerbi/
│   ├── README.md
│   └── Customer Segmentation & Revenue Analysis (RFM).pbix

```

---

## Outcome
This project demonstrates:
- Strong SQL proficiency, including aggregation and window functions
- Business-oriented customer segmentation using RFM methodology
- Clean data modeling suitable for BI tools
- End-to-end analytics workflow from raw data to decision-ready insights

---

## Author
Raghav Agarwal  
Data Analyst | SQL | Power BI
