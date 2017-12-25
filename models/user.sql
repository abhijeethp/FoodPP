DROP TABLE IF EXISTS menu;
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

-- insertion
INSERT INTO user(
Fname,
Lname, 
Mobile, 
Email, 
Password,
Address)
VALUES
("Abhijeeth", "Padarthi", 9035411162, "rkinabhi@gmail.com", "password", "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi inventore veniam, alias porro aspernatur neque repellendus laudantium hic nesciunt voluptatibus quisquam eum sint fugit soluta voluptate reprehenderit vitae! Alias, ut."),
("Bramha", "gupta", 9900990099, "bujjimama@gmail.com", "password", "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam numquam facilis quidem repudiandae non, libero reprehenderit ea! Maxime assumenda deserunt, ex, perferendis possimus illum molestiae! Tempore ea velit hic quibusdam.");

