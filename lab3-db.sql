CREATE DATABASE IF NOT EXISTS student_project;
USE student_project;

DROP TABLE IF EXISTS driver_has_car;
DROP TABLE IF EXISTS trip;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS driver;

CREATE TABLE driver (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
rating INT NOT NULL,
completed_orders INT NOT NULL,
is_vacant TINYINT NOT NULL
) ENGINE = INNODB;

CREATE TABLE car (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
brand VARCHAR(50) NOT NULL,
class VARCHAR(50) NOT NULL
) ENGINE = INNODB;

CREATE TABLE driver_has_car (
driver_id BIGINT NOT NULL,
car_id BIGINT NOT NULL,
PRIMARY KEY (driver_id, car_id)
) ENGINE = INNODB;

CREATE TABLE user (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
rating INT NOT NULL
) ENGINE = INNODB;

CREATE TABLE trip (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
start_point VARCHAR(50) NOT NULL,
end_point VARCHAR(50) NOT NULL,
driver_id BIGINT NULL,
CONSTRAINT FK_trip_driver_driver
FOREIGN KEY (driver_id)
REFERENCES driver (id)
ON DELETE CASCADE ON UPDATE SET NULL,
user_id BIGINT NULL,
CONSTRAINT FK_trip_user_user
FOREIGN KEY (user_id)
REFERENCES user (id)
ON DELETE CASCADE ON UPDATE SET NULL
) ENGINE = INNODB;

insert into car (brand, class) values
("Toyota1", "middle"),
("Toyota2", "premium"),
("Toyota3", "classic"),
("Toyota4", "middle"),
("Toyota5", "premium"),
("Toyota6", "middle"),
("Toyota7", "middle");

insert into user (name, rating) values
("Sofia", 5),
("Mary", 5),
("Oksana", 5),
("Lesya", 5),
("Zenoviy", 5),
("Liuda", 5),
("Bogdan", 5),
("Andriana", 5);

insert into driver (name, rating, completed_orders, is_vacant) values
("Roman", 5, 56, 1),
("Rostyk", 5, 565, 1),
("John", 5, 576, 1),
("Mike", 5, 596, 1),
("Steve", 5, 586, 1);

insert into trip (start_point, end_point, driver_id, user_id) values
("a", "b", 1, 1),
( "c", "d", 2, 2),
("e", "f", 3, 1),
("g", "h", 4, 2);

insert into driver_has_car(driver_id, car_id) values
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(1, 4);

CREATE INDEX is_vacant_x ON driver(is_vacant);
CREATE INDEX class_x ON car(class);


SHOW INDEX FROM driver;
SHOW INDEX FROM car;








