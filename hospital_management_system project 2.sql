create database hospital;


create table patients
(patient_id  int  primary key not null,
patient_name varchar(50) not null,
age int not null,
gender varchar(50),
disease varchar(50),
city varchar (50));


insert into patients
(patient_id,patient_name,age,gender,disease,city)
values
(1,"aditya patil",23,'male','fever','mumbai'),
(2,"abhay kumar",24,'male','daibetes','up'),
(3,"amar kamble",25,'male','brain tumer','pune'),
(4,"rutuja kapur",23,'female','fracture','nagpur'),
(5,"sanika joshi",26,'female','acne','kolhapur'),
(6," sahil jadhav",23,'male','asthma','sangli');


select * from patients;





create table doctors
(doctor_id int primary key  not null,
doctor_name varchar(50) not null,
specialization varchar(50) not null,
experience int not null);


insert into doctors
(doctor_id,doctor_name,specialization,experience)
values
(101,'dr kshitija mali','cardiologist',10),
(102,'dr rohan chougule','neurologist',8),
(103,'dr vaishnavi mali','dermotologist',7),
(104,'dr aniket nalawade','orthopedic',9),
(105,'dr sangharsh kamble','general physician',8);

select * from doctors;



create table appointments
(appointment_id int primary key not null,
patient_id int  not null,
doctor_id int  not null,
appointment_date date not null,
fees int not null);


insert into appointments
(appointment_id,patient_id,doctor_id,appointment_date,fees)
values
(1001,1,105,"2026-02-01",1000),
(1002,2,105,"2026-04-01",700),
(1003,3,102,"2026-06-02",1500),
(1004,4,104,"2026-08-02",800),
(1005,5,103,"2026-10-03",500),
(1006,6,101,"2026-12-03",1000);

select * from appointments;

#######################################################################################################################################################################

#problems


#######################################################################################################################################################################


-- top 3 highest fees

select fees as highest_fees from appointments 
order by fees desc
limit 3;

#######################################################################################################################################################################

--  total revenue

select sum(fees) as total_revenue from appointments;


#######################################################################################################################################################################

-- patient above 20


SELECT patient_name, age, disease
FROM patients
WHERE age > 20;

#######################################################################################################################################################################



-- date wise total appointments


SELECT appointment_date, COUNT(*) AS total_appointments
FROM appointments
GROUP BY appointment_date
ORDER BY appointment_date;


##################################################################################################################################################################

-- highest consultation fee

select max(fees) as highest_fee from appointments;

#######################################################################################################################################################################
-- number of patients by disease

SELECT disease, COUNT(*) AS patient_count
FROM patients
GROUP BY disease;

#######################################################################################################################################################################
-- number of appointments per doctor

select doctor_id,count(*) as total_appointments from appointments
group by doctor_id
order by doctor_id;


#######################################################################################################################################################################
-- total reveue per doctor

select doctor_id,sum(fees) as revenue from appointments
group by doctor_id
order by doctor_id;

#######################################################################################################################################################################
-- display patient name with doctor name

SELECT p.patient_name, d.doctor_name
FROM patients as p
JOIN appointments as a 
ON p.patient_id = a.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;


#######################################################################################################################################################################
-- Show doctor specialization with patient disease.

select d.doctor_name,d.specialization,p.disease from patients as p
join appointments as a
on p.patient_id=a.patient_id
join doctors as d
on d.doctor_id = a.doctor_id;

#######################################################################################################################################################################

-- Find appointments along with patient and doctor names.


SELECT p.patient_name, d.doctor_name, a.appointment_date
FROM appointments a
JOIN patients p 
ON a.patient_id = p.patient_id
JOIN doctors d 
ON a.doctor_id = d.doctor_id;

#########################################################################################################################################################################
