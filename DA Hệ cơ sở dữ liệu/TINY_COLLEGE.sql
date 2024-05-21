﻿CREATE DATABASE TINY_COLLEGE
GO

USE TINY_COLLEGE
GO




CREATE TABLE PROFESSOR (
	PROF_NUM CHAR(6) NOT NULL ,
	DEPT_CODE CHAR(6) , 
	PROF_SPECIALTY VARCHAR(30) ,
	PROF_RANK CHAR(6) ,
	PROF_LNAME NVARCHAR(20) NOT NULL ,
	PROF_FNAME NVARCHAR(20) NOT NULL ,
	PROF_INITIAL NVARCHAR(20) NOT NULL , 
	PROF_EMAIL VARCHAR(100) NOT NULL , 

	CONSTRAINT PK_PROFESSOR PRIMARY KEY(PROF_NUM),
)
GO

CREATE TABLE DEPARTMENT (
	DEPT_CODE CHAR(6) NOT NULL , 
	DEPT_NAME NVARCHAR(20) NOT NULL ,
	SCHOOL_CODE CHAR(6) ,
	PROF_NUM CHAR(6) ,

	CONSTRAINT PK_DEPT_CODE PRIMARY KEY(DEPT_CODE) ,
	CONSTRAINT FK_PROF_NUM_PROFESSOR FOREIGN KEY(PROF_NUM) REFERENCES PROFESSOR(PROF_NUM),
) 
GO

CREATE TABLE SCHOOL (
	SCHOOL_CODE CHAR(6) NOT NULL,
	SCHOOL_NAME NVARCHAR(100) NOT NULL,
	PROF_NUM CHAR(6) ,

	CONSTRAINT PK_SCHOOL_CODE PRIMARY KEY(SCHOOL_CODE),
)
GO

ALTER TABLE PROFESSOR
ADD CONSTRAINT FK_DEPT_CODE_DEPARTMENT FOREIGN KEY(DEPT_CODE) REFERENCES DEPARTMENT(DEPT_CODE) 

ALTER TABLE DEPARTMENT 
ADD CONSTRAINT FK_SCHOOL_CODE_SCHOOL FOREIGN KEY(SCHOOL_CODE) REFERENCES SCHOOL(SCHOOL_CODE)

ALTER TABLE SCHOOL 
ADD CONSTRAINT FK_PROF_NUM_PROFESSOR_SCHOOL FOREIGN KEY(PROF_NUM) REFERENCES PROFESSOR(PROF_NUM)


CREATE TABLE COURSE (
	CRS_CODE CHAR(6) NOT NULL ,
	DEPT_CODE CHAR(6)  ,
	CRS_TITLE NVARCHAR(30) ,
	CRS_DESCRIPTION NVARCHAR(30),
	CRS_CREDIT NVARCHAR(30),

	CONSTRAINT PK_CRS_CODE PRIMARY KEY(CRS_CODE), 
)
GO

ALTER TABLE COURSE
ADD CONSTRAINT FK_DEPT_CODE_DEPARTMENT_COURSE FOREIGN KEY(DEPT_CODE) REFERENCES DEPARTMENT(DEPT_CODE) 

CREATE TABLE STUDENT (
	STU_NUM CHAR(6) NOT NULL ,
	DEPT_CODE CHAR(6) ,
	PROF_NUM CHAR(6) ,
	STU_LNAME NVARCHAR(20) NOT NULL ,
	STU_FNAME NVARCHAR(20) NOT NULL , 
	STU_INITIAL NVARCHAR(20) NOT NULL ,
	STU_EMAIL NVARCHAR(100) NOT NULL , 

	CONSTRAINT PK_STU_NUM PRIMARY KEY(STU_NUM) ,
)
GO

ALTER TABLE STUDENT 
ADD CONSTRAINT FK_DEPT_CODE_DEPARTMENT_STUDENT FOREIGN KEY(DEPT_CODE) REFERENCES DEPARTMENT(DEPT_CODE)

ALTER TABLE STUDENT 
ADD CONSTRAINT FK_PROF_NUM_PROFESSOR_STUDENT FOREIGN KEY(PROF_NUM) REFERENCES PROFESSOR(PROF_NUM)

CREATE TABLE CLASS (
	CLASS_CODE CHAR(6) NOT NULL , 
	CLASS_SECTION NVARCHAR(20) NOT NULL ,
	CLASS_TIME DATETIME ,
	CRS_CODE CHAR(6) ,
	PROF_NUM CHAR(6) ,
	ROOM_CODE CHAR(6) , 
	SEMESTER_CODE CHAR(6) ,

	CONSTRAINT PK_CLASS_CODE PRIMARY KEY(CLASS_CODE)
)
GO

ALTER TABLE CLASS 
ADD CONSTRAINT FK_CRS_CODE_CLASS FOREIGN KEY(CRS_CODE) REFERENCES COURSE(CRS_CODE)

ALTER TABLE CLASS
ADD CONSTRAINT FK_PROF_NUM_CLASS FOREIGN KEY(PROF_NUM) REFERENCES PROFESSOR(PROF_NUM)

CREATE TABLE SEMESTER(
	SEMESTER_CODE CHAR(6) NOT NULL , 
	SEMESTER_YEAR CHAR(4) NOT NULL , 
	SEMESTER_TERM NVARCHAR(20) ,
	SEMESTER_START_DATE NVARCHAR(20) ,
	SEMESTER_END_DATE NVARCHAR(20) ,

	CONSTRAINT PK_SEMESTER_CODE PRIMARY KEY(SEMESTER_CODE)
)
GO

