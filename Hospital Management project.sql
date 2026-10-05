Create database HospitalDB
use HospitalDB

-- Hospital departments--
Create table Departments
(
DepartmentId int primary key identity(1,1),
DepartmentName varchar(100) not Null
)

insert into Departments (DepartmentName)
VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('General Medicine');

select * from Departments

-- patients details--
CREATE TABLE Patients
(
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    PatientName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(200)
);

INSERT INTO Patients
    (PatientName, Gender, DateOfBirth, Phone, Email, Address)
VALUES
    ('Arun Kumar', 'Male', '1998-05-12', '9876543210', 'arun@gmail.com', 'Chennai'),
    ('Priya Devi', 'Female', '2001-08-20', '9876543211', 'priya@gmail.com', 'Tambaram'),
    ('Rahul Raj', 'Male', '1995-03-15', '9876543212', 'rahul@gmail.com', 'Pallavaram'),
    ('Divya S', 'Female', '1999-11-25', '9876543213', 'divya@gmail.com', 'Chromepet'),
    ('Karthik M', 'Male', '1992-01-10', '9876543214', 'karthik@gmail.com', 'Guindy');

    select * from Patients

-- select Doctor details--
CREATE TABLE Doctors
(
DoctorId int primary key identity(1,1),
DoctorName Varchar(100) not null,
specialization varchar(100),
DepartmentId int,
phone varchar(15),

constraint Fk_Doctors_Departments
Foreign key (DepartmentID)
references Departments(DepartmentId)
);

INSERT INTO Doctors
    (DoctorName, Specialization, DepartmentID, Phone)
VALUES
    ('Dr. Suresh', 'Cardiologist', 1, '9000000001'),
    ('Dr. Meena', 'Neurologist', 2, '9000000002'),
    ('Dr. Kumar', 'Orthopedic', 3, '9000000003'),
    ('Dr. Anitha', 'Pediatrician', 4, '9000000004'),
    ('Dr. Rajesh', 'General Physician', 5, '9000000005');

    select * from Doctors
-- Appointments --
    Create table Appointments
    (
    AppointmentID int primary key identity(1,1),
    patientID int not null,
    DoctorID int not null,
    AppointmentDate datetime not null,
    Reason varchar(200),
    Status varchar(20) Default 'scheduled',
    
    constraint FK_Appointments_patients
    foreign key (patientID)
    references patients(patientID),

    
    CONSTRAINT FK_Appointments_Doctors
        FOREIGN KEY (DoctorID)
        REFERENCES Doctors(DoctorID)
)
INSERT INTO Appointments
    (PatientID, DoctorID, AppointmentDate, Reason, Status)
VALUES
    (1, 1, '2026-10-06 10:00', 'Fever and headache', 'Scheduled'),
    (2, 2, '2026-10-06 11:30', 'Regular checkup', 'Scheduled'),
    (3, 1, '2026-10-07 09:30', 'Back pain', 'Scheduled'),
    (4, 3, '2026-10-07 14:00', 'Skin problem', 'Scheduled');

select 
A.AppointmentID,
p.patientName,
D.DoctorName,
A.AppointmentDate,
A.Reason,
A.status
from Appointments A
inner join patients p
on A.patientID = p.patientID
inner join Doctors D
on A.DoctorID = D.DoctorID
 