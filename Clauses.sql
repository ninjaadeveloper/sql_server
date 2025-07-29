CREATE DATABASE users;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees (FirstName, LastName, Department, Salary, HireDate) VALUES
('Ali', 'Khan', 'IT', 60000.00, '2022-01-15'),
('Sara', 'Ahmed', 'HR', 55000.00, '2021-03-20'),
('Usman', 'Butt', 'Finance', 70000.00, '2023-07-01'),
('Fatima', 'Rizvi', 'IT', 62000.00, '2022-05-10'),
('Kamran', 'Sheikh', 'Sales', 48000.00, '2023-02-28'),
('Aisha', 'Malik', 'HR', 58000.00, '2021-09-01'),
('Bilal', 'Tariq', 'Finance', 75000.00, '2022-11-12'),
('Sana', 'Javed', 'IT', 61000.00, '2023-04-05'),
('Hassan', 'Mehmood', 'Sales', 50000.00, '2022-08-19'),
('Zainab', 'Imran', 'HR', 53000.00, '2023-01-25'),
('Fahad', 'Naeem', 'IT', 68000.00, '2021-06-30'),
('Nida', 'Akram', 'Finance', 72000.00, '2022-02-14'),
('Omar', 'Farooq', 'Sales', 52000.00, '2023-09-10'),
('Kiran', 'Shah', 'HR', 56000.00, '2022-07-07');

select * from Employees


/*
= (Equal to)

!= or <> (Not equal to)

> (Greater than)

< (Less than)

>= (Greater than or equal to)

<= (Less than or equal to)

BETWEEN (Within a range)

LIKE (Search for a pattern)

IN (Specify multiple possible values)

AND, OR, NOT (Logical operators to combine conditions)
*/



--Where
SELECT * FROM Employees WHERE Department = 'IT';
--Order By
SELECT * FROM Employees ORDER BY Salary DESC;
--Count and Group
SELECT Department, COUNT(EmployeeID) AS NumberOfEmployees FROM Employees GROUP BY Department;

--Count and Group with having
SELECT Department, COUNT(EmployeeID) AS NumberOfEmployees
FROM Employees
GROUP BY Department
HAVING COUNT(EmployeeID) > 3;

--Top
SELECT TOP 5 FirstName, LastName, Salary
FROM Employees
ORDER BY Salary DESC;

--!= or <> (Not equal to)

SELECT FirstName, LastName, Department
FROM Employees
WHERE Department != 'HR'; -- Ya WHERE Department <> 'HR';

-- > (Greater than)

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > 65000;

-- < (Less than)

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary < 50000;

-- >= (Greater than or equal to)

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary >= 70000;

-- <= (Less than or equal to)

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary <= 60000;


-- BETWEEN (Within a range)

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary BETWEEN 55000 AND 65000;

--LIKE (Search for a pattern)

SELECT FirstName, LastName
FROM Employees
WHERE FirstName LIKE 'S%';

SELECT FirstName, LastName
FROM Employees
WHERE FirstName LIKE '%a';

SELECT FirstName, LastName, Department
FROM Employees
WHERE FirstName LIKE '%ma%';


-- IN (Specify multiple possible values)
SELECT FirstName, LastName, Department
FROM Employees
WHERE Department IN ('IT', 'Sales','HR');

-- AND, OR, NOT (Logical operators to combine conditions)

SELECT FirstName, LastName, Department, Salary
FROM Employees
WHERE Department = 'Finance' AND Salary > 70000;

SELECT FirstName, LastName, Department, Salary
FROM Employees
WHERE Department = 'HR' OR Salary > 60000;

SELECT FirstName, LastName, Department
FROM Employees
WHERE NOT Department = 'IT';