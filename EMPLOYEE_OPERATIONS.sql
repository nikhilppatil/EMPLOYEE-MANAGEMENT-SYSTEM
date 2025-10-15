SELECT * FROM employeesinfo;
SELECT * FROM establishement;
SELECT * FROM payroll;

SELECT 
    CONCAT(FirstName, LastName) AS FULL_NAME,
    Department,
    LeaveType,
    TotalDays AS TAKEN_LEAVES
FROM
    employeesinfo E
        JOIN
    establishement ES ON E.EmployeeID = ES.LeaveID;
    