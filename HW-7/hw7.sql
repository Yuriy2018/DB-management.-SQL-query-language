-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT 
    * 
FROM 
     users
WHERE 
EXISTS 
    (SELECT 1 FROM orders WHERE orders.id = users.id);
	
	
	
-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.	

SELECT
     c.name as "Категория",  
     p.name as "Товар",
     p.price as "Цена"
FROM
     catalogs AS c JOIN products AS p
ON
     c.id = p.catalog_id;
	 
	 
	 
-- 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.	 

-- Вариант 1 
select id, 
(select name from cities where label = from_) as from_, 
(select name from cities where label = to_) as to_  
From flights;

-- Вариант 2
SELECT
    f.id, 
    f.from_,
    c_from .name as "Откуда",
    f.to_,
    c_to .name as "Куда"
FROM
    flights  AS f JOIN cities AS c_from JOIN cities AS c_to
ON
    f.from_ = c_from .label and f.to_ = c_to .label
order by 
    id;