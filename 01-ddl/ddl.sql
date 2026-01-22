-- DDL = data definition language (create the structure) 
-- DML = data manipulation lanague (CURD)
-- DQL = data query langauge (SQL)
CREATE DATABASE swimming_coach;

-- show all database in the server 
show databases;

-- switch 
use swiming_coach;

-- create the parents table 
CREATE TABLE parents (
    parent_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45),
    last_nae VARCHAR(45) 
) engine = innodb;

CREATE TABLE students (
    student_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45),
    swimming_level TINYINT,
    dob DATETIME
) engine = innodb;

show tables;

-- see the columns and data types of a table 
DESCRIBE students;

-- Alter table column first 
ALTER TABLE students ADD COLUMN parent_id INT UNSIGNED NOT NULL;

-- set students.parent_id as a foreign key 
ALTER TABLE students ADD CONSTRAINT fk_parents_students 
FOREIGN KEY (parent_id) REFERENCES parents(parent_id) 
ON DELETE CASCADE
ON UPDATE RESTRICT;

-- remove a column from a table 
ALTER TABLE students DROP COLUMN swimming_level;

-- modify an existing clumn 
ALTER TABLE parents MODIFY COLUMN first_name VARCHAR(45) NOT NULL;

-- insert data 
INSERT INTO parents (first_name, last_nae) VALUES ("Ah Kow", "Tan");

-- rename column name 
ALTER TABLE parents RENAME COLUMN last_nae TO last_name;