-- Database Creation --
DROP DATABASE IF EXISTS national_exams;
CREATE DATABASE national_exams;

-- Table Creation --
USE national_exams;

CREATE TABLE School(
    SchoolID CHAR(5) PRIMARY KEY NOT NULL CHECK(SchoolID RLIKE "^SC[0-9]*$"),
    SchoolName VARCHAR(30) NOT NULL,
    SchoolAddress VARCHAR(50) NOT NULL,
    SchoolPrincipal VARCHAR(30) NOT NULL,
    SchoolPhone VARCHAR(15) NOT NULL CHECK(SchoolPhone RLIKE "^[+][0-9]*$")                                           
);

CREATE TABLE Student(
    StudentID CHAR(5) NOT NULL PRIMARY KEY CHECK(StudentID RLIKE "^ST[0-9]*$"),
    SchoolID CHAR(5) NOT NULL,
    StudentName VARCHAR(30) NOT NULL,
    StudentGender CHAR(1) NOT NULL CHECK(StudentGender IN("F", "M")),
    FOREIGN KEY(SchoolID) REFERENCES School(SchoolID)                     
);

CREATE TABLE Exam(
    ExamID CHAR(5) NOT NULL PRIMARY KEY CHECK(ExamID RLIKE "^EX[0-9]*$"),
    StudentID CHAR(5) NOT NULL,
    ExamType CHAR(5) CHECK(ExamType IN ("MATH", "SCIE", "LANG")),
    ExamDate DATE NOT NULL,
    ExamScore INT NOT NULL CHECK(ExamScore BETWEEN 0 AND 100),
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID)
);

-- Data Insertion --
USE national_exams;
INSERT INTO School (SchoolID, SchoolName, SchoolAddress, SchoolPrincipal, SchoolPhone) VALUES
('SC001', 'Raising Stars Institute', '8 Harbort Circle', 	'Hagan Roalfe', 		'+626740778696'),
('SC002', 'Kanisius', '4291 Red Cloud Hill', 			'Malvin Stroder', 	'+625745728390'),
('SC003', 'Theresia', 'Oxford Junction', 				'Nathanael Loosley', 	'+622735737106'),
('SC004', 'Tarakanita', 'Redmond St.', 				'Raja Koduri', 		'+624530758636'),
('SC005', 'St. Louis 1', 'Finite Road', 				'Pat Gelsinger', 	'+622951395120'),
('SC006', 'Pelita Harapan', 'Tanderball Street', 			'Lisa Su', 		'+620195129351'),
('SC007', 'IPEKA', 'Exium Hall', 					'Satya Nadella', 	'+621235012521'),
('SC008', 'St. Peter', '3 Mercury Way', 				'Arankh Khepur', 	'+629918351223'),
('SC009', 'NJIS', 'Somewhere On Earth', 				'Radjiman W.', 		'+623712412522'),
('SC010', 'Jakarta International School', '5 Milkyway', 	'Margaret Thatcher', 	'+625129351212');

USE national_exams;
INSERT INTO Student (StudentID, SchoolID, StudentName, StudentGender) VALUES
('ST001', 'SC001', 'Jason Adriel', 	'M'),
('ST002', 'SC001', 'Nicholas Kevin', 	'M'),
('ST003', 'SC002', 'Mario Iskandar', 	'M'),
('ST004', 'SC005', 'Albert Gabriel', 	'M'),
('ST005', 'SC003', 'Angela Rimena', 	'F'),
('ST006', 'SC004', 'Huan Perez', 	'M'),
('ST007', 'SC006', 'Ashley Kathleen', 'F'),
('ST008', 'SC007', 'Alexander Liu', 	'M'),
('ST009', 'SC008', 'Jeremy Huang', 	'M'),
('ST010', 'SC010', 'Lin Lee', 		'F'),
('ST011', 'SC009', 'Roberto Gustav', 	'M'),
('ST012', 'SC007', 'Limbaba Tumi', 	'F'),
('ST013', 'SC003', 'Vladimir Gustav', 'M'),
('ST014', 'SC008', 'Alexa Romania',	'F'),
('ST015', 'SC002', 'Andreas Djohan',  'M');

