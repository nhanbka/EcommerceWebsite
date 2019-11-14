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

INSERT INTO product_detail (product_id) VALUES
	(1);

INSERT INTO category (category_id) VALUES (1);

INSERT INTO product (product_id, name, price, description, description_detail, image, thumb_image,
					last_update, categorycategory_id) VALUES 
	(1, 'Macbook Pro Late 2013', '5000000.0', 
	'The Macbook Pro Late 2013',
	'The MacBook Pro "Core i5" 2.4 13-Inch (Late 2013) features 2.4 GHz Intel "Core i5" processor,
	 with dual independent processor "cores" on a single silicon chip, a 3 MB shared level 3 cache,
	 8 GB of onboard DDR3L SDRAM, 256 GB of PCIe-based flash storage, and an integrated Intel Iris
	 5100 graphics processor that shares memory with the system. It also has an integrated 720p FaceTime
	 HD webcam and a high-resolution LED-backlit 13.3" widescreen 2560x1600 "Retina" display in a case
     that weighs just less than 3.5 pounds (1.57 kg). Connectivity includes 802.11ac Wi-Fi, Bluetooth 4.0,
	 two USB 3.0 ports, two "Thunderbolt 2" ports, an HDMI port, an audio in/out port, and an SDXC card slot.
	 It does not have an internal optical drive. Comes with US English Keyboard. Battery Backup
	 guaranteed for a minimum of 60 minutes.', 
	 'MacLate2013.png', 
	 'MacLate2013.png', 
	 getdate(),
	 1);

	 