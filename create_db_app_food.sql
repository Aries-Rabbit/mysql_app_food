-- Tạo dababase như hình
use app_food;
CREATE TABLE user (
    user_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);
CREATE TABLE restaurant (
    res_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    res_name VARCHAR(255),
    image VARCHAR(255),
    description VARCHAR(255)
);
CREATE TABLE rate_res (
    amount int,
    date_rate DATETIME,
    user_id int FOREIGN KEY REFERENCES user(user_id),
    res_id int FOREIGN KEY REFERENCES restaurant(res_id)
);
CREATE TABLE rate_res (
	user_id int,
	res_id int,
    amount int,
    date_rate DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);
CREATE TABLE like_res (
	user_id int,
	res_id int,
    date_like DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);
CREATE TABLE food_type (
    type_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(255)
);
CREATE TABLE food (
    food_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(255),
    image VARCHAR(255),
    price FLOAT,
    description VARCHAR(255),
    type_id int,
    FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

CREATE TABLE orders (
	user_id int,
	food_id int,
--     amount int,
--     code VARCHAR(255),
--     arr_sub_id VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);
ALTER TABLE orders
ADD  amount int;
ALTER TABLE orders
ADD code VARCHAR(255);
ALTER TABLE orders
ADD arr_sub_id VARCHAR(255);

CREATE TABLE sub_food (
    sub_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sub_name VARCHAR(255),
    sub_price VARCHAR(255),
    food_id int,
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);