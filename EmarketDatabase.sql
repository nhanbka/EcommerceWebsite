CREATE DATABASE emarket;

USE emarket;
CREATE TABLE product_detail(
	product_id int PRIMARY KEY,
	information nvarchar(1000),
	image1 varchar(255),
	image2 varchar(255),
	image3 varchar(255),
	image4 varchar(255),
	image5 varchar(255),
	accessories varchar(2000),
	guaranty varchar(2000),
	ordered_productorder_id int,
	ordered_productporduct_id int
);