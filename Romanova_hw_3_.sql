 -- 1.  Выведите Ваш возраст на текущий день в секундах 
SELECT 
DATEDIFF(NOW(), '1986-11-24 00:00:00') * 24 * (60 ^ 2) AS MyAge_sec;

-- 2. Выведите какая дата будет через 51 день
SELECT 
    DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'),
        INTERVAL 51 DAY) AS date_in_51days;

-- 3. Отформатируйте предыдущей запрос - выведите день недели для этой даты Используйте документацию My SQL
SELECT 
    DAYNAME(DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'),
                INTERVAL 51 DAY)) AS WeekDay_in_51days;

-- 4.  Подключитесь к базе данных northwind. Выведите столбец с исходной датой создания транзакции transaction_created_date 
-- из таблицы inventory_transactions, а также столбец полученный прибавлением 3 часов к этой дате
USE northwind;
SELECT 
    transaction_created_date,
    DATE_ADD(transaction_created_date,
        INTERVAL 3 HOUR) AS transaction_created_date_in3hours
FROM
    inventory_transactions;

-- 5. Выведите столбец с текстом  'Клиент с id <customer_id> сделал заказ <order_date>' из таблицы orders
--            1й вариант: 
SELECT
CONCAT("Клиент с id ", customer_id, " сделал заказ ", order_date) AS result
FROM orders;

--            2й вариант: 
SELECT
CONCAT("Клиент с id ", CAST(customer_id AS CHAR(2)), " сделал заказ ", order_date) AS result
FROM orders;

-- Запрос написать двумя способами - с использованием неявных преобразований 
-- а также с указанием изменения типа данных для столбца customer_id

-- Внимание В MySQL функция CAST не принимает VARCHAR в качестве параметра для длины. 
-- Вместо этого, нужно использовать CHAR для указания длины. 

