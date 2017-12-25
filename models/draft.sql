DROP TABLE IF EXISTS menu_item;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS user;

-- creation
CREATE TABLE user(

	User_id INT AUTO_INCREMENT PRIMARY KEY,
	Fname VARCHAR(20) not null,
	Lname VARCHAR(20) not null,
	Mobile BIGINT(15) not null,
	Email VARCHAR(30) not null,
	Password VARCHAR(20) not null,
	Address VARCHAR(100) not null,
	unique(Email),
	unique(Mobile)

);

CREATE TABLE restaurant(

	Restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(50) not null,
	Logo VARCHAR(200) not null,
	Description VARCHAR(200) not null,
	Rating int(2) not null,
	City varchar(30) not null,
	Area varchar(30) not null
);

CREATE TABLE menu(

	Menu_id INT AUTO_INCREMENT PRIMARY KEY,
	Menu_name Varchar(50) not null,
	Restaurant_id INT,
	FOREIGN KEY(Restaurant_id) REFERENCES restaurant(Restaurant_id) ON DELETE CASCADE

);

CREATE TABLE menu_item(

	Menu_item_id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(50) not null,
	Image varchar(200) not null, 
	Veg BOOLEAN not null,
	Price INT(5) not null,
	Serves INT(2) not null,
	Menu_id INT not null,
	FOREIGN KEY(Menu_id) REFERENCES menu(Menu_id) ON DELETE CASCADE 
);

CREATE TABLE review(

	Review_id INT AUTO_INCREMENT PRIMARY KEY,
	Review_date DATE not null,
	Review VARCHAR(100) not null,
	Rating INT(2) not null,
	User_id INT not null,
	Restaurant_id INT not null,
	FOREIGN KEY(User_id) REFERENCES user(User_id) ON DELETE CASCADE,
	FOREIGN KEY(Restaurant_id) REFERENCES restaurant(Restaurant_id) ON DELETE CASCADE
);


-- correct procedure and trigger

delimiter //
drop PROCEDURE IF EXISTS onNewRestaurant//
CREATE PROCEDURE onNewRestaurant()
BEGIN
   Insert into menu ( Menu_name, Restaurant_id) values("Default Menu", (select max(Restaurant_id) from restaurant));
END//

drop procedure IF EXISTS onNewMenu//
CREATE PROCEDURE onNewMenu()
BEGIN
	INSERT into menu_item(Name, Image, Veg, Price, Serves, Menu_id) 
		VALUES("Default Name", "http://clipartwork.com/wp-content/uploads/2017/02/food-clipart.jpeg", 1, 50, 2, (select max(Menu_id) from menu));
END//

drop trigger if EXISTS onNewRestaurantTrigger//
CREATE TRIGGER onNewRestaurantTrigger
AFTER INSERT ON restaurant
FOR EACH ROW
BEGIN
CALL onNewRestaurant();
END//

drop trigger if EXISTS onNewMenuTrigger//
CREATE TRIGGER onNewMenuTrigger
AFTER INSERT ON menu
FOR EACH ROW
BEGIN
CALL onNewMenu();
END//