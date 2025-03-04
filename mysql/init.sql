-- Création de la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS testdb;

-- Utilisation de la base de données
USE testdb;

-- Création de l'utilisateur et attribution des droits
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'userpassword';
GRANT ALL PRIVILEGES ON testdb.* TO 'user'@'%';
FLUSH PRIVILEGES;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO users (name, email) VALUES
('Lydéric', 'lyderic@kauriweb.com'),
('Loïc', 'loic@kauriweb.com'),
('Enrick', 'contact@hello-dev.fr');
