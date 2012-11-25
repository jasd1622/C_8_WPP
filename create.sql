CREATE DATABASE wep_c_8 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON wep_c_8.* TO 'web'@'localhost' IDENTIFIED BY 'asdf';

use wep_c_8;


CREATE TABLE users (
	id varchar(20) AUTO_INCREMENT PRIMARY KEY, 
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
	category VARCHAR(30)
};

CREATE TABLE coupons (
	id int AUTO_INCREMENT PRIMARY KEY, 
	user_id VARCHAR(20) NOT NULL, 
	count int
};

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
};

CREATE TABLE order_menus (
	id int AUTO_INCREMENT PRIMARY KEY, 
	order_id int,
	menu_id int
};

--INSERT INTO users VALUES (1, 'dongseop', 'Dongseop Kwon', '12345', 'dongseop@gmail.com', 'KOREA','M', null);
--INSERT INTO users VALUES (2, 'test1', 'test2', '12345', 'test@gmail.com', 'USA','M', null);
--INSERT INTO users VALUES (3, 'testa', 'test2', '12345', 'testa@gmail.com', 'USA','F', null);
--INSERT INTO users VALUES (4, 'testb', 'test2', '12345', 'testb@gmail.com', 'JAPAN','F', null);
--INSERT INTO users VALUES (5, 'testc', 'test2', '12345', 'testc@gmail.com', 'USA','M', null);
--INSERT INTO users VALUES (6, 'testd', 'test2', '12345', 'testd@gmail.com', 'KOREA','F', null);
--INSERT INTO users VALUES (7, 'teste', 'test2', '12345', 'teste@gmail.com', 'USA','M', null);
