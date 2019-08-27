CREATE DATABASE yeticafe
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,
email CHAR(255) NOT NULL UNIQUE,
name CHAR(255) NOT NULL,
password CHAR(255) NOT NULL,
contact_info CHAR(255) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories(
id INT AUTO_INCREMENT PRIMARY KEY,
symbol_code CHAR NOT NULL UNIQUE,
name CHAR NOT NULL
);

CREATE TABLE lots(
id INT AUTO_INCREMENT PRIMARY KEY,
winner_id INT unsigned,
author_id INT unsigned NOT NULL,
category_id INT unsigned NOT NULL,
title CHAR NOT NULL,
description TEXT,
image_link TEXT,
start_price DECIMAL NOT NULL,
step_bid DECIMAL NOT NULL,
date_end DATE NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (winner_id) references users (id),
FOREIGN KEY (author_id) references users (id),
FOREIGN KEY (category_id) references categories (id)
);

CREATE TABLE bid(
id INT AUTO_INCREMENT PRIMARY KEY,
date_start TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
bid DECIMAL
);
