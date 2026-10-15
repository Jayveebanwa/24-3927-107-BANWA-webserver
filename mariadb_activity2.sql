
-- 1. CREATE DATABASE

CREATE DATABASE IF NOT EXISTS school;
USE school;


-- 2. CREATE TABLES


CREATE TABLE students (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    course VARCHAR(100),
    year_level INT(11),
    PRIMARY KEY (id)
);

CREATE TABLE courses (
    course_id INT(11) NOT NULL AUTO_INCREMENT,
    course_name VARCHAR(100),
    description VARCHAR(255),
    units INT(11),
    PRIMARY KEY (course_id)
);

CREATE TABLE enrollments (
    enrollment_id INT(11) NOT NULL AUTO_INCREMENT,
    students_id INT(11),
    courses_id INT(11),
    enrollment_date DATE,
    PRIMARY KEY (enrollment_id)
);


-- 3. ALTER TABLE: FOREIGN KEY CONSTRAINTS

ALTER TABLE enrollments
ADD CONSTRAINT fk_student
FOREIGN KEY (students_id)
REFERENCES students(id);

ALTER TABLE enrollments
ADD CONSTRAINT fk_enrollment_course
FOREIGN KEY (courses_id)
REFERENCES courses(course_id);



-- 4. INSERT STUDENT RECORDS

INSERT INTO students (id, name)
VALUES
(1, 'Juan Dela Cruz'),
(2, 'Maria Santos'),
(4, 'Jeyvezer Banwa'),
(6, 'Maria Santos'),
(8, 'Angela Reyes'),
(9, 'Mark Villanueva'),
(10, 'Sofia Mendoza');


-- 5. INSERT COURSE RECORDS

INSERT INTO courses (course_id, course_name)
VALUES
(1, 'Emerging technologies In IT'),
(2, 'Quantitative Analysis'),
(3, 'Capstone Project 1'),
(7, 'Web Development'),
(8, 'Database Management');



-- 6. INSERT ENROLLMENT RECORDS

INSERT INTO enrollments
    (students_id, courses_id, enrollment_date)
VALUES
(1, 1, '2026-10-07');

INSERT INTO enrollments
    (students_id, courses_id, enrollment_date)
VALUES
(1, 7, '2026-10-02'),
(2, 2, '2026-10-03'),
(2, 8, '2026-10-04'),
(4, 3, '2026-10-05'),
(4, 7, '2026-10-06'),
(6, 1, '2026-10-08'),
(8, 2, '2026-10-09'),
(9, 8, '2026-10-10'),
(10, 3, '2026-10-11');


-- 7. SELECT: DISPLAY TABLE RECORDS

SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM enrollments;


-- 8. JOIN: DISPLAY STUDENT ENROLLMENTS

SELECT
    students.name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.students_id = students.id
JOIN courses
    ON enrollments.courses_id = courses.course_id;


-- 9. WHERE: SEARCH FOR A SPECIFIC COURSE

SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.students_id = students.id
JOIN courses
    ON enrollments.courses_id = courses.course_id
WHERE courses.course_name = 'Web Development';


-- 10. ORDER BY: SORT STUDENT ENROLLMENTS

SELECT
    students.id AS students_id,
    students.name AS student_name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.students_id = students.id
JOIN courses
    ON enrollments.courses_id = courses.course_id
ORDER BY students.name;


-- 11. GROUP BY AND COUNT: COUNT STUDENTS PER COURSE

SELECT
    courses.course_name,
    COUNT(enrollments.students_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.courses_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC;


-- 12. COUNT: COUNT ALL RECORDS

SELECT COUNT(*) AS total_students
FROM students;

SELECT COUNT(*) AS total_courses
FROM courses;

SELECT COUNT(*) AS total_enrollments
FROM enrollments;
