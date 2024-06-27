CREATE DATABASE Lab4
---------------
--1ST TASK
----------------
CREATE TABLE Patient(
 PatientID varchar(15) PRIMARY KEY,
 Name varchar(15),
 Age int,
 Gender varchar(25),
 Address varchar(20),
 Disease varchar(10),
 DoctorID varchar(15)
);


CREATE TABLE Doctor(
 DoctorID varchar(15) PRIMARY KEY,
 Name varchar(15),
 Age int,
 Gender varchar(15),
 Address varchar(20),
);

ALTER TABLE Patient
ALTER COLUMN
Gender char(5)


ALTER TABLE Doctor
ADD DoctorWard
varchar(15)

ALTER TABLE Patient
add Foreign key(DoctorID) REFERENCES Doctor(DoctorID);


SELECT * From Patient
SELECT * From Doctor
-------------------


--2nd Task
CREATE TABLE sheery(
LabID varchar(15) PRIMARY KEY,
TestDate date,
TestAmount varchar(20),
PatientID varchar(15),
DoctorID varchar(15 )
);


ALTER TABLE sheery
add Foreign key(DoctorID) REFERENCES Doctor(DoctorID);

ALTER TABLE sheery
add Foreign key(PatientID) REFERENCES Patient(PatientID);


exec Sp_Rename 'Lab.TestAmount','Amount', 'COLUMN';

ALTER TABLE sheery ALTER COLUMN TestAmount Double precision(20);
ALTER TABLE sheery ADD LabNo varchar(15)
SELECT * From sheery
SELECT * From Patient
SELECT * From Doctor
-------------------------------

--Task 3
CREATE TABLE HospitalRoom(
RoomID varchar(15) PRIMARY KEY,
RoomAllocationDate date,
RoomType varchar(20),
RoomStatus varchar(5)
);

exec Sp_Rename 'HospitalRoom','Room'
SELECT * From HospitalRoom

CREATE TABLE PatientBill(
BillID varchar(255) PRIMARY KEY,
BillDate date,
Amount varchar(255),
PatientID varchar(255)
);


ALTER TABLE PatientBill
add Foreign key(PatientID) REFERENCES Patient(PatientID);


SELECT * From PatientBill