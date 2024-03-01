CREATE DATABASE plantShop;
use plantShop;

CREATE TABLE usuarios (
id INT AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(255) UNIQUE NOT NULL,
nombre VARCHAR(100) NOT NULL,
direccion VARCHAR(255),
password VARCHAR(255) NOT NULL
);

CREATE TABLE plants (
plantID INT AUTO_INCREMENT PRIMARY KEY,
plantName VARCHAR(100),
descriptionPlant TEXT,
careInstructions TEXT,
price DECIMAL(10, 2),
imageURL VARCHAR(255)
);

CREATE TABLE favorites (
favoriteID INT AUTO_INCREMENT PRIMARY KEY,
id INT,
plantID INT,
FOREIGN KEY (id) REFERENCES usuarios(id),
FOREIGN KEY (plantID) REFERENCES Plants(plantID)
);

CREATE TABLE ContactProfessionals (
    contactID INT AUTO_INCREMENT PRIMARY KEY,
    id INT,
    message TEXT,
    messageStatus ENUM('read', 'unread') DEFAULT 'unread',
    FOREIGN KEY (id) REFERENCES usuarios(id)
    );





