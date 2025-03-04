CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO users (name, email) VALUES
('Lydéric', 'lyderic@kauriweb.com'),
('Loïc', 'loic@kauriweb.com'),
('Enrick', 'contact@hello-dev.fr');
