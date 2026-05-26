-- Query 1: Region and Status Revenue Aggregation (Whole Table)
--
-- Description: Aggregates order counts, total revenue, and average order value
--              across all regions and order statuses for the entire dataset.
--
-- Optimization Context: This query runs against the full dataset cataloged by
--                       the Glue Crawler, scanning the entire S3 parquet data directory.

SELECT
    region,
    status,
    COUNT(*) as order_count,
    ROUND(SUM(extended_price), 2) as total_revenue,
    ROUND(AVG(extended_price), 2) as avg_order_value
FROM
    de_srimant_db.parquet_results
GROUP BY
    region,
    status
ORDER BY
    total_revenue DESC;
