# SQL Project - hitech College Database

This is the project that introduced me to SQL and relational databases.

I built and explored a college database in MySQL Workbench to learn how data is stored, structured, and queried in the real world.

### What I Learned
- Creating and using a database: `USE bhitechcollege;`
- Inspecting structure: `SHOW TABLES;` `DESCRIBE students;`
- Retrieving data: `SELECT * FROM students LIMIT 10;`
- Adding data: `INSERT INTO students (...) VALUES (...)`
- Fixing design mistakes: Dropping a wrong primary key and adding a composite key `PRIMARY KEY (studentid, subjectcode)`
- Linking tables: Adding a foreign key with `FOREIGN KEY (studentid) REFERENCES students(studentid) ON DELETE CASCADE ON UPDATE CASCADE`
- Filtering data: `WHERE department IS NOT NULL`, `WHERE examscore > 60`

### Tables
- `students` - student details
- `staff` - staff details  
- `subjects` - subject details
- `academicrecord` - student exam scores (linked to students)
