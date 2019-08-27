INSERT INTO categories (symbol_code, name)
VALUES ('boards','Доски лыжи'),('attacment','Крепления'),('boots','Ботинки'),('clothing','Одежда'),('tools','Инструменты'),('other','Разное');


INSERT INTO  users (name, email, password, contact_info)
VALUES ('Андрей','andrey@yandex.ru', 'vrtyuuu', '@yanti'),('Витя','petr@yandex.ru', 'vrtyuuu', '@yanti'),('Вася','mari@yandex.ru', 'vrtyuuu', '@yanti'),('Иван','galina@yandex.ru', 'vrtyuuu', '@yanti'),('Петя', 'love@yandex.ru', 'vrtyuuu', '@yanti'),('Сергей','sergey@yandex.ru', 'vrtyuuu', '@yanti');

INSERT INTO  lots (title, image_link, start_price, date_end, author_id, category_id)
VALUES ('2014 Rossignol District Snowboard', 'img/lot-1.jpg', '10999', '2019-10-19', '139', '1'),('DC Ply Mens 2016/2017 Snowboard', 'img/lot-2.jpg', '159999', '2019-11-20', '140', '2'),('Крепления Union Contact Pro 2015 года размер L/XL', 'img/lot-3.jpg', '8000', '2019-12-20', '143', '3'),('Ботинки для сноуборда DC Mutiny Charocal', 'img/lot-4.jpg', '10999', '2019-12-19', '144', '4'),('Куртка для сноуборда DC Mutiny Charocal', 'img/lot-5.jpg', '7500', '2019-10-19', '141', '5'),('Маска Oakley Canopy', 'img/lot-6.jpg', '5400', '2019-10-19', '142', '6');

INSERT INTO  bid (bid)
VALUES ('112'),('245'),('356'),('466'),('665.6'),('6666.8');

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
