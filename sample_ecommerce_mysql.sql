SELECT * FROM customers;

SELECT * FROM customers WHERE country = 'USA';

SELECT * FROM products ORDER BY price DESC;

SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;

SELECT o.order_id, c.name, o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT o.order_id, c.name
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id;


SELECT * FROM customers
WHERE customer_id IN (
  SELECT customer_id FROM orders
  GROUP BY customer_id
  HAVING COUNT(order_id) > 1
);


SELECT SUM(total_amount) AS total_revenue FROM orders;


SELECT AVG(total_amount) AS avg_order_value FROM orders;

CREATE VIEW customer_summary AS
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;


SELECT * FROM customer_summary;

CREATE INDEX idx_customer_id ON orders(customer_id);







