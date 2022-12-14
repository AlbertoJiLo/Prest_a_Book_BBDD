DROP DATABASE IF EXISTS prest_a_book;
CREATE DATABASE prest_a_book;
USE prest_a_book;

CREATE TABLE users(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
username VARCHAR(60) NOT NULL,
psswd VARCHAR(40) NOT NULL, 
email VARCHAR(60) NOT NULL,
real_name VARCHAR(60) NOT NULL,
surname VARCHAR(80),
birth_date DATE,
gender ENUM('H','M', 'otro')
);

CREATE TABLE editorial(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
editorial_name VARCHAR (60) NOT NULL,
country VARCHAR(40),
id_user INT NOT NULL,
FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE container(
id INT PRIMARY KEY NOT NULL
);

CREATE TABLE drawer(
id VARCHAR(5) PRIMARY KEY NOT NULL,
id_container INT NOT NULL,
FOREIGN KEY (id_container) REFERENCES container(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE book(
ISBN VARCHAR(13) PRIMARY KEY NOT NULL,
title VARCHAR(40) NOT NULL,
num_pages INT NOT NULL,
genre VARCHAR(40),
id_user INT NOT NULL,
id_editorial INT NOT NULL,
id_drawer VARCHAR(5) NOT NULL,
FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_editorial) REFERENCES editorial(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_drawer) REFERENCES drawer(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE author(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
author_name VARCHAR(60) NOT NULL,
surname VARCHAR(80) NOT NULL,
birth_date DATE,
nationality VARCHAR(40),
descr TEXT,
gender ENUM('H','M', 'otro')
);

CREATE TABLE wrote(
isbn VARCHAR(13) NOT NULL PRIMARY KEY,
id_author INT NOT NULL,
FOREIGN KEY (isbn) REFERENCES book(isbn) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_author) REFERENCES author(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE loan(
isbn VARCHAR(13) NOT NULL,
id_loaner INT NOT NULL,
id_loanee INT NOT NULL,
starting_date DATE NOT NULL,
end_date DATE,
PRIMARY KEY(isbn, id_loaner, id_loanee),
FOREIGN KEY (isbn) REFERENCES book(isbn) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_loaner) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_loanee) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);




