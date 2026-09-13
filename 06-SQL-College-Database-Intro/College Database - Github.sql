-- using hitechcollege db
USE hitechcollege;

-- Viewing all tables
SHOW TABLES;

-- Viewing the structure of each table
DESCRIBE academicrecord;
DESCRIBE staff;
DESCRIBE students;
DESCRIBE subjects;

-- Viewing tables & only showing the first 10 rows 
SELECT * FROM students LIMIT 10;
SELECT * FROM academicrecord LIMIT 20;
SELECT * FROM subjects LIMIT 25;
SELECT * FROM staff LIMIT 5;

-- Adding more students to the table by desribing the table i want to modify, i am DESCRIBING to show the column names i will need for the insert
SELECT * FROM students;
DESCRIBE students;

USE hitechcollege;
INSERT INTO students (studentid, firstname, lastname, department, age, gender, address) VALUES
(9, 'Thandi', 'Dlamini', 'IT', 20, 'Female', '12 Church St, Pietermaritzburg'),
(10, 'Sipho', 'Ngcobo', 'Business', 22, 'Male', '45 Long St, Durban'),
(11, 'Ayesha', 'Pillay', 'IT', 19, 'Female', '8 Palm Rd, Phoenix'),
(12, 'Lwazi', 'Mthembu', 'Engineering', 21, 'Male', '23 Main Rd, Richmond'),
(13, 'Naledi', 'Khumalo', 'Business', 20, 'Female', '56 Voortrekker St, Howick'),
(14, 'Johan', 'van Wyk', 'Engineering', 23, 'Male', '14 Oak Ave, Hilton'),
(15, 'Zinhle', 'Zondi', 'IT', 18, 'Female', '9 Shepstone Rd, Richmond'),
(16, 'Kabelo', 'Molefe', 'Business', 22, 'Male', '31 Prince St, Durban'),
(17, 'Priya', 'Naidoo', 'IT', 20, 'Female', '77 Wandsbeck Rd, Durban'),
(18, 'Bongani', 'Sithole', 'Engineering', 21, 'Male', '5 Baynes Dr, Pietermaritzburg'),
(19, 'Emma', 'Pieterse', 'Business', 19, 'Female', '42 Chatterton Rd, Hilton'),
(20, 'Sibusiso', 'Cele', 'IT', 22, 'Male', '18 Bhambatha St, Richmond'),
(21, 'Lerato', 'Mahlangu', 'Business', 20, 'Female', '63 Musgrave Rd, Durban'),
(22, 'Daniel', 'Botha', 'Engineering', 24, 'Male', '11 Lambert Rd, Howick'),
(23, 'Nomvula', 'Ndlovu', 'IT', 19, 'Female', '29 College Rd, Pietermaritzburg'),
(24, 'Tebogo', 'Selepe', 'Business', 21, 'Male', '7 Armitage Rd, Richmond'),
(25, 'Fatima', 'Khan', 'IT', 20, 'Female', '53 Sparks Rd, Durban'),
(26, 'Andile', 'Mnguni', 'Engineering', 22, 'Male', '16 Victoria St, Richmond'),
(27, 'Sarah', 'Meyer', 'Business', 18, 'Female', '24 Karkloof Rd, Howick'),
(28, 'Mpho', 'Dube', 'IT', 21, 'Male', '38 Retief St, Pietermaritzburg'),
(29, 'Kirsten', 'Smith', 'Business', 20, 'Female', '19 Hilton Ave, Hilton'),
(30, 'Nkosinathi', 'Zulu', 'Engineering', 23, 'Male', '44 Shepstone St, Richmond'),
(31, 'Anele', 'Ngubane', 'IT', 19, 'Female', '61 Umbilo Rd, Durban'),
(32, 'Pieter', 'Venter', 'Business', 22, 'Male', '3 Fraser St, Howick'),
(33, 'Lungile', 'Mahlaba', 'IT', 20, 'Female', '27 Chatterton Rd, Pietermaritzburg'),
(34, 'Tumelo', 'Radebe', 'Engineering', 21, 'Male', '13 Dyer St, Richmond'),
(35, 'Meera', 'Reddy', 'Business', 19, 'Female', '49 Clare Rd, Durban'),
(36, 'Siyabonga', 'Majozi', 'IT', 22, 'Male', '21 Main St, Richmond'),
(37, 'Anika', 'Pretorius', 'Business', 20, 'Female', '8 Zeederberg Rd, Hilton'),
(38, 'Bhekisisa', 'Ntuli', 'Engineering', 24, 'Male', '17 Campbell Rd, Howick'),
(39, 'Zanele', 'Mkhize', 'IT', 18, 'Female', '33 Boshoff St, Pietermaritzburg'),
(40, 'Ruan', 'Fourie', 'Business', 21, 'Male', '6 Morcom Rd, Richmond'),
(41, 'Phindile', 'Gumede', 'IT', 20, 'Female', '72 Stamford Hill Rd, Durban'),
(42, 'Tshepo', 'Mokoena', 'Engineering', 22, 'Male', '10 Richmond Rd, Richmond'),
(43, 'Hannah', 'Joubert', 'Business', 19, 'Female', '15 Quarry Rd, Hilton'),
(44, 'Sanele', 'Dladla', 'IT', 21, 'Male', '26 New England Rd, Pietermaritzburg'),
(45, 'Nisha', 'Maharaj', 'Business', 20, 'Female', '81 Brickfield Rd, Durban'),
(46, 'Mlungisi', 'Biyela', 'Engineering', 23, 'Male', '4 Alexander St, Richmond'),
(47, 'Kayla', 'Petersen', 'IT', 18, 'Female', '11 Old Howick Rd, Hilton'),
(48, 'Vusi', 'Mthethwa', 'Business', 22, 'Male', '30 Chota Motala Rd, Pietermaritzburg'),
(49, 'Dineo', 'Letsosa', 'IT', 20, 'Female', '14 Napier St, Richmond'),
(50, 'Stefan', 'Erasmus', 'Engineering', 21, 'Male', '9 Karkloof Falls Rd, Howick');

