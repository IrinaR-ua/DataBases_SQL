USE northwind;

-- 1 Для каждого product_id выведите inventory_id а также предыдущий и последующей inventory_id по убыванию quantity
SELECT product_id, inventory_id, 
LAG(inventory_id, 1) OVER(PARTITION BY product_id ORDER BY quantity) AS prev_inv_id,
LEAD(inventory_id, 1) OVER(PARTITION BY product_id ORDER BY quantity) AS next_inv_id
FROM order_details;

-- 2 Выведите максимальный и минимальный unit_price для каждого order_id с помощью функции FIRST VALUE  
-- Вывести order_id и полученные значения
SELECT order_id, 
FIRST_VALUE(unit_price) over(PARTITION BY order_id ORDER BY unit_price DESC) as max_unit_price,
FIRST_VALUE(unit_price) over(PARTITION BY order_id ORDER BY unit_price ASC) as min_unit_price
FROM order_details;


-- 3 Выведите order_id и столбец с разнице между  unit_price для каждой заказа 
-- и минимальным unit_price в рамках одного заказа 
-- Задачу решить двумя способами - с помощью First VAlue и MIN
-- 1)
SELECT order_id, unit_price,
unit_price - MIN(unit_price) OVER(PARTITION BY order_id) AS diff_u_price_and_min_un_price
FROM order_details;

-- 2)
SELECT order_id, unit_price,
unit_price - FIRST_VALUE(unit_price) OVER(PARTITION BY order_id ORDER BY unit_price ASC) AS diff_u_price_and_min_un_price
FROM order_details;

-- 4 Присвойте ранг каждой строке используя RANK по убыванию quantity
SELECT *,
ROW_NUMBER() OVER(ORDER BY quantity DESC, id ASC) as row_number_desc_quant
FROM order_details;

-- 5  Из предыдущего запроса выберите только строки с рангом до 10 включительно
SELECT *,
ROW_NUMBER() OVER(ORDER BY quantity DESC, id ASC) as row_number_desc_quant
FROM order_details
LIMIT 10;
