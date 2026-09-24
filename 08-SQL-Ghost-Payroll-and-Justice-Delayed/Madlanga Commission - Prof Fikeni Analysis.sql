-- PROFFESSOR FIKENI CASE STUDY - GOVERNANCE RISK MODEL

DROP DATABASE IF EXISTS madlanga_analysis;
CREATE DATABASE madlanga_analysis;
USE madlanga_analysis;

-- employees table
CREATE TABLE employees (
  employee_id VARCHAR(10) PRIMARY KEY,
  dept VARCHAR(50) NOT NULL,
  position_type ENUM('permanent','acting') NOT NULL,
  vetting_status ENUM('cleared','expired','pending','not vetted') NOT NULL,
  vetting_expiry DATE,
  salary_monthly INT NOT NULL,
  INDEX idx_dept (dept),
  INDEX idx_vetting (vetting_status)
);

INSERT INTO employees (employee_id, dept, position_type, vetting_status, vetting_expiry, salary_monthly) VALUES
('EMP1024','Crime Intelligence','permanent','expired','2022-11-30',45000),
('EMP0891','SAPS Forensics','acting','not vetted', NULL, 38000),
('EMP1123','Home Affairs','permanent','expired','2024-01-20',32000),
('EMP1345','Basic Education','acting','pending','2023-09-10',28000),
('EMP0765','Land Reform','permanent','cleared','2026-02-10',35000),
('EMP0998','Home Affairs','acting','not vetted', NULL, 30000),
('EMP1234','Crime Intelligence','permanent','pending','2025-06-30',42000);
SELECT * FROM employees

-- suspensions table
CREATE TABLE suspensions (
   suspension_id VARCHAR(10) PRIMARY KEY,
   employee_id VARCHAR(10) NOT NULL,
   start_date DATE NOT NULL,
   end_date DATE NULL,
   salary_paid DECIMAL(12,2) NOT NULL,
   days_calc INT GENERATED ALWAYS AS (DATEDIFF(end_date, start_date)) STORED,
   FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO suspensions (suspension_id, employee_id, start_date, end_date, salary_paid)VALUES
('SUS001','EMP1024','2019-03-12',NULL,1850000),
('SUS002','EMP0891','2020-06-01',NULL,1245000),
('SUS003','EMP1123','2021-01-15','2024-09-01',890000),
('SUS004','EMP1345','2022-05-20',NULL,765000),
('SUS005','EMP0765','2023-02-10',NULL,420000),
('SUS006','EMP0998','2023-08-01',NULL,610000),
('SUS007','EMP1234','2024-01-10',NULL,320000);
SELECT * FROM suspensions

-- butdget table according to Prof Fikeni Ratio)
CREATE TABLE budget (
  budget_id INT AUTO_INCREMENT PRIMARY KEY,
  dept VARCHAR(50) NOT NULL,
  financial_year YEAR NOT NULL,
  allocated DECIMAL(15,2) NOT NULL,
  spent DECIMAL(15,2) NOT NULL,
  returned DECIMAL(15,2) NOT NULL,
  pct_returned DECIMAL(5,2) NOT NULL,
  UNIQUE KEY unique_dept_year (dept, financial_year)
);
INSERT INTO budget (budget_id, dept, financial_year, allocated, spent, returned, pct_returned) VALUES
(1,'UIF / Dept Labour',2024,14500000000,1000000000,13500000000,93.1),
(2,'Land Reform & Rural Dev',2024,8000000000,3000000000,5000000000,62.5),
(3,'SAPS',2024,10500000000,8400000000,2100000000,20.0),
(4,'Basic Education',2024,12000000000,10800000000,1200000000,10.0),
(5,'Home Affairs',2024,10000000000,9200000000,800000000,8.0);
SELECT * FROM budget

