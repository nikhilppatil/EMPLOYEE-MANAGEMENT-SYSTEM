CREATE DATABASE EMPLOYEE_LIFECYCLE;

USE employee_lifecycle;

CREATE TABLE EmployeesInfo(
	EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Designation VARCHAR(50),
    DateOfJoining DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Establishement(
  LeaveID INT PRIMARY KEY auto_increment,
    EmployeeID INT,
    LeaveType VARCHAR(250),              -- e.g., Sick, Casual, Earned
    StartDate DATE,
    EndDate DATE,
    TotalDays int GENERATED ALWAYS AS (DATEDIFF(EndDate, StartDate) + 1) STORED,
    Reason VARCHAR(255),
    Status VARCHAR(20),                 -- e.g., Approved, Pending, Rejected

    FOREIGN KEY (EmployeeID) REFERENCES EmployeesInfo(EmployeeID)
);


CREATE TABLE payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    pay_month VARCHAR(7),               -- Format: 'YYYY-MM'
    basic_salary DECIMAL(10,2),
    hra DECIMAL(10,2),
    other_allowances DECIMAL(10,2),
    deductions DECIMAL(10,2),
    net_salary DECIMAL(10,2),
    payment_date DATE,

    FOREIGN KEY (employee_id) REFERENCES EmployeesInfo(EmployeeID)
        ON DELETE CASCADE
);


SELECT * FROM employeesinfo;
SELECT * FROM establishement;
SELECT * FROM payroll;


INSERT INTO employeesinfo VALUES
(1, 'Rahul', 'Sharma', 'IT', 'Software Engineer', '2022-06-15', 'rahul.sharma@example.com', '9876543210'),
(2, 'Priya', 'Mehta', 'HR', 'HR Manager', '2021-03-10', 'priya.mehta@example.com', '9123456780'),
(3, 'Amit', 'Patel', 'Finance', 'Accountant', '2020-11-25', 'amit.patel@example.com', '9988776655'),
(4, 'Sneha', 'Reddy', 'Marketing', 'Marketing Executive', '2023-01-05', 'sneha.reddy@example.com', '9012345678'),
(5, 'Vikram', 'Singh', 'Operations', 'Operations Manager', '2019-08-30', 'vikram.singh@example.com', '9090909090');


INSERT INTO establishement 
(EmployeeID,LeaveType, StartDate, EndDate, Reason, Status)
VALUES
(2, 'Sick Leave', '2023-12-01', '2023-12-03', 'Fever and cold', 'Approved'),
(2, 'Casual Leave', '2023-11-15', '2023-11-15', 'Personal work', 'Approved'),
(1, 'Earned Leave', '2023-10-10', '2023-10-12', 'Family function', 'Pending'),
(4, 'Sick Leave', '2024-01-05', '2024-01-06', 'Health checkup', 'Approved'),
(2, 'Casual Leave', '2023-09-20', '2023-09-21', 'Travel', 'Rejected');

SELECT * FROM establishement;

INSERT INTO payroll VALUES
(1,1, '2023-12', 50000.00, 15000.00, 5000.00, 2000.00, 68000.00, '2023-12-31'),
(2,2, '2023-12', 60000.00, 18000.00, 4000.00, 2500.00, 79500.00, '2023-12-31'),
(3,3, '2023-12', 45000.00, 12000.00, 3000.00, 1500.00, 58500.00, '2023-12-31'),
(4,4, '2023-12', 40000.00, 10000.00, 3500.00, 1000.00, 52500.00, '2023-12-31'),
(5,5, '2023-12', 55000.00, 16000.00, 4500.00, 3000.00, 72500.00, '2023-12-31');

SELECT * FROM payroll;


