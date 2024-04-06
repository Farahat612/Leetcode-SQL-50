SELECT
    p.product_id,
    COALESCE(ROUND(SUM(p.price * COALESCE(u.units, 0)) / GREATEST(SUM(u.units), 1), 2), 0) AS average_price
FROM
    Prices p
LEFT JOIN
    UnitsSold u
ON
    p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    p.product_id;

-- Solved the error by modifying the SQL query to include products from the Prices table that have no corresponding entries in the UnitsSold table. This was achieved by using a LEFT JOIN and COALESCE to handle the cases where there are no matching units sold for a product.