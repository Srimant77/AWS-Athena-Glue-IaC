-- Query 2: Region and Status Revenue Aggregation (Partitioned Filter - Jan 2023)
--
-- Description: Aggregates order counts, total revenue, and average order value
--              for a specific partition (year = '2023', month = '01').
--
-- Optimization Context: This query leverages Athena partition pruning by querying
--                       only the directory prefix matching year=2023/month=01.
--                       This cuts data scanning costs and increases speed.

SELECT
    region,
    status,
    COUNT(*) as order_count,
    ROUND(SUM(extended_price), 2) as total_revenue,
    ROUND(AVG(extended_price), 2) as avg_order_value
FROM
    de_srimant_db.parquet_results
WHERE
    year = '2023'
    AND month = '01'
GROUP BY
    region,
    status
ORDER BY
    total_revenue DESC;
