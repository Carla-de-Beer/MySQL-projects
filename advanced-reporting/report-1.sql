use northwind;

SELECT 
    customers.first_name AS 'First Name',
    customers.last_name AS 'Last Name',
    customers.company AS 'Company',
    shippers.company AS 'Shipper',
    DATE_FORMAT(orders.order_date, '%M, %e, %Y') AS 'Order Date',
    orders.ship_address AS Street,
    orders.ship_city AS City,
    orders.ship_zip_postal_code AS ZIP,
    orders.ship_country_region AS Country,
    products.product_code AS 'Product Code',
    products.product_name AS 'Product Name',
    FORMAT(products.standard_cost, 2) AS 'List Price',
    FORMAT(order_details.quantity, 0) AS 'Quantity Ordered',
    FORMAT(order_details.quantity * products.standard_cost,
        2) AS 'Total Cost Line Item'
FROM
    customers
        INNER JOIN
    orders ON customers.id = orders.customer_id
        INNER JOIN
    order_details ON orders.id = order_details.id
        INNER JOIN
    products ON order_details.product_id = products.id
        INNER JOIN
    shippers ON orders.shipper_id = shippers.id;