----(a)
CREATE TABLE Student1(
Registration_No varchar(20) PRIMARY KEY,
First_Name varchar(20),
Last_Name varchar(20),
CGPA float,
Contact int
);
-----(b)
INSERT INTO Student Values ('315','john ','Smith',3.7,10315)
INSERT INTO Student Values ('316','Harry','Potter',3.1,10316)
INSERT INTO Student Values ('317','James','Potter',NULL,10317)
INSERT INTO Student Values ('318','Mr','Ronn',2.89,10318)
INSERT INTO Student Values ('319','Cirius','Black',NULL,10319)

-----(c)
Select* From Student
-----(d)
Select Registration_No From Student
Select First_name From Student

------(e)
Select CGPA From Student where CGPA>3.5


--Display all the data of student where cgpa <= 3.5
Select cgpa From Student where cgpa<=3.5

--Q : Does above queries cover all the data?
--A : No, because 2 students have undefined cgpa

--D0isplay Fist and Last Name using cancetanation + 
Select First_name + Last_Name  as Full_name from Student