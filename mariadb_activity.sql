CREATE DATABASE IF NOT EXISTS school;

USE school;
git commit 
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
 3);MariaDB [(none)]> USE school;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [school]> CREATE TABLE enrollments (
    -> enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    -> student_id INT,
    -> course_id INT;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 4
MariaDB [(none)]> USE school
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [school]> SHOW TABLES;
+------------------+
| Tables_in_school |
+------------------+
| courses          |
| students         |
+------------------+
2 rows in set (0.000 sec)

MariaDB [school]> CREATE TABLE enrollments (
    -> course_id INT AUTO_INCREMENT PRIMARY KEY,
    -> student_id INT,
    -> AAA;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 4
MariaDB [school]> CREATE TABLE enrollments (
    -> enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    -> student_id INT,
    -> course_id INT;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 4
MariaDB [school]> CREATE TABLE enrollments (
    -> enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    -> students_id INT,
    -> courses_id INT;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 4
MariaDB [school]> CREATE TABLE enrollments (
    -> enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    -> students_id INT,
    -> courses_id INT,
    -> enrollment_date DATE);
Query OK, 0 rows affected (0.011 sec)

MariaDB [school]> DESCRIBE enrollments
    -> ;
+-----------------+---------+------+-----+---------+----------------+
| Field           | Type    | Null | Key | Default | Extra          |
+-----------------+---------+------+-----+---------+----------------+
| enrollment_id   | int(11) | NO   | PRI | NULL    | auto_increment |
| students_id     | int(11) | YES  |     | NULL    |                |
| courses_id      | int(11) | YES  |     | NULL    |                |
| enrollment_date | date    | YES  |     | NULL    |                |
+-----------------+---------+------+-----+---------+----------------+
4 rows in set (0.001 sec)

MariaDB [school]> ALTER TABLE enrollments
    -> ADD CONSTRAINTS fk_student
    -> FOREIGN KEY (students_id)
    -> REFERENCES students(id);
ERROR 4161 (HY000): Unknown data type: 'fk_student'
MariaDB [school]> ALTER TABLE enrollments
    -> ADD CONSTRAINT fk_student
    -> FOREIGN KEY (students_id)
    -> REFERENCES students(id);
Query OK, 0 rows affected (0.017 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [school]> ALTER TABLE enrollments
    -> ADD CONSTRAINT fk_course
    -> FOREIGN KEY (courses_id)
    -> REFERENCES courses(courses_id);
ERROR 1005 (HY000): Can't create table `school`.`enrollments` (errno: 150 "Foreign key constraint is incorrectly formed")
MariaDB [school]> ALTER TABLE enrollments
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> ;
Query OK, 0 rows affected (0.000 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [school]> ALTER TABLE enrollments
    -> ADD CONSTRAINT fk_course
    -> FOREIGN KEY (course_id)
    -> REFERENCES courses(course_id);
ERROR 1072 (42000): Key column 'course_id' doesn't exist in table
MariaDB [school]> ALTER TABLE enrollments
    -> ADD CONSTRAINT fk_course
    -> FOREIGN KEY (course_id)
    -> REFERENCES courses(courses_id);
ERROR 1072 (42000): Key column 'course_id' doesn't exist in table
MariaDB [school]> ALTER TABLE enrollment
    -> ADD CONSTRAINT fk_course
    -> FOREIGN KEY (course_id)
    -> REFERENCES courses(course_id);
ERROR 1146 (42S02): Table 'school.enrollment' doesn't exist
MariaDB [school]> ALTER TABLE enrollments
    -> ADD CONSTRAINTS fk_courses
    -> FOREIGN KEY (courses_id)
    -> REFERENCES courses(courses_id);
ERROR 4161 (HY000): Unknown data type: 'fk_courses'
MariaDB [school]> ALTER TABLE enrollments
    -> ADD CONSTRAINT fk_course
    -> FOREIGN KEY (courses_id)
    -> REFEENCES course(courses_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'REFEENCES course(courses_id)' at line 4
MariaDB [school]> ALTER TABLE enrollments
    -> ADD CONSTRAINT fk_course
    -> FOREIGN KEY (courses_id)
    -> REFERENCES course(courses_id);
ERROR 1005 (HY000): Can't create table `school`.`enrollments` (errno: 150 "Foreign key constraint is incorrectly formed")
MariaDB [school]> DESCRIBE enrollments;
+-----------------+---------+------+-----+---------+----------------+
| Field           | Type    | Null | Key | Default | Extra          |
+-----------------+---------+------+-----+---------+----------------+
| enrollment_id   | int(11) | NO   | PRI | NULL    | auto_increment |
| students_id     | int(11) | YES  | MUL | NULL    |                |
| courses_id      | int(11) | YES  |     | NULL    |                |
| enrollment_date | date    | YES  |     | NULL    |                |
+-----------------+---------+------+-----+---------+----------------+
4 rows in set (0.001 sec)

MariaDB [school]> ALTER TABLE enrollments
    -> ADD CONSTRAINT fk_course
    -> FOREIGN KEY (course_id)
    -> REFERENCES courses(course_id);
ERROR 1072 (42000): Key column 'course_id' doesn't exist in table
MariaDB [school]> ALTER TABLE enrollments ADD CONSTRAINT fk_course FOREIGN KEY (courses_id) REFERENCES courses(courses_id);
ERROR 1005 (HY000): Can't create table `school`.`enrollments` (errno: 150 "Foreign key constraint is incorrectly formed")
MariaDB [school]> ALTER TABLE enrollments DROP FOREIGN KEY fk_courses;
ERROR 1091 (42000): Can't DROP FOREIGN KEY `fk_courses`; check that it exists
MariaDB [school]> ALTER TABLE enrollments DROP FOREIGN KEY fk_course;
ERROR 1091 (42000): Can't DROP FOREIGN KEY `fk_course`; check that it exists
MariaDB [school]> DESCRIBE enrollments;
+-----------------+---------+------+-----+---------+----------------+
| Field           | Type    | Null | Key | Default | Extra          |
+-----------------+---------+------+-----+---------+----------------+
| enrollment_id   | int(11) | NO   | PRI | NULL    | auto_increment |
| students_id     | int(11) | YES  | MUL | NULL    |                |
| courses_id      | int(11) | YES  |     | NULL    |                |
| enrollment_date | date    | YES  |     | NULL    |                |
+-----------------+---------+------+-----+---------+----------------+
4 rows in set (0.001 sec)

MariaDB [school]> ALTER TABLE enrollments DROP FOREIGN KEY fk_course;
ERROR 1091 (42000): Can't DROP FOREIGN KEY `fk_course`; check that it exists
MariaDB [school]> ALTER TABLE enrollments ADD CONSTRAINT fk_course FOREIGN KEY (courses_id) REFERENCES courses(courses_id);
ERROR 1005 (HY000): Can't create table `school`.`enrollments` (errno: 150 "Foreign key constraint is incorrectly formed")
MariaDB [school]> SHOW CREATE TABLE enrollments;
+-------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table       | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                 |
+-------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| enrollments | CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL AUTO_INCREMENT,
  `students_id` int(11) DEFAULT NULL,
  `courses_id` int(11) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `fk_student` (`students_id`),
  CONSTRAINT `fk_student` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci |
+-------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.000 sec)

MariaDB [school]> DESCRIBE courses;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| course_id   | int(11)      | NO   | PRI | NULL    | auto_increment |
| course_name | varchar(100) | YES  |     | NULL    |                |
| description | varchar(255) | YES  |     | NULL    |                |
| units       | int(11)      | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
4 rows in set (0.001 sec)

MariaDB [school]> ALTER TABLE enrollments 
    -> ADD CONSTRAINT fk_course 
    -> FOREIGN KEY (courses_id) REFERENCES courses(course_id);
Query OK, 0 rows affected (0.020 sec)
Records: 0  Duplicates: 0  Warnings: 0

