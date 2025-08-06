
-- Схема базы данных состоит из четырех таблиц:
-- Product (производитель, модель, тип)
-- PC (код, модель, скорость, ОЗУ, жесткий диск, CD, цена)
-- Laptop (код, модель, скорость, ОЗУ, жесткий диск, экран, цена)
-- Printer (код, модель, цвет, тип, цена)

USE computer_firm;

-- 1 Найдите все записи таблицы Printer для цветных принтеров.
SELECT 
    *
FROM
    printer
WHERE
    COLOR = 'Y';


-- 2. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
SELECT 
    model, price, maker
FROM
    (SELECT 
        model, price
    FROM
        pc UNION SELECT 
        model, price
    FROM
        laptop UNION SELECT 
        model, price
    FROM
        printer) AS union_tables
        JOIN
    product USING (model)
WHERE
    maker = 'B';

-- 3. Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT DISTINCT
    maker
FROM
    product
WHERE
    TYPE = 'PC'
        AND maker NOT IN (SELECT 
            maker
        FROM
            product
        WHERE
            TYPE = 'LAPTOP');

-- 4 Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT
    maker
FROM
    product
WHERE
    MODEL IN (SELECT 
            MODEL
        FROM
            pc
        WHERE
            SPEED >= 450);

-- 5 Найдите среднюю скорость ПК.
SELECT 
    ROUND(AVG(SPEED), 0)
FROM
    pc;

-- 6 Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
-- Вывести: maker, средний размер экрана.

SELECT 
    product.MAKER, ROUND(AVG(laptop.SCREEN), 0) AS avg_screen
FROM
    product
        LEFT JOIN
    laptop ON laptop.MODEL = product.MODEL
WHERE
    laptop.SCREEN IS NOT NULL
GROUP BY product.MAKER;
