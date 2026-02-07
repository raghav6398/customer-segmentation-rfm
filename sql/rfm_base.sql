/* =========================================================
   DAY 1: DATA PREPARATION & RFM BASE TABLE
   Dataset: Online Retail (Kaggle)
   Objective: Create customer-level RFM base table
   ========================================================= */

-- 1. Basic data understanding
SELECT COUNT(*) AS total_rows
FROM online_retail;

SELECT 
    MIN(InvoiceDate) AS start_date,
    MAX(InvoiceDate) AS end_date
FROM online_retail;

SELECT 
    MIN(Quantity) AS min_quantity,
    MAX(Quantity) AS max_quantity
FROM online_retail;

-- 2. Drop existing table if rerunning
DROP TABLE IF EXISTS rfm_base;

-- 3. Create RFM base table
-- Removes returns and invalid prices
-- Ensures clean CustomerID for BI modeling
CREATE TABLE rfm_base AS
SELECT
    CustomerID,
    MAX(InvoiceDate) AS last_purchase_date,
    COUNT(DISTINCT InvoiceNo) AS frequency,
    SUM(Quantity * UnitPrice) AS monetary
FROM online_retail
WHERE CustomerID IS NOT NULL
  AND CustomerID <> ''
  AND Quantity > 0
  AND UnitPrice > 0
GROUP BY CustomerID;

-- 4. Validate RFM base output
SELECT COUNT(*) AS total_customers
FROM rfm_base;

SELECT *
FROM rfm_base
ORDER BY monetary DESC
LIMIT 10;
