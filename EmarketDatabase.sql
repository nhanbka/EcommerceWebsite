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

CREATE TABLE role(
	roleid int,
	rolename nvarchar(50),
	PRIMARY KEY(roleid),
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
INSERT INTO role(roleid,rolename) VALUES (1,'admin'),(0,'customer');
UPDATE emarket_user
SET user_role=1 where name=N'l�m';

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
	 
INSERT INTO product (product_id, name, price, description, description_detail, image, thumb_image,
					last_update, categorycategory_id) VALUES 
	(2, 'Macbook Air 2019', '6000000.0', 
	'The Macbook Air 2019',
	'The base model of the MacBook Air comes with 8GB of RAM and 128GB of storage, which are matched with a 1.6GHz dual-core Intel Core i5 processor.
	 The processor appears a tad on the disappointing side for the price, compared to what you get elsewhere – the identically-priced HP Envy 13 gives you
 	 a quad-core processor – but HyperThreading means it can act like a quad-core processor, and it can boost its speed up to 3.6GHz for short tasks.
	 The screen is a 13-inch 2560x1600 Retina display, and it now includes True Tone support, which is Apples tech for adjusting the screen colours slightly
	 to match the ambient lighting in the room youre in, so your eyes dont become uncomfortable using a blue-tinted screen when your room lights are a soft orange.
	 Its a really great feature, and it was a big shame not to have it on last years model – once you get used to it, going back to regular screens feels
	 like a big step backwards.', 
	 'MacbookAir2019.png', 
	 'MacbookAir2019.png', 
	 getdate(),
	 2);
	 
INSERT INTO product (product_id, name, price, description, description_detail, image, thumb_image,
					last_update, categorycategory_id) VALUES 
	(3, 'Macbook Pro 2019', '8500000.0', 
	'The Macbook Pro 2019',
	'The new 16-inch MacBook Pro features a larger 16-inch Retina display, slimmer bezels, an updated
	 keyboard with a scissor mechanism instead of a butterfly mechanism, up to 64GB RAM, up to 8TB of
	 storage, and AMD Radeon Pro 5000M Series graphics cards. The Touch Bar and the Retina display of
	 all MacBook Pro models feature support for True Tone functionality that adjusts white balance to
	 match ambient lighting, and other display features such as wide color support are included.', 
	 'MacbookPro2019.png', 
	 'MacbookPro2019.png', 
	 getdate(),
	 3);
	 
INSERT INTO product (product_id, name, price, description, description_detail, image, thumb_image,
					last_update, categorycategory_id) VALUES 
	(4, 'iMac Pro', '9000000.0', 
	'The iMac Pro',
	'The iMac Pro was introduced at WWDC on June 5, 2017 and was released in December 2017. Apple billed
	 it as "the most powerful Mac ever made". Its starting price is US$4999. It includes an 8-, 10-, 14-,
	 or 18-core Intel Xeon processor, 5K display, AMD Vega graphics, ECC memory, and 10 Gigabit Ethernet.
	 It includes a custom Apple T2 chip to store encrypted keys, and a custom version of macOS that allows
	 the user to lock down the booting process. On March 19, 2019, options for 256 GB of memory and a Vega
	 64X GPU were added.', 
	 'iMacPro.png', 
	 'iMacPro.png', 
	 getdate(),
	 4);
	 
INSERT INTO product (product_id, name, price, description, description_detail, image, thumb_image,
					last_update, categorycategory_id) VALUES 
	(5, 'iPhone 11', '5000000.0', 
	'The iPhone 11',
	'The iPhone 11 succeeds the iPhone XR, and it features a 6.1-inch LCD display that Apple calls a
	 "Liquid Retina HD Display." It features a 1792 x 828 resolution at 326ppi, a 1400:1 contrast ratio,
	 625 nits max brightness, True Tone support for adjusting the white balance to the ambient lighting,
	 and wide color support for true-to-life colors.', 
	 'iphone 11.png', 
	 'iphone 11.png', 
	 getdate(),
	 5);
	 
INSERT INTO product (product_id, name, price, description, description_detail, image, thumb_image,
					last_update, categorycategory_id) VALUES 
	(6, 'iPhone xs', '4000000.0', 
	'The iPhone xs',
	'The XS has a design visually near-identical to the X but includes upgraded hardware, featuring
	 the A12 Bionic chip built with a 7 nanometer process. It also features a 5.85-inch (149 mm) OLED
	 display and contains dual 12-megapixel rear cameras and one 7-megapixel front-facing camera. The XS
	 Max features the same hardware and cameras, but has a larger 6.46-inch (164 mm) OLED display and battery
	 (3,174mAh). It was also noted by the media that the XS received a smaller battery than that of the X (dropping
	 to 2,658 mAh from 2,716 mAh). The XS battery is a new single-cell L-shaped battery, while the iPhone XS Max
	 battery remains two cells like the iPhone X. Additionally, Apple states that iPhone XS lasts up to 30 minutes longer
	 than iPhone X, while iPhone XS Max lasts up to 1.5 hours longer than iPhone X.', 
	 'iphone xs.png', 
	 'iphone xs.png', 
	 getdate(),
	 6);
	 
INSERT INTO product (product_id, name, price, description, description_detail, image, thumb_image,
					last_update, categorycategory_id) VALUES 
	(7, 'Magic mouse 2', '1000000.0', 
	'The magic mouse 2',
	'The Magic Mouse 2 (Apple Magic Mouse 2), is a computer mouse developed and released by Apple Inc.
	 It features a multi-touch acrylic surface for scrolling. The mouse detects the difference between
	 gestures on the surface. Announced on October 13, 2015, it is similar to its predecessor as a Bluetooth-enabled
	 trackpad with the key difference being that it is powered not by AA batteries, but by a rechargeable internal
	 battery. The mouse is compatible with Apple Macintosh desktop and laptop computers running Mac OS X El
	 Capitan versions 10.11 and higher and iPad tablets running iPadOS 13. The mouse features a lithium-ion rechargeable
	 battery and Lightning connector for charging and pairing. Unlike other similar models, the Magic Mouse 2 has its charging
	 connector on the bottom, and thus cannot be used during recharging. The mouse uses an ST Microelectronics STM32F103VB 72 MHz
	 32-bit RISC ARM Cortex-M3 processor and includes the Broadcom BCM20733 Enhanced Data Rate Bluetooth 3.0.', 
	 'magic mouse 2.png', 
	 'magic mouse 2.png', 
	 getdate(),
	 7);
	 
INSERT INTO product (product_id, name, price, description, description_detail, image, thumb_image,
					last_update, categorycategory_id) VALUES 
	(8, 'Magic trackpad', '1500000.0', 
	'The magic trackpad',
	'The Magic Trackpad is made of glass and aluminium. The trackpad is designed in the same style as Apples
     Wireless Keyboard and can sit flush to it. The entire trackpad can be used as a button; pressing down on 
	 it puts pressure on two circular feet below to register a click. The trackpad connects via Bluetooth and 
	 runs on two AA batteries.', 
	 'magic trackpad.png', 
	 'magic trackpad.png', 
	 getdate(),
	 8);
	 
INSERT INTO product (product_id, name, price, description, description_detail, image, thumb_image,
					last_update, categorycategory_id) VALUES 
	(9, 'Airpods', '2000000.0', 
	'The airpods',
	'The Apple AirPods 1 (1st generation), the first wireless earbuds to have been introduced by Apple, 
 	 were initially released on December 13, 2016. The first generation AirPods are configured with a built-in
	 microphone capable of filtering out any background noise, commences phone calls and interactions with Siri. 
	 Externally, the AirPods appear identical to the standard Apple wired EarPods – of course, sans the wire itself – the 
	 distinctive difference being a thicker arm noticeable on the AirPods explained by the necessity to fit both the device’s 
	 battery and microphone inside it.', 
	 'airpods.png', 
	 'airpods.png', 
	 getdate(),
	 9);
	 
INSERT INTO product (product_id, name, price, description, description_detail, image, thumb_image,
					last_update, categorycategory_id) VALUES 
	(10, 'Airpods Pro', '3000000.0', 
	'The airpods pro',
	'AirPods Pro are wireless Bluetooth earbuds created by Apple, initially released on October 30, 2019. 
	 AirPods Pro use the same H1 chip found in second generation AirPods, but add active noise cancellation, 
	 automated frequency profile setting, IPX4 water resistance, a charging case with wireless charging, 
	 and interchangeable silicone tips.', 
	 'airpods pro.png', 
	 'airpods pro.png', 
	 getdate(),
	 10);
	 

CREATE TABLE emarket_user (
	id varchar(20),
	user_password VARCHAR(30) NOT NULL,
	user_role INT CHECK(user_role BETWEEN 0 AND 3) NOT NULL,
	name NVARCHAR(50) NOT NULL,
	gender INT CHECK (gender BETWEEN 0 AND 2) NOT NULL,
	balance INT NOT NULL,
	email varchar(50),
	PRIMARY KEY (id, email)
);