-- full checking a relational db called academic record
SHOW CREATE TABLE academicrecord;

-- Dropping the wrong pk on academic record table
ALTER TABLE academicrecord DROP PRIMARY KEY;

-- adding the correct composite pk because student + subject together must be unique
ALTER TABLE academicrecord ADD PRIMARY KEY (studentid, subjectcode);

-- making student id a fk to students table
ALTER TABLE academicrecord ADD CONSTRAINT fk_acad_student
FOREIGN KEY (studentid) references students(studentid)
ON DELETE CASCADE ON UPDATE CASCADE;

SELECT * FROM academicrecord;

-- adding more students to the students list
USE hightechcollege;
INSERT INTO academicrecord (studentid, subjectcode, subjectname, examscore) VALUES
(6, 'FBIM601', 'Information Systems', 71),
(7, 'FBIM602', 'Economics', 64),
(8, 'FBIM603', 'Bank Management', 81),
(9, 'FBIM604', 'Commercial Law', 59),
(10, 'FBIM605', 'Econometrics', 73),
(11, 'FBIM601', 'Information Systems', 68),
(12, 'FBIM602', 'Economics', 77),
(13, 'FBIM603', 'Bank Management', 62),
(14, 'FBIM604', 'Commercial Law', 84),
(15, 'FBIM605', 'Econometrics', 55),
(16, 'FBIM601', 'Information Systems', 79),
(17, 'FBIM602', 'Economics', 61),
(18, 'FBIM603', 'Bank Management', 70),
(19, 'FBIM604', 'Commercial Law', 67),
(20, 'FBIM605', 'Econometrics', 88),
(21, 'FBIM601', 'Information Systems', 54),
(22, 'FBIM602', 'Economics', 72),
(23, 'FBIM603', 'Bank Management', 69),
(24, 'FBIM604', 'Commercial Law', 76),
(25, 'FBIM605', 'Econometrics', 63),
(26, 'FBIM601', 'Information Systems', 82),
(27, 'FBIM602', 'Economics', 58),
(28, 'FBIM603', 'Bank Management', 74),
(29, 'FBIM604', 'Commercial Law', 60),
(30, 'FBIM605', 'Econometrics', 71),
(31, 'FBIM601', 'Information Systems', 65),
(32, 'FBIM602', 'Economics', 80),
(33, 'FBIM603', 'Bank Management', 57),
(34, 'FBIM604', 'Commercial Law', 69),
(35, 'FBIM605', 'Econometrics', 75),
(36, 'FBIM601', 'Information Systems', 62),
(37, 'FBIM602', 'Economics', 83),
(38, 'FBIM603', 'Bank Management', 66),
(39, 'FBIM604', 'Commercial Law', 71),
(40, 'FBIM605', 'Econometrics', 59),
(41, 'FBIM601', 'Information Systems', 78),
(42, 'FBIM602', 'Economics', 64),
(43, 'FBIM603', 'Bank Management', 72),
(44, 'FBIM604', 'Commercial Law', 68),
(45, 'FBIM605', 'Econometrics', 81),
(46, 'FBIM601', 'Information Systems', 60),
(47, 'FBIM602', 'Economics', 73),
(48, 'FBIM603', 'Bank Management', 67),
(49, 'FBIM604', 'Commercial Law', 79),
(50, 'FBIM605', 'Econometrics', 70);

-- verifying the  TOTAL number of records in the academicrecord table
SELECT COUNT(*) AS total_records FROM academicrecord;

-- checking the staff table
SELECT * FROM staff;

-- retrieving records of students who belong to ANY department
SELECT * FROM students;

-- the above way of retrieving returns even the students who may have null departments

-- correct way of retrieving
SELECT * FROM students where department IS NOT NULL AND department !='';

-- retrieving records of students who scored ABOVE 60%
-- you don't put the %, sql takes it as a modulo operator 
SELECT studentid FROM academicrecord where examscore > 60;

-- retrieving the name and surname of all staff members
SELECT * FROM staff;


