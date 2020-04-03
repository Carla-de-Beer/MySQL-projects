use northwind;

SELECT 
    p.product_code AS 'Product Code',
    p.product_name AS 'Product Name',
    DATE_FORMAT(orders.order_date, '%Y - %m') AS 'Order Month',
    CONCAT('$',
            FORMAT(SUM(order_details.quantity * p.list_price),
                2)) AS 'Sales',
    CONCAT('$',
            FORMAT(SUM(order_details.quantity * p.standard_cost),
                2)) AS 'Cost',
    CONCAT('$',
            FORMAT(SUM((p.list_price - p.standard_cost) * order_details.quantity),
                2)) AS 'Profit'
FROM
    orders,
    order_details,
    products AS p
WHERE
    orders.id = order_details.order_id
        AND order_details.product_id = p.id
        AND order_details.status_id = 2
GROUP BY DATE_FORMAT(orders.order_date, '%Y - %m') , p.product_code , p.product_name
ORDER BY DATE_FORMAT(orders.order_date, '%Y - %m') ASC , SUM((p.list_price - p.standard_cost) * order_details.quantity) DESC;







