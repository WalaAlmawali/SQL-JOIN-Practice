CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100) NOT NULL
);

CREATE TABLE Students
(
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

SELECT Students.Name,
       Classes.ClassName
FROM Students 
INNER JOIN Classes 
    ON Students.ClassID = Classes.ClassID
ORDER BY Students.Name;

SELECT E.Fname,
       D.Dname
FROM Employee E 
LEFT JOIN Department D
    ON E.Dept_Id = D.Dnum
ORDER BY E.Fname;

SELECT C.CustomerName,
       O.OrderID
FROM Orders O
RIGHT JOIN Customers C
    ON O.CustomerID = C.CustomerID
ORDER BY C.CustomerName;

SELECT P.ProductName,
       S.SaleID
FROM Products P
FULL OUTER JOIN Sales S
    ON P.ProductID = S.ProductID
ORDER BY P.ProductName;

SELECT E.Fname AS EmployeeName,
       M.Fname AS ManagerName
FROM Employee E
LEFT JOIN Employee M
    ON E.SSN = M.Super_Id
ORDER BY E.Fname;

CREATE TABLE Colors
(
    ColorID INT PRIMARY KEY,
    ColorName VARCHAR(50) NOT NULL
);

CREATE TABLE Sizes
(
    SizeID INT PRIMARY KEY,
    SizeName VARCHAR(50) NOT NULL
);

SELECT C.ColorName,
       S.SizeName
FROM Colors C
CROSS JOIN Sizes S
ORDER BY C.ColorName, S.SizeName;

CREATE TABLE Teachers
(
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(100) NOT NULL
);

ALTER TABLE Classes
ADD TeacherID INT ;

ALTER TABLE Classes
ADD FOREIGN KEY (TeacherID)
REFERENCES Teachers(TeacherID);


SELECT S.Name,
       C.ClassName,
       T.TeacherName
FROM Students S
INNER JOIN Classes C
    ON S.ClassID = C.ClassID
INNER JOIN Teachers T
    ON C.TeacherID = T.TeacherID
ORDER BY C.ClassName;

CREATE TABLE Authors
(
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL
);

CREATE TABLE Books
(
    BookID INT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

SELECT B.Title,
       A.AuthorName
FROM Books B
LEFT JOIN Authors A
    ON B.AuthorID = A.AuthorID
ORDER BY B.Title;

CREATE TABLE Payments
(
    PaymentID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL
);

CREATE TABLE Inventory
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    StockQty INT NOT NULL
);

ALTER TABLE Sales
ADD SoldQty INT

SELECT O.OrderID,
       P.Amount
FROM Payments P
RIGHT JOIN Orders O
    ON P.OrderID = O.OrderID
WHERE P.Amount IS NULL OR P.Amount > 0
ORDER BY O.OrderID;

SELECT I.ProductName,
       I.StockQty,
       S.SoldQty
FROM Inventory I
FULL OUTER JOIN Sales S
    ON I.ProductID = S.ProductID
ORDER BY I.ProductName;

SELECT 
    E.Fname AS EmployeeName,
    M.Fname AS ManagerName,
    TM.Fname AS TopManagerName
FROM Employee E
LEFT JOIN Employee M
    ON E.Super_Id = M.SSN
LEFT JOIN Employee TM
    ON M.Super_Id = TM.SSN
ORDER BY E.Fname;

SELECT P.ProductName,
       S.StoreName
FROM Products P
CROSS JOIN Stores S
ORDER BY S.StoreName, P.ProductName;

SELECT O.OrderID,
       SUM(OD.Quantity) AS TotalQuantity
FROM Orders O
INNER JOIN OrderDetails OD
    ON O.OrderID = OD.OrderID
GROUP BY O.OrderID
ORDER BY TotalQuantity DESC;

SELECT C.CustomerID,
       C.Name,
       COUNT(O.OrderID) AS TotalOrders
FROM Customers C
LEFT JOIN Orders O
    ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.Name
ORDER BY TotalOrders DESC;

SELECT 
    S.Name AS StudentName,
    C1.ClassName,
    C2.CourseName
FROM Students S
INNER JOIN Classes C1
    ON S.ClassID = C1.ClassID
LEFT JOIN Enrollments E
    ON S.StudentID = E.StudentID
LEFT JOIN Courses C2
    ON E.CourseID = C2.CourseID
ORDER BY S.Name;

