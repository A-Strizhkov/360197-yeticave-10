INSERT INTO categories (symbol_code, name)
VALUES ('boards','Доски лыжи'),('attacment','Крепления'),('boots','Ботинки'),('clothing','Одежда'),('tools','Инструменты'),('other','Разное');


INSERT INTO  users (name, email, password, contact_info)
VALUES ('Андрей','andrey@yandex.ru', 'vrtyuuu', '@yanti'),('Витя','petr@yandex.ru', 'vrtyuuu', '@yanti'),('Вася','mari@yandex.ru', 'vrtyuuu', '@yanti'),('Иван','galina@yandex.ru', 'vrtyuuu', '@yanti'),('Петя', 'love@yandex.ru', 'vrtyuuu', '@yanti'),('Сергей','sergey@yandex.ru', 'vrtyuuu', '@yanti');

INSERT INTO  lots (title, image_link, start_price, date_end, author_id, category_id)
VALUES ('2014 Rossignol District Snowboard', 'img/lot-1.jpg', '10999', '2019-10-19', '139', '1'),('DC Ply Mens 2016/2017 Snowboard', 'img/lot-2.jpg', '159999', '2019-11-20', '140', '2'),('Крепления Union Contact Pro 2015 года размер L/XL', 'img/lot-3.jpg', '8000', '2019-12-20', '143', '3'),('Ботинки для сноуборда DC Mutiny Charocal', 'img/lot-4.jpg', '10999', '2019-12-19', '144', '4'),('Куртка для сноуборда DC Mutiny Charocal', 'img/lot-5.jpg', '7500', '2019-10-19', '141', '5'),('Маска Oakley Canopy', 'img/lot-6.jpg', '5400', '2019-10-19', '142', '6');

INSERT INTO  bid (amount)
VALUES ('112'),('245'),('356'),('466'),('665.6'),('6666.8');

INSERT INTO  bid (lot_id, user_id)
VALUES ('53','139'),('54','140'),('55', '141'),('56','142'),('57', '143'),('58', '144');

Связь таблицы лот с автором, победителем и категорией
SELECT l.id, l.title, l.description, l.image_link, l.start_price, l.date_end, u.id, u_w.id  FROM lots l
JOIN users u ON  l.author_id = u.id
LEFT JOIN users u_w ON l.winner_id = u_w.id
INNER JOIN categories c ON l.category_id = c.id ;

Связь таблицы ставок с лотом и автором.
SELECT b.id, b.date_start, b.amount, u.name FROM bid b
INNER JOIN lots l ON b.lot_id = l.id
INNER JOIN users u ON b.user_id = u.id;

Получаем категории
SELECT * FROM categories;

Получаем самые новые открытые лоты
SELECT title, start_price, image_link, category_id FROM lots ORDER BY created_at DESC
LIMIT 9;

Показать лот по его id
SELECT * FROM lots WHERE id = 1;

Обновляем название лота по его идентификатору

UPDATE lots SET title = 'DC Ply Mens 2016/2017 Snowboard'
WHERE id = '1';

Получаем список ставок для лота по его идентификатору с сортировкой по дате.

SELECT lot_id, amount, user_id FROM bid WHERE lot_id = 1 ORDER BY date_start ASC;
