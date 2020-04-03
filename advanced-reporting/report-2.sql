use northwind;

SELECT 
    DATE_FORMAT(order_date, '%Y - %M') AS 'Sales Month',
    ord.ship_state_province AS 'State',
    CONCAT('$',
            FORMAT(SUM(odt.quantity * prods.list_price),
                2)) AS 'Total Sales'
FROM
    orders AS ord
        INNER JOIN
    order_details AS odt ON ord.id = odt.order_id
        INNER JOIN
    products AS prods ON odt.product_id = prods.id
WHERE
    odt.status_id = 2
GROUP BY DATE_FORMAT(order_date, '%Y - %M'), ord.ship_state_province
ORDER BY 'Sales Month' ASC;