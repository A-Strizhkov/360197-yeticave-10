INSERT INTO categories (simbol)
VALUES (‘boards’),(‘ attacment’),(‘ boots’),(‘ clothing’),(‘ tools’),('other');
INSERT INTO categories (name)
VALUES (‘Доски лыжи’),(‘ Крепления’),(‘ Ботинки’),(‘ Одежда’),(‘ Инструменты’),(‘ Разное’);
INSERT INTO categories (id_cat)
VALUES (1),(2),(3),(4),(5),(6);



INSERT INTO  users (id_users)
VALUES (1),(2),(3),(4),(5),(6);
INSERT INTO  users (name_user)
VALUES (‘Андрей’),(‘Петя’),(‘Маша’),(‘Галина’),(‘Любовь’),('Сергей');
INSERT INTO  users (email)
VALUES (andrey@yandex.ru),(petr@yandex.ru),(mari@yandex.ru),(galina@yandex.ru),(love@yandex.ru),(sergey@yandex.ru);
INSERT INTO  users (password)
VALUES (‘vrtyuuu’),(‘vrtyuuu’),(‘vrtyuuu’),(‘vrtyuuu’),(‘vrtyuuu’),(‘vrtyuuu’),;
INSERT INTO users (contact)
VALUES (‘@yanti’),(‘@yanti’),(‘@yanti’),(‘@yanti’),(‘@yanti’),(‘@yanti’);

INSERT INTO  lot (id_lot)
VALUES (1),(2),(3),(4),(5),(6);
INSERT INTO  lot (title);
VALUES (‘2014 Rossignol District Snowboard’),(‘DC Ply Mens 2016/2017 Snowboard’),(‘Крепления Union Contact Pro 2015 года размер L/XL’),(‘Ботинки для сноуборда DC Mutiny Charocal’),(‘Куртка для сноуборда DC Mutiny Charocal’),(‘Маска Oakley Canopy’);
INSERT INTO  lot (link);
VALUES (‘img/lot-1.jpg’),(‘img/lot-2.jpg’),(‘img/lot-3.jpg’),(‘img/lot-4.jpg’),(‘img/lot-5.jpg’),(‘img/lot-6.jpg’);
INSERT INTO  lot (start_price);
VALUES (‘10999’),(‘159999’),(‘8000’),(‘10999’),(‘7500’),('5400');
INSERT INTO  lot (dt_end)
VALUES (‘2019-10-19’),(‘2019-11-19’),(‘2019-10-19’),(‘2019-10-19’),(‘2019-10-19’),('2019-10-19');


INSERT INTO  bid (price)
VALUES (112),(245),(356),(466),(665,6),(6666,8);

Связь таблицы лот с автором, победителем и категорией
SELECT lot.id, title, discription, link, start_price, dt_end, name_user,  FROM lot l
INNER JOIN categories c ON c.id_lot = l.id 
INNER JOIN users u ON l.id_users = u.id
INNER JOIN u ON l.winner = u.id
INNER JOIN categories c ON l.id_cat = c.id ;

Связь таблицы ставки с лотом и автором.
SELECT bid.id, dt_start, price,   FROM bid b
INNER JOIN lot l ON b.id_lot = l.id
INNER JOIN users u ON b.id_users = u.id;

Связи таблицы автора с лотом и ставкой.
SELECT users.id, l.id, id_bid  FROM users u
INNER JOIN lot l ON u.create_lot = l.id
INNER JOIN bid b ON u.id_bid = b.bid;

Получаем категории
SELECT id FROM categories;

Получаем самые новые открытые лоты
SELECT title, start_price, link, id_cat FROM lot ORDER BY dt_create
LIMIT 10;
 
Показать лот по его id_cat
SELECT id, id_cat FROM lot;

Обновляем название лота по его идентификатору

UPDATE lot SET title = 'DC Ply Mens 2016/2017 Snowboard'’
WHERE id = '1';

Получаем список ставок для лота по его идентификатору с сортировкой по дате.
SELECT id_lot, bid from bid ORDER BY dt_start DESC;
