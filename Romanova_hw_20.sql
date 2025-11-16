use sakila;
-- Задание 1 Вывести названия фильмов с расшифровкой рейтинга для каждого. В таблице film хранятся годы рейтингов. 
-- Нужно воспользоваться оператором case чтобы определить для каждого кода условие, по которому будет выводится его развернутое описание (1 предложение). 
SELECT title, rating,
    CASE rating
        WHEN 'G' THEN 'General Audiences — для всех возрастов'
        WHEN 'PG' THEN 'Parental Guidance Suggested — некоторый материал не для детей'
        WHEN 'PG-13' THEN 'Parents Strongly Cautioned — до 13 лет рекомендуется просмотр с родителями'
        WHEN 'R' THEN 'Restricted — до 17 лет допускаются только с родителями'
        WHEN 'NC-17' THEN 'Adults Only — не допускается просмотр младше 17 лет.'
        ELSE 'Unknown rating'
    END AS rating_description
FROM film;



-- Задание 2 Выведите количество фильмов в каждой категории рейтинга. Используем group by. 
SELECT rating,
    COUNT(*) AS film_count
FROM film
GROUP BY rating;



-- Задание 3 Используя оконные функции и partition by, 
-- выведите список названий фильмов, рейтинг и количество фильмов в каждом рейтинге. 
-- Объясните, чем отличаются результаты предыдущего запроса и запроса в этой задаче. 
SELECT title, rating,
    COUNT(*) OVER (PARTITION BY rating) AS films_in_rating
FROM film;
-- *Объяснение: GROUP BY объединяет строки т.е на каждый рейтинг одна строка
--              PARTITION BY сохраняет все строки и добавляет доп столбец с количеством фильмов в соотв-м рейтинге



-- Задание 4 Изучите таблицы payment и customer. 
-- Выведите список всех платежей с указанием имени и фамилии каждого заказчика, датой платежа и суммой.
SELECT 
    customer.first_name, customer.last_name, payment.payment_date, payment.amount
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id;



-- Задание 5 Поменяйте предыдущий запрос так, чтобы дата выводилась в формате “число, название месяца, год” (без времени)
SELECT customer.first_name, customer.last_name,
    DATE_FORMAT(payment.payment_date, '%e %M %Y') AS formatted_date,
    payment.amount
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id;
