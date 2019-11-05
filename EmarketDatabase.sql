CREATE DATABASE emarket;

USE emarket;

CREATE TABLE ordered_product (
	order_id int,
	product_id int,
	quantity int,
	PRIMARY KEY (order_id, product_id),
);

CREATE TABLE product_detail (
	product_id int PRIMARY KEY,
	information varchar(1000),
	image1 varchar(255),
	image2 varchar(255),
	image3 varchar(255),
	image4 varchar(255),
	image5 varchar(255),
	accessories varchar(2000),
	guaranty varchar(2000),
	ordered_productorder_id int,
	ordered_productporduct_id int,
	CONSTRAINT FK_product_detailordered_product FOREIGN KEY (ordered_productorder_id, ordered_productporduct_id)
	REFERENCES ordered_product(order_id, product_id)
);


CREATE TABLE customer (
	customer_id int PRIMARY KEY,
	name varchar(255),
	email varchar(255),
	phone char(10),
	address varchar(255),
	city_region varchar(255)
);


CREATE TABLE customer_order (
	order_id int PRIMARY KEY,
	amount int,
	date_created datetime,
	confirmation_number int,
	customercustomer_id int,
	ordered_productorder_id int,
	ordered_productporduct_id int,
	CONSTRAINT FK_customer_ordercustomer FOREIGN KEY (customercustomer_id)
	REFERENCES customer(customer_id),
	CONSTRAINT FK_customer_orderordered_product FOREIGN KEY (ordered_productorder_id, ordered_productporduct_id)
	REFERENCES ordered_product(order_id, product_id)
);


CREATE TABLE category (
	category_id int PRIMARY KEY,
	name varchar(255),
	image varchar(255)
);

CREATE TABLE product (
	product_id int PRIMARY KEY,
	name varchar(255),
	price real,
	description varchar(255),
	description_detail varchar(1000),
	image varchar(255),
	thumb_image varchar(255),
	last_update datetime,
	categorycategory_id int,
	product_detailproduct_id int,
	CONSTRAINT FK_productproduct_detail FOREIGN KEY (product_detailproduct_id)
	REFERENCES product_detail(product_id),
	CONSTRAINT FK_productcategory FOREIGN KEY (categorycategory_id)
	REFERENCES category(category_id)
);

