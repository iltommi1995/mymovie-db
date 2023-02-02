CREATE DATABASE IF NOT EXISTS mymovie;
CREATE USER 'mymovie'@'%' IDENTIFIED BY 'mymovie';
GRANT ALL PRIVILEGES ON mymovie.* TO 'mymovie'@'%';
USE mymovie;
CREATE TABLE movies (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  year INT,
  director VARCHAR(255)
);

-- DB UPADATE: 2023-02-01 14:30:00
-- ----> Aggiunta tabella per il versioning
CREATE TABLE DB_VERSION(
  id INT AUTO_INCREMENT PRIMARY KEY,
  upgrade_time DATETIME,
  version_from VARCHAR(20),
  version_to VARCHAR(20),
  comment VARCHAR(255)
);

insert into DB_VERSION (upgrade_time, version_from, version_to, comment) 
values ("2023-02-01 14:30:00", "1.0", "1.1", "Aggiunta tabella per versioning");