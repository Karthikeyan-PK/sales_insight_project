-- Revenue Breakdown by City for 2019
SELECT market_code, sum(sales_amount) FROM sales.transactions 
WHERE YEAR(order_date)=2019 GROUP BY market_code;

-- Revenue Breakdown for Chennai for 2020
SELECT sum(sales_amount) FROM sales.transactions 
WHERE extract(YEAR FROM order_date)=2020 AND market_code LIKE 'Mark001';

-- Unique products sales for Chennai for year 2020
SELECT DISTINCT product_code FROM sales.transactions 
WHERE market_code LIKE 'Mark001' AND extract(YEAR FROM order_date)=2020;

-- Total Revenue Breakdown by City in decending 
SELECT m.markets_name, sum(t.sales_amount) AS revenue 
FROM sales.transactions AS t INNER JOIN sales.markets AS m ON t.market_code=m.markets_code 
GROUP BY t.market_code ORDER BY revenue DESC;

-- Top 5 Customers by Revenue descending
SELECT c.custmer_name, sum(t.sales_amount) AS revenue 
FROM sales.transactions AS t INNER JOIN sales.customers AS c ON t.customer_code=c.customer_code 
GROUP BY t.customer_code ORDER BY revenue DESC LIMIT 5;

-- Top 5 Customers by Sales Qty descending
SELECT c.custmer_name, sum(t.sales_qty) AS sales_quantity 
FROM sales.transactions AS t INNER JOIN sales.customers AS c ON t.customer_code=c.customer_code 
GROUP BY t.customer_code ORDER BY sales_quantity DESC LIMIT 5;

-- Top 5 Products by Revenue descending
SELECT product_code, sum(sales_amount) AS revenue 
FROM sales.transactions GROUP BY product_code ORDER BY revenue DESC LIMIT 5;

