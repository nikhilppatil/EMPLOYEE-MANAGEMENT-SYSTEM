SELECT * FROM employeesinfo;

PREPARE stmt FROM 'INSERT INTO employeesinfo (...) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
DEALLOCATE PREPARE stmt;

select * from employeesinfo;

show databases;


-- 1. Prepare the statement
PREPARE stmt FROM 
'INSERT INTO employee_lifecycle.employeesinfo 
(EmployeeID, FirstName, LastName, Department, Designation, DateOfJoining, Email, PhoneNumber) 
VALUES (?, ?, ?, ?, ?, ?, ?, ?)';

-- 2. Set the variables
SET 
  @id = 10, 
  @fname = 'Rajat', 
  @lname = 'Sharma', 
  @dept = 'IT', 
  @desg = 'Software Engineer', 
  @doj = '2023-01-01', 
  @email = 'rajat.sharma@example.com', 
  @phone = '9876543210';

-- 3. Execute the prepared statement using the variables
EXECUTE stmt USING @id, @fname, @lname, @dept, @desg, @doj, @email, @phone;

-- 4. Deallocate (cleanup)
DEALLOCATE PREPARE stmt;

