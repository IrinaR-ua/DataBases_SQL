USE northwind;

-- 1   Вывести названия продуктов таблица products, включая количество заказанных единиц quantity 
-- для каждого продукта таблица order_details.
-- Решить задачу с помощью cte и подзапроса.

-- Вариант c подзапросом
SELECT 
    prod.product_name, 
    (SELECT SUM(ordd.quantity)
        FROM order_details AS ordd
        WHERE ordd.product_id = prod.id
    ) AS total_quantity
FROM products AS prod
WHERE prod.id IN (
    SELECT DISTINCT product_id FROM order_details
);


-- Вариант с СТЕ: итоговый
WITH CTE_total_quantity 
AS (
SELECT SUM(quantity) AS total_quantity, product_id 
FROM order_details 
GROUP BY product_id
)
SELECT product_name, total_quantity
FROM CTE_total_quantity
JOIN products
ON products.id = CTE_total_quantity.product_id;
        -- ---------------------------------
 


-- РЕШИТЬ   2  Найти все заказы таблица orders, сделанные после даты самого первого заказа клиента Lee таблица customers.

-- select id
-- from customers
-- where last_name = 'Lee';

-- select customers.id, customers.last_name
-- from orders
-- join 
-- customers
-- on customers.id = orders.customer_id
-- ;

SELECT 
    *
FROM
    orders
WHERE
    order_date > (SELECT 
            MIN(order_date)
        FROM
            orders
                JOIN
            customers ON customers.id = orders.customer_id
        WHERE
            customers.last_name = 'Lee');


-- 3 Найти все продукты таблицы  products c максимальным target_level
SELECT 
    *
FROM
    products
WHERE
    target_level = (SELECT 
            MAX(target_level)
        FROM
            products);