ALTER TABLE CLASS
ADD CONSTRAINT FK_SEMESTER_CODE_CLASS FOREIGN KEY(SEMESTER_CODE) REFERENCES SEMESTER(SEMESTER_CODE)

CREATE TABLE ENROLL (
	CLASS_CODE CHAR(6) NOT NULL ,
	STU_NUM CHAR(6) NOT NULL ,
	ENROLL_DATE DATETIME , 
	ENROLL_GRADE CHAR (10),

	CONSTRAINT PK_ENROLL_KEY PRIMARY KEY(CLASS_CODE , STU_NUM) ,
	CONSTRAINT FK_CLASS_CODE_ENROLL FOREIGN KEY(CLASS_CODE) REFERENCES CLASS(CLASS_CODE) ,
	CONSTRAINT FK_STU_NUM_ENROLL FOREIGN KEY(STU_NUM) REFERENCES STUDENT(STU_NUM) ,
)
GO

CREATE TABLE ROOM(
	ROOM_CODE CHAR(6) NOT NULL , 
	ROOM_TYPE NVARCHAR(20) ,
	BLDG_CODE CHAR(6) ,

	CONSTRAINT PK_ROOM_CODE PRIMARY KEY(ROOM_CODE) ,
)
GO

ALTER TABLE CLASS
ADD CONSTRAINT FK_ROOM_CODE_CLASS FOREIGN KEY(ROOM_CODE) REFERENCES ROOM(ROOM_CODE) 

CREATE TABLE BUILDING(
	BLDG_CODE CHAR(6) NOT NULL ,
	BLDG_NAME NVARCHAR(30) NOT NULL,
	BLDG_LOCATION NVARCHAR(100) NOT NULL ,

	CONSTRAINT PK_BLDG_CODE PRIMARY KEY(BLDG_CODE)
)
GO

ALTER TABLE ROOM 
ADD CONSTRAINT FK_BLDG_CODE_ROOM FOREIGN KEY(BLDG_CODE) REFERENCES BUILDING(BLDG_CODE)


--Nhập dữ liệu 

--PROFESSOR

INSERT INTO PROFESSOR(PROF_NUM ,PROF_FNAME, PROF_LNAME,PROF_INITIAL,PROF_EMAIL)
VALUES
	('001',N'TRẦN VĂN','A','PGS.TS','zxcvbnm@gmail.com'),
	('002',N'TRẦN VĂN','B','PGS.TS','zxcvbnm@gmail1.com'),
	('003',N'TRẦN VĂN','C','PGS.TS','zxcvbnm@gmail2.com'),
	('004',N'TRẦN VĂN','D','PGS.TS','zxcvbnm@gmail3.com'),
	('005',N'TRẦN VĂN','E','PGS.TS','zxcvbnm@gmail4.com'),
	('006',N'TRẦN VĂN','F','PGS.TS','zxcvbnm@gmail5.com'),
	('007',N'TRẦN VĂN','G','PGS.TS','zxcvbnm@gmail6.com'),
	('008',N'TRẦN VĂN','H','PGS.TS','zxcvbnm@gmail7.com'),
	('009',N'TRẦN VĂN','J','PGS.TS','zxcvbnm@gmail8.com'),
	('010',N'TRẦN VĂN','K','PGS.TS','zxcvbnm@gmail9.com');

INSERT INTO DEPARTMENT(DEPT_CODE,DEPT_NAME)
VALUES 
	('001', N'Nhà A'),
	('002', N'Nhà B'),
	('003', N'Nhà C'),
	('004', N'Nhà D'),
	('005', N'Nhà E');

INSERT INTO SCHOOL(SCHOOL_CODE,SCHOOL_NAME)
VALUES
	
	('001', N'Đại học Bách Khoa Hà Nội'),
	('002', N'Đại học Kinh Tế Quốc Dân'),
	('003', N'Đại học Xây Dựng Hà Nội');

INSERT INTO COURSE(CRS_CODE)
VALUES ('2023')

INSERT INTO STUDENT(STU_NUM , STU_FNAME ,STU_LNAME, STU_INITIAL , STU_EMAIL)
VALUES 
	('001',N'NGUYỄN THỊ','A','SV','asdfghjkl@gmail.com'),
	('002',N'NGUYỄN THỊ','B','SV','asdfghjkl1@gmail.com'),
	('003',N'NGUYỄN THỊ','C','SV','asdfghjkl2@gmail.com'),
	('004',N'NGUYỄN THỊ','D','SV','asdfghjkl3@gmail.com'),
	('005',N'NGUYỄN THỊ','E','SV','asdfghjkl4@gmail.com'),
	('006',N'NGUYỄN THỊ','F','SV','asdfghjkl5@gmail.com'),
	('007',N'NGUYỄN THỊ','G','SV','asdfghjkl6@gmail.com'),
	('008',N'NGUYỄN THỊ','H','SV','asdfghjkl7@gmail.com'),
	('009',N'NGUYỄN THỊ','J','SV','asdfghjkl8@gmail.com'),
	('010',N'NGUYỄN THỊ','K','SV','asdfghjkl9@gmail.com');

INSERT INTO CLASS(CLASS_CODE , CLASS_SECTION)
VALUES 
	('001', N'Lớp cơ bản'),
	('002', N'Lớp nâng cao')

INSERT INTO SEMESTER(SEMESTER_CODE , SEMESTER_YEAR)
VALUES 
	('001' , 'HKI'),
	('002' , 'HKII');



