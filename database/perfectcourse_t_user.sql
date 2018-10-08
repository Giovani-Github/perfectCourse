CREATE TABLE perfectcourse.t_user
(
    user_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    username varchar(30),
    password varchar(40)
);
INSERT INTO perfectcourse.t_user (username, password) VALUES ('giovani', '123');