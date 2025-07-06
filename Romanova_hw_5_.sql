-- База данных northwind
-- Работаем с таблицей purchase_order_details
use northwind;
SELECT 
    *
FROM
    purchase_order_details;
-- 1 Посчитайте основные статистики - среднее, сумму, минимум, максимум столбца unit_cost.
SELECT 
    AVG(unit_cost),
    SUM(unit_cost),
    MIN(unit_cost),
    MAX(unit_cost)
FROM
    purchase_order_details;

-- 2 Посчитайте количество уникальных заказов purchase_order_id
SELECT 
    COUNT(DISTINCT purchase_order_id) AS count_purchase_order
FROM
    purchase_order_details;
    
-- 3 Посчитайте количество продуктов product_id в каждом заказе purchase_order_id 
-- Отсортируйте полученные данные по убыванию количества
SELECT 
    purchase_order_id, COUNT(product_id) AS count_product_id
FROM
    purchase_order_details
GROUP BY purchase_order_id
ORDER BY count_product_id DESC;

-- 4 Посчитайте заказы по дате доставки date_received Считаем только те продукты, количество quantity которых больше 30
select
date_received, count(purchase_order_id) as count_purchase_date
from purchase_order_details
where quantity > 30
group by date_received
order by date_received desc;

-- Например такой запрос : Не понимаю, какое quantity выводит в этой таблице? я же не написала sum.. почему вывелся результат запроса?
-- select
-- date_received, count(purchase_order_id) as count_purchase_date, quantity
-- from purchase_order_details
--                      -- where quantity > 30
-- group by date_received
-- order by count_purchase_date desc;


-- 5 Посчитайте суммарную стоимость заказов в каждую из дат Стоимость заказа - произведение quantity на unit_cost
SELECT 
    date_received, SUM(quantity * unit_cost) AS sum_order_cost
FROM
    purchase_order_details
GROUP BY date_received
ORDER BY sum_order_cost;

-- 6 Сгруппируйте товары по unit_cost и вычислите среднее и максимальное значение quantity только 
-- для товаров где purchase_order_id не больше 100
SELECT 
    unit_cost, avg(quantity), max(quantity)
FROM
    purchase_order_details
where purchase_order_id <= 100
GROUP BY unit_cost;

-- 7 Выберите только строки где есть значения в столбце inventory_id Создайте столбец category - если 
-- unit_cost > 20 то 'Expensive' в остальных случаях 'others' Посчитайте количество продуктов в каждой категории

SELECT 
    CASE
        WHEN unit_cost > 20 THEN 'Expensive'
        ELSE 'others'
    END AS category,
    COUNT(distinct product_id) as count_per_category
FROM
    purchase_order_details
WHERE
    inventory_id IS NOT NULL
group by category;