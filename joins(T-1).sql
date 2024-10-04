-- Get All Students Enrolled in Each Course

SELECT Student.FirstName, Student.LastName, Courses.CourseName, Enrollment.Grade
FROM Enrollment
JOIN Student ON Enrollment.StudentID = Student.StudentID
JOIN Courses ON Enrollment.CourseID = Courses.CourseID;


-- Get Courses and Their Enrolled Students

SELECT Courses.CourseName, Student.FirstName, Student.LastName, Enrollment.Grade
FROM Courses
JOIN Enrollment ON Courses.CourseID = Enrollment.CourseID
JOIN Student ON Enrollment.StudentID = Student.StudentID;


-- Get Students with Their Average Grade

SELECT Student.FirstName, Student.LastName, AVG(CASE WHEN Grade = 'A' THEN 4
                                                       WHEN Grade = 'B' THEN 3
                                                       WHEN Grade = 'C' THEN 2
                                                       WHEN Grade = 'D' THEN 1
                                                       ELSE 0 END) AS AverageGrade
FROM Student
JOIN Enrollment ON Student.StudentID = Enrollment.StudentID
GROUP BY Student.StudentID;

-- Get Courses with the Number of Enrolled Students

SELECT Courses.CourseName, COUNT(Enrollment.StudentID) AS NumberOfStudent
FROM Courses
LEFT JOIN Enrollment ON Courses.CourseID = Enrollment.CourseID
GROUP BY Courses.CourseID; 