-- service delivery backlog table
CREATE TABLE service_backlog (
  backlog_id INT AUTO_INCREMENT PRIMARY KEY,
  dept VARCHAR(50) NOT NULL,
  service_type VARCHAR(100) NOT NULL,
  queue_days_avg INT NOT NULL,
  backlog_count INT NOT NULL,
  FOREIGN KEY (dept) REFERENCES budget(dept)
);
INSERT INTO service_backlog VALUES(1,'UIF / Dept Labour','UIF Payouts',180,45000);
INSERT INTO service_backlog VALUES(2,'Land Reform & Rural Dev','Land Claims',365,12000);
INSERT INTO service_backlog VALUES(3,'SAPS','Crime Cases',365,85000);
INSERT INTO service_backlog VALUES(4,'Basic Education','Teacher Posts',90,25000);
INSERT INTO service_backlog VALUES(5,'Home Affairs','ID and Passports',120,150000);
SELECT * FROM service_backlog

-- Creating views 
CREATE VIEW ghost_payroll AS
SELECT 
  e.dept,
  s.employee_id,
  s.start_date,
  s.days_calc,
  s.salary_paid,
  CASE 
    WHEN s.days_calc > 2000 THEN 'CRITICAL' -- 2000 is equivalent to the 7 years Prof. Fikeni made an example of
    WHEN s.days_calc > 365 THEN 'HIGH'
    ELSE 'MEDIUM'
  END as risk_level                         -- naming the new column as risk_level
FROM suspensions s
JOIN employees e ON s.employee_id = e.employee_id
WHERE s.days_calc > 180 					-- flagging everyone who has been absent at work for over 6 months but still getting paid
ORDER BY s.salary_paid DESC;
SELECT * FROM ghost_payroll

-- Proffessor Fikeni Ratio - Inefficiency Quadrant
CREATE VIEW prof_ratio AS
SELECT 
  b.dept,
  b.pct_returned, 							-- %_returned
  sb.queue_days_avg,
  sb.backlog_count,
  CASE 
    WHEN b.pct_returned > 20 AND sb.queue_days_avg > 100 THEN 'Returns money and fails service, investigate'
    WHEN b.pct_returned < 5 AND sb.queue_days_avg > 200 THEN 'Money spent but no delivery, investigate'
    ELSE 'Review'
  END as inefficiency_type
FROM budget b
JOIN service_backlog sb ON b.dept = sb.dept
WHERE b.financial_year = 2024;
SELECT * FROM prof_ratio

-- Vetting Gap Risk Score
CREATE VIEW vetting_risk AS
SELECT 
  employee_id,
  dept,
  position_type,
  vetting_status,
  -- Risk Score logic
  -- 40 pts(sensitive dept)
  -- If you're in Home Affairs you can create fake IDs, in crime intelligent they can sell intelligence
  (CASE WHEN dept IN ('Home Affairs','Crime Intelligence','SAPS Forensics') THEN 40 ELSE 0 END +
   CASE WHEN vetting_status != 'cleared' THEN 30 ELSE 0 END +
   CASE WHEN position_type = 'acting' THEN 20 ELSE 0 END +
   CASE WHEN vetting_expiry < CURDATE() THEN 10 ELSE 0 END) as risk_score
FROM employees
HAVING risk_score >= 50
ORDER BY risk_score DESC;
SELECT * FROM vetting_risk


-- looking at how much got wasted from paying suspended people
SELECT SUM(salary_paid) as total_ghost_payroll FROM suspensions;

-- looking at department(s) that performs the worst
SELECT * FROM prof_ratio;

-- looking at top 10 risky officers from various departments
SELECT * FROM vetting_risk LIMIT 10;


















INSERT INTO budget (dept, financial_year, allocated, spent, returned, pct_returned) VALUES
('UIF / Dept Labour',2024,14500000000,1000000000,13500000000,93.1),
('Land Reform & Rural Dev',2024,8000000000,3000000000,5000000000,62.5),
('SAPS',2024,10500000000,8400000000,2100000000,20.0),
('Basic Education',2024,12000000000,10800000000,1200000000,10.0),
('Home Affairs',2024,10000000000,9200000000,800000000,8.0);