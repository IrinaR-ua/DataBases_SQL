-- 1. Выберите все строки из таблицы suppliers. Предварительно подключитесь к базе данных northwind
USE northwind;
SELECT 
    *
FROM
    suppliers;

-- 2. Выберите только те строки из таблицы suppliers где company имеет значение Supplier A
SELECT 
    *
FROM
    suppliers
WHERE
    company LIKE 'Supplier A';

-- 3. Выберите все строки из таблицы purchase_orders
SELECT 
    *
FROM
    purchase_orders;

-- 4. Выберите только те строки из таблицы purchase_orders  где supplier_id = 2
SELECT 
    *
FROM
    purchase_orders
WHERE
    supplier_id = 2;

-- 5. Выберите supplier_id и shipping_fee из purchase_orders там где created_by равно 1 и supplier_id равен 5 Объясните полученный результат
SELECT 
    supplier_id AND shipping_fee
FROM
    purchase_orders
WHERE
    created_by = 1 AND supplier_id = 5;
-- Нет результатов, отвечающих условию ;

/*6. Выберите last_name и first_name из таблицы employees
там где адрес address имеет значение 123 2nd Avenue или 123 8th Avenue
Напишите запрос двумя способами - с применением оператора OR и оператора IN */
-- 1.
SELECT 
    last_name, first_name
FROM
    employees
WHERE
    address LIKE '123 2nd Avenue'
        OR address LIKE '123 8th Avenue';
-- 2.
SELECT 
    last_name, first_name
FROM
    employees
WHERE
    address IN ('123 2nd Avenue' , '123 8th Avenue');
-- 3.
SELECT 
    last_name, first_name
FROM
    employees
WHERE
    address = '123 2nd Avenue'
        OR address = '123 8th Avenue';

-- 7. Выведите все имена сотрудников, которые содержат английскую букву p в середине фамилии
SELECT 
    last_name, first_name
FROM
    employees
WHERE
    last_name LIKE '%_p_%';

-- 8. Выберите все строки из таблицы orders там где нет информации о  shipper_id
SELECT 
    *
FROM
    orders
WHERE
    shipper_id IS NULL;

/*9. Отформатируйте стиль написания запросов
10. Сохраните запросы в виде файла с расширением .sql и загрузите на платформу */