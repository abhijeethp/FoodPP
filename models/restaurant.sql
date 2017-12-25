DROP TABLE IF EXISTS restaurant;

CREATE TABLE restaurant(

	Restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(50) not null,
	Logo VARCHAR(200) not null,
	Description VARCHAR(100) not null,
	Rating int(2) not null,
	City varchar(30) not null,
	Area varchar(30) not null
);

