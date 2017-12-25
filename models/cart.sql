DROP TABLE IF EXISTS cart;

CREATE TABLE cart(

	Cart_id INT AUTO_INCREMENT PRIMARY KEY,
	User_id INT not null,
	Menu_item_id INT not null,
	FOREIGN KEY(User_id) REFERENCES user(User_id) ON DELETE CASCADE,
	FOREIGN KEY(Menu_item_id) REFERENCES menu_item(Menu_item_id) ON DELETE CASCADE

);
