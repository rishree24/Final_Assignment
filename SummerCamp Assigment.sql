--Create the Database to store the data for Summer Camps Project
CREATE DATABASE #SummerCamps
GO

--Use the database 
USE #SummerCamps
GO


---Task 1---
-- Creat three table as per asked in task, where as columns are given for two table and I will create third table accordingly.

CREATE TABLE #Student_Details_For_SC (
	StudentID INT PRIMARY KEY IDENTITY (1,1),
	FirstName VARCHAR(50),
	MiddleName VARCHAR(50),
	LastName VARCHAR(50),
	Gender VARCHAR(20),
	Date_of_Birth DATE,
	Email VARCHAR(50),
	Personal_Phone VARCHAR(50)
)
GO

CREATE TABLE #Camps (
	CampID INT PRIMARY KEY IDENTITY (101,1),
	Camp_Titile VARCHAR(50) DEFAULT 'Summer Camp',
	Capacity INT,
	Price DECIMAL (10,2),
	StartDate DATE,
	EndDate DATE
)
GO

CREATE TABLE #CampVisits (
    VisitID INT PRIMARY KEY IDENTITY(201,1),
    StudentID INT,
    CampID INT,
    VisitDate DATE,
    CONSTRAINT FK_StudentID FOREIGN KEY (StudentID) REFERENCES #Student_Details_For_SC(StudentID),
    CONSTRAINT FK_CampID FOREIGN KEY (CampID) REFERENCES #Camps(CampID),
)
GO

----Insert sample data into the each created table

INSERT INTO #Student_Details_For_SC (FirstName, MiddleName, LastName, Gender, Date_of_Birth, Email, Personal_Phone)
VALUES	('Lakshmi', 'K', 'Kumari', 'Female','2015-12-12','lakshmi.kumari@gmail.com', '8985878548'),
		('Om', 'Prakash', 'Gupta', 'Male', '2014-12-01', 'om.prakash@yahoo.com', '8857478558'),	
		('Lakshmi', 'K', 'Kumari', 'Female','2015-12-12','lakshmi.kumari@gmail.com', '8985878548'),	
		('Shashank', 'Vijay', 'Verma', 'Male', '2018-12-01', 'verma.shashank@gmail.com', '9985898549'),	
		('Lakshmi', 'K', 'Kumari', 'Female','2015-12-12','lakshmi.kumari@gmail.com', '8985878548'),	
		('Hari', 'Om', 'Gupta', 'Male', '2013-02-15', 'hari.g@yahoo.com', '9995878505'),	
		('Prashant', 'V', 'Krishna', 'Male', '2012-08-08', 'krishna.prashant@yahoo.com', '8888778550'),	
		('Lakshmi', 'K', 'Kumari', 'Female','2015-12-12','lakshmi.kumari@gmail.com', '8985878548'),
		('Sunil', 'Kumar', 'Pandey', 'Male', '2010-12-01', 'sunil.pandey@yahoo.com', '7878278154'),	
		('Lakshmi', 'K', 'Kumari', 'Female','2015-12-12','lakshmi.kumari@gmail.com', '8985878548')
GO

INSERT INTO #Camps (Capacity, Price, StartDate, EndDate)
VALUES	(50, 3500.00, '2021-08-01', '2021-08-15'),
		(40, 3500.00, '2022-08-01', '2024-09-18'),
		(60, 3500.00, '2023-08-01', '2024-09-19'),
		(35, 3500.00, '2024-08-02', '2024-08-31')
GO

INSERT INTO #CampVisits (StudentID, CampID,VisitDate)
VALUES	(1, 101, '2022-07-01'),
		(2, 102, '2022-07-05'),
		(3, 103, '2021-07-10'),
		(4, 104, '2023-07-15'),
		(5, 105, '2022-07-20'),
		(6, 106, '2024-07-25'),
		(7, 107, '2023-07-30'),
		(8, 108, '2023-08-01'),
		(9, 109, '2024-08-05'),
		(10, 110, '2024-08-10')
GO

---Query--how many times Lakshmi visited the camp in last 3 years
SELECT sd.FirstName, COUNT(*) AS VisitCount
FROM #Student_Details_For_SC AS sd
JOIN #CampVisits AS cv
ON sd.StudentID = cv.StudentID
WHERE sd.FirstName LIKE 'Lakshmi%' AND 
DATEDIFF(YEAR,cv.VisitDate, GETDATE()) < 3
GROUP BY sd.FirstName
GO

----TASK 2----
--Create table for Random People--

CREATE TABLE #Random_People (
	PersonID INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Gender VARCHAR(20),
	AGE INT
	);

--Insert 5000 Random data into created table
	WITH cte AS (
	Select TOP 5000	CONCAT('FirstName',ROW_NUMBER() OVER(ORDER BY CHECKSUM(NEWID()))) AS FirstName,
			CONCAT('LastName', ROW_NUMBER() OVER(ORDER BY CHECKSUM(NEWID()))) AS LastName,
			CASE
				WHEN (ROW_NUMBER() OVER(ORDER BY CHECKSUM(NEWID())) <=5000 * 0.65) THEN 'FEMALE'
				ELSE 'MALE'
			END AS GENDER
			from sys.all_columns)
	INSERT INTO #Random_People
	SELECT firstName, LastName, Gender,
	CASE
		WHEN ROW_NUMBER() OVER(ORDER BY CHECKSUM(NEWID()))<=5000 * 0.18 THEN FLOOR(RAND(CHECKSUM(NEWID())) * 5) + 7
		WHEN ROW_NUMBER() OVER(ORDER BY CHECKSUM(NEWID()))<=5000 * 0.45 THEN FLOOR(RAND(CHECKSUM(NEWID()))* 1) + 13
		WHEN ROW_NUMBER() OVER(ORDER BY CHECKSUM(NEWID()))<=5000 * 0.65 THEN FLOOR(RAND(CHECKSUM(NEWID()))* 2) + 15
		ELSE FLOOR(RAND(CHECKSUM(NEWID())) * 1 ) + 18
	END AS Age
	FROM cte
GO

---Query the above table to check

SELECT * FROM #Random_People;
GO

---TASK 3---
--Creat a table to store the data for given numbers

CREATE TABLE #ChartData (
	Category VARCHAR(50),
	Percentage VARCHAR(20),
	Gender VARCHAR(20)	
)
GO

--Insert the given data for created table

INSERT INTO #ChartData (Category, Percentage, Gender)
VALUES	('GenX', '55%', 'Male'),
		('GenX', '45%', 'Female'),
		('Millenials', '46%', 'Male'),
		('Millenials', '54%', 'Female'),
		('GenZ', '64%', 'Male'),
		('GenZ', '36%', 'Female'),
		('Gen Alpha', '64%', 'Male'),
		('Gen Alpha', '36%', 'Female')
GO

--Query the above table to check 
SELECT * FROM #ChartData
GO

--NOTE-- I have created including Database and Table with #(which is use for temporary table or databasse). 