CREATE DATABASE HomeWork
USE HomeWork

CREATE TABLE Passports(
	PassportID INT PRIMARY KEY,
	PassportNumber CHAR(8) NOT NULL
)

CREATE TABLE Persons(
	PersonID INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(30) NOT NULL,
	Salary DECIMAL(15, 2) NOT NULL,
	PassportID INT CONSTRAINT FK_PassportID FOREIGN KEY REFERENCES Passports(PassportID)
)

INSERT INTO Passports
VALUES(102,'N34FG21B'),(103,'K65LO4R7'),(101,'ZE657QP2')

INSERT INTO Persons
VALUES('Roberto', 43300.00, 102),('Tom', 56100.00, 103),('Yana', 60200.00, 101)


CREATE TABLE Manufacturers(
	ManufacturerID INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(30) NOT NULL,
	EstablishedOn DATE
)

INSERT INTO Manufacturers
VALUES('BMW', '07/03/1916'),('Tesla','01/01/2003'),('Lada','01/05/1966')

CREATE TABLE Models(
	ModelID INT PRIMARY KEY,
	[Name] VARCHAR(30) NOT NULL,
	ManufacturerID INT CONSTRAINT FK_ManufacturerID FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Models
VALUES(101, 'X1', 1),(102,'i6', 1),(103,'Model S', 2),(104, 'Model X', 2),(105,'Model 3', 2),(106,'Nova',3) 


CREATE TABLE Students(
	StudentID INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(30) NOT NULL
)

CREATE TABLE Exams(
	ExamID INT PRIMARY KEY,
	[Name] VARCHAR(30) NOT NULL
)

CREATE TABLE StudentsExams(
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID) NOT NULL,
	ExamID INT FOREIGN KEY REFERENCES Exams(ExamID) NOT NULL
)

ALTER TABLE StudentsExams
ADD CONSTRAINT PK_StudentID_ExamID PRIMARY KEY (StudentID, ExamID)

INSERT INTO Students
VALUES('Mila'),('Toni'),('Ron')

INSERT INTO Exams
VALUES(101, 'SpringMVC'),(102, 'Neo4j'),(103, 'Oracle 11g')

INSERt INTO StudentsExams
VALUES(1,101),(1,102),(2,101),(3,103),(2,102),(2,103)




CREATE TABLE Teachers(
	TeacherID INT CONSTRAINT PK_TeacherID PRIMARY KEY,
	[Name] VARCHAR(30) NOT NULL,
	ManagerID INT CONSTRAINT FK_ManagerID_TeacherID FOREIGN KEY REFERENCES Teachers(TeacherID)
)

INSERT INTO Teachers
VALUES(101, 'John', NULL),(102,'Maya', 106),(103,'Silvia',106),(104,'Ted',105),(105,'Mark',101),(106,'Greta', 101)


CREATE DATABASE OnlineStoreDatabase
USE OnlineStoreDatabase

CREATE TABLE ItemTypes(
	ItemTypeID INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(30) NOT NULL
)

CREATE TABLE Cities(
	CityID INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(30) NOT NULL
)

CREATE TABLE Items(
	ItemID INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(30) NOT NULL,
	ItemTypeID INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeID) NOT NULL
)

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(30) NOT NULL,
	Birthday DATE,
	CityID INT FOREIGN KEY REFERENCES Cities(CityID) NOT NULL
)

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY IDENTITY,
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID) NOT NULL
)

CREATE TABLE OrderItems(
	OrderID INT FOREIGN KEY REFERENCES Orders(OrderID) NOT NULL,
	ItemID INT FOREIGN KEY REFERENCES Items(ItemID) NOT NULL,
)

ALTER TABLE OrderItems
ADD CONSTRAINT PK_OrderID_ItemID PRIMARY KEY(OrderID, ItemID) 

CREATE DATABASE UniversityDatabase
USE UniversityDatabase

CREATE TABLE Subjects(
	SubjectID INT PRIMARY KEY IDENTITY,
	SubjectName VARCHAR(30) NOT NULL
)

CREATE TABLE Majors(
	MajorID INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(30) NOT NULL
)


CREATE TABLE Students(
	StudentID INT PRIMARY KEY IDENTITY,
	StudentNumber BIGINT NOT NULL,
	StudentName VARCHAR(50) NOT NULL,
	MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments(
	PaymentID INT PRIMARY KEY IDENTITY,
	PaymentDate DATE NOT NULL,
	PaymentAmount DECIMAL(15, 2) NOT NULL,
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)

CREATE TABLE Agenda(
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID) NOT NULL,
	SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID) NOT NULL,
	CONSTRAINT PK_StudentID_SubjectID PRIMARY KEY(StudentID, SubjectID)
)


USE Geography

SELECT Mountains.MountainRange, P.PeakName, P.Elevation
  FROM Peaks AS P
  JOIN Mountains ON P.MountainId = Mountains.Id
 WHERE Mountains.MountainRange = 'Rila'
 ORDER BY P.Elevation DESC