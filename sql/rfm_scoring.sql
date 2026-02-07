/* =========================================================
   DAY 2: RFM SCORING & CUSTOMER SEGMENTATION
   Objective: Score customers and assign business segments
   ========================================================= */

-- 1. Drop existing segments table if rerunning
DROP TABLE IF EXISTS rfm_segments;

-- 2. Create RFM segments using NTILE and CASE logic
CREATE TABLE rfm_segments AS
SELECT
    CustomerID,
    r_score,
    f_score,
    m_score,
    CASE
        WHEN r_score = 4 AND f_score = 4 AND m_score = 4 THEN 'Champions'
        WHEN r_score >= 3 AND f_score >= 3 THEN 'Loyal Customers'
        WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
        WHEN r_score = 1 AND f_score = 1 THEN 'Lost Customers'
        ELSE 'Potential'
    END AS customer_segment
FROM (
    SELECT
        CustomerID,
        NTILE(4) OVER (ORDER BY recency ASC) AS r_score,
        NTILE(4) OVER (ORDER BY frequency DESC) AS f_score,
        NTILE(4) OVER (ORDER BY monetary DESC) AS m_score
    FROM (
        SELECT
            CustomerID,
            DATEDIFF(
                (SELECT MAX(last_purchase_date) FROM rfm_base),
                last_purchase_date
            ) AS recency,
            frequency,
            monetary
        FROM rfm_base
        WHERE CustomerID IS NOT NULL
          AND CustomerID <> ''
    ) t
) s;

-- 3. Validate segmentation output
SELECT
    customer_segment,
    COUNT(*) AS customer_count
FROM rfm_segments
GROUP BY customer_segment
ORDER BY customer_count DESC;

-- 4. Revenue contribution by segment
SELECT
    s.customer_segment,
    SUM(b.monetary) AS total_revenue
FROM rfm_segments s
JOIN rfm_base b
  ON s.CustomerID = b.CustomerID
GROUP BY s.customer_segment
ORDER BY total_revenue DESC;
