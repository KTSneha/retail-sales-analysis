-- Query 1: Profitability by Region and Category
SELECT
    Region,
    Category,
    ROUND(SUM(Sales), 2)   AS total_sales,
    ROUND(SUM(Profit), 2)  AS total_profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_pct
FROM orders
GROUP BY Region, Category
ORDER BY total_profit DESC;

-- Query 2: Revenue and Profit by Customer Segment
SELECT
    Segment,
    ROUND(SUM(Sales), 2)   AS total_sales,
    ROUND(SUM(Profit), 2)  AS total_profit,
    ROUND(AVG(Profit), 2)  AS avg_profit_per_order,
    COUNT(*) AS num_orders
FROM orders
GROUP BY Segment
ORDER BY total_sales DESC;

-- Query 3: Discount vs Profit by Sub-Category
SELECT
    Category,
    "Sub-Category",
    ROUND(AVG(Discount), 2)  AS avg_discount,
    ROUND(SUM(Profit), 2)    AS total_profit,
    ROUND(SUM(Sales), 2)     AS total_sales
FROM orders
GROUP BY Category, "Sub-Category"
ORDER BY avg_discount DESC;

-- Query 4: Top Sub-Categories by Sales
SELECT
    "Sub-Category",
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity)         AS total_units_sold
FROM orders
GROUP BY "Sub-Category"
ORDER BY total_sales DESC
LIMIT 10;
