-- Active: 1783963569789@@127.0.0.1@3306@onestop
USE onestop;

UPDATE orders o
JOIN (
    SELECT order_id, SUM(quantity * unit_price) as actual_total
    FROM order_items
    GROUP BY order_id
) item_totals ON o.order_id = item_totals.order_id
SET o.total_amount = item_totals.actual_total;


SELECT order_id, total_amount FROM orders;