USE national_exams;
INSERT INTO Exam(ExamID, StudentID, ExamType, ExamDate, ExamScore) VALUES
('EX001', 'ST001', 'MATH', '2022-07-14', 91),
('EX002', 'ST001', 'SCIE', '2022-07-14', 89),
('EX003', 'ST001', 'LANG', '2022-07-14', 80),
('EX004', 'ST002', 'MATH', '2022-08-14', 95),
('EX005', 'ST002', 'SCIE', '2022-08-14', 83),
('EX006', 'ST002', 'LANG', '2022-08-14', 97),
('EX007', 'ST003', 'MATH', '2022-07-14', 100),
('EX008', 'ST003', 'SCIE', '2022-07-14', 100),
('EX009', 'ST003', 'LANG', '2022-07-14', 100),
('EX010', 'ST004', 'MATH', '2022-07-14', 100),
('EX011', 'ST004', 'SCIE', '2022-07-14', 100),
('EX012', 'ST004', 'LANG', '2022-07-14', 99),
('EX013', 'ST005', 'MATH', '2022-07-14', 0),
('EX014', 'ST005', 'SCIE', '2022-07-14', 0),
('EX015', 'ST005', 'LANG', '2022-07-14', 70),
('EX016', 'ST006', 'MATH', '2022-09-14', 53),
('EX017', 'ST006', 'SCIE', '2022-09-14', 63),
('EX018', 'ST006', 'LANG', '2022-09-14', 32),
('EX019', 'ST007', 'MATH', '2022-05-14', 99),
('EX020', 'ST007', 'SCIE', '2022-05-14', 98),
('EX021', 'ST007', 'LANG', '2022-05-14', 100),
('EX022', 'ST008', 'MATH', '2022-07-14', 86),
('EX023', 'ST008', 'SCIE', '2022-07-14', 79),
('EX024', 'ST008', 'LANG', '2022-07-14', 80),
('EX025', 'ST009', 'MATH', '2022-07-14', 78),
('EX026', 'ST009', 'SCIE', '2022-07-14', 69),
('EX027', 'ST009', 'LANG', '2022-07-14', 50),
('EX028', 'ST010', 'MATH', '2022-05-14', 100),
('EX029', 'ST010', 'SCIE', '2022-05-14', 100),
('EX030', 'ST010', 'LANG', '2022-05-14', 97),
('EX031', 'ST011', 'MATH', '2022-07-14', 0),
('EX032', 'ST011', 'SCIE', '2022-07-14', 0),
('EX033', 'ST011', 'LANG', '2022-07-14', 0),
('EX034', 'ST012', 'MATH', '2022-06-14', 60),
('EX035', 'ST012', 'SCIE', '2022-06-14', 56),
('EX036', 'ST012', 'LANG', '2022-06-14', 71),
('EX037', 'ST013', 'MATH', '2022-07-14', 64),
('EX038', 'ST013', 'SCIE', '2022-07-14', 32),
('EX039', 'ST013', 'LANG', '2022-07-14', 12),
('EX040', 'ST014', 'MATH', '2022-05-14', 91),
('EX041', 'ST014', 'SCIE', '2022-05-14', 90),
('EX042', 'ST014', 'LANG', '2022-05-14', 94),
('EX043', 'ST015', 'MATH', '2022-09-14', 98),
('EX044', 'ST015', 'SCIE', '2022-09-14', 100),
('EX045', 'ST015', 'LANG', '2022-09-14', 98);


-- Displaying Sorted Data for MATH, SCIE, and LANG --
SELECT StudentName, SchoolName, ExamScore, ExamDate
FROM Exam
JOIN Student
  ON Student.StudentID = Exam.StudentID
JOIN School
  ON Student.SchoolID = School.SchoolID
WHERE ExamType = "MATH"
ORDER BY ExamScore DESC;

SELECT StudentName, SchoolName, ExamScore, ExamDate
FROM Exam
JOIN Student
  ON Student.StudentID = Exam.StudentID
JOIN School
  ON Student.SchoolID = School.SchoolID
WHERE ExamType = "SCIE"
ORDER BY ExamScore DESC;

SELECT StudentName, SchoolName, ExamScore, ExamDate
FROM Exam
JOIN Student
  ON Student.StudentID = Exam.StudentID
JOIN School
  ON Student.SchoolID = School.SchoolID
WHERE ExamType = "LANG"
ORDER BY ExamScore DESC;

-- Best Student --
SELECT Exam.StudentID, StudentName, SchoolName, SUM(ExamScore) AS "TotalScore"
FROM Exam
JOIN Student
  ON Student.StudentID = Exam.StudentID
JOIN School
  ON Student.SchoolID = School.SchoolID
GROUP BY Exam.StudentID
ORDER BY SUM(ExamScore) DESC;

-- Best School --
SELECT School.SchoolID, SchoolName, SUM(ExamScore) AS "TotalScore"
FROM Exam
JOIN Student
  ON Student.StudentID = Exam.StudentID
JOIN School
  ON Student.SchoolID = School.SchoolID
GROUP BY School.SchoolID
ORDER BY SUM(ExamScore) DESC;

