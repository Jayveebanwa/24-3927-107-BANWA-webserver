CREATE DATABASE IF NOT EXISTS school;

USE school;

CREATE TABLE IF NOT EXISTS students (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) DEFAULT NULL,
    course VARCHAR(100) DEFAULT NULL,
    year_level INT(11) DEFAULT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB
  AUTO_INCREMENT=8
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;



CREATE TABLE IF NOT EXISTS courses (
    course_id INT(11) NOT NULL AUTO_INCREMENT,
    course_name VARCHAR(100) DEFAULT NULL,
    description VARCHAR(255) DEFAULT NULL,
    units INT(11) DEFAULT NULL,
    PRIMARY KEY (course_id)
) ENGINE=InnoDB
  AUTO_INCREMENT=7
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;


INSERT INTO students (id, name, course, year_level) VALUES
(1, 'Juan Dela Cruz', 'BSIT', 2),
(2, 'Maria Santos', 'BSCS', 2),
(4, 'Jeyvezer Banwa', 'BSIT Web', 3),
(6, 'Maria Santos', 'BSCS', 2);


INSERT INTO courses (course_id, course_name, description, units) VALUES
(1, 'Emerging technologies In IT',
 'Students will learn about the different kinds of emerging tech such as AI Machine Learning and IOTs',
 3),

(2, 'Quantitative Analysis',
 'Tackles quantitative data and calculations',
 3),

(3, 'Capstone Project 1',
 'Engages Students to think of innovative projects and ideas',
 3);