CREATE DATABASE wep_c_8 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON wep_c_8.* TO 'web'@'localhost' IDENTIFIED BY 'asdf';

use wep_c_8;


CREATE TABLE users (
	id VARCHAR(20) PRIMARY KEY, 
	pw VARCHAR(20) NOT NULL, 
	name VARCHAR(20),
	address VARCHAR(100),
	phone VARCHAR(20) NOT NULL,
	grade int NOT NULL
);

CREATE TABLE menus (
	id int AUTO_INCREMENT PRIMARY KEY, 
	user_id VARCHAR(20) NOT NULL, 
	name VARCHAR(30),
	price int,
	description text,
	category VARCHAR(30),
	img MEDIUMBLOB
);

CREATE TABLE coupons (
	id int AUTO_INCREMENT PRIMARY KEY, 
	user_id VARCHAR(20) NOT NULL, 
	count int
);

CREATE TABLE stars (
	id int AUTO_INCREMENT PRIMARY KEY, 
	menu_id int,
	score int
);

CREATE TABLE orders (
	id int AUTO_INCREMENT PRIMARY KEY, 
	user_id VARCHAR(20) NOT NULL, 
	shop_id VARCHAR(20),
	Date DateTime
);

CREATE TABLE order_menus (
	id int AUTO_INCREMENT PRIMARY KEY, 
	order_id int,
	menu_id int
);
