SELECT * FROM employeesinfo;
SELECT * FROM establishement;
SELECT * FROM payroll;

SELECT 
    CONCAT(FirstName, " ", LastName) AS FULL_NAME,
    Department,
    LeaveType,
    TotalDays AS TAKEN_LEAVES,
    net_salary
FROM
    employeesinfo E
        JOIN
    establishement ES ON E.EmployeeID = ES.LeaveID
		JOIN
	payroll P ON P.employee_id = P.payroll_id;
 
CREATE VIEW employee_leave_payroll_view AS
SELECT 
    CONCAT(E.FirstName, ' ', E.LastName) AS FULL_NAME,
    E.Department,
    ES.LeaveType,
    ES.TotalDays AS TAKEN_LEAVES,
    P.net_salary
FROM
    employeesinfo E
JOIN
    establishement ES ON E.EmployeeID = ES.EmployeeID
JOIN
    payroll P ON E.EmployeeID = P.employee_id;
    
SELECT * FROM employee_leave_payroll_view;

    
SELECT * FROM PAYROLL;

SELECT net_salary/30 FROM employee_leave_payroll_view;

SELECT 
    CONCAT(E.FirstName, ' ', E.LastName) AS FULL_NAME,
    E.Department,
    SUM(ES.TotalDays) AS TAKEN_LEAVES,
    P.net_salary,
    ROUND(P.net_salary/30,2) AS per_day_salary,
    ROUND(SUM(ES.TotalDays) * (P.net_salary / 30), 2) AS Total_Deduction,
    ROUND(P.net_salary - (SUM(ES.TotalDays) * (P.net_salary/ 30)),2) AS Adjsuted_salary
FROM
    employeesinfo E
JOIN
    establishement ES ON E.EmployeeID = ES.EmployeeID
JOIN
    payroll P ON E.EmployeeID = P.employee_id
GROUP BY 
	 E.EmployeeID, E.FirstName, E.LastName, E.Department, P.net_salary;
     
select * from employeesinfo;    





    
