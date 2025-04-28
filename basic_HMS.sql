-- 1) Show first name, last name, and gender of patients whose gender is 'M
select first_name , last_name ,gender FROM PATIENTS where gender='M';

-- 2) Show first name and last name of patients who does not have allergies. (null)
select first_name , last_name  FROM PATIENTS where allergies IS null;

-- 3) Show first name of patients that start with the letter 'C'
select first_name  
FROM PATIENTS 
where first_name like 'C%';

-- 4) Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
select first_name  , last_name
FROM PATIENTS 
where weight  between 100 and 120;

-- 5) Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
update  patients
set allergies="NKA" 
where allergies is null;

-- 6) Show first name and last name concatinated into one column to show their full name
select concat( first_name  ,' ', last_name) as full_name from patients;


-- 7) Show first name, last name, and the full province name of each patient.
select pa.first_name,pa.last_name ,pr.province_name
from patients pa join province_names pr 
on pa.province_id=pr.province_id; 


-- 8) Show how many patients have a birth_date with 2010 as the birth year
select count(patient_id) as total_patients from patients
where year (birth_date)=2010;

-- 9)Show the first_name, last_name, and height of the patient with the greatest height.
select first_name, last_name , height 
from patients
order by height desc limit 1;

-- 11) Show all columns for patients who have one of the following patient_ids:1,45,534,879,1000
select * from patients where patient_id in (1,45,534,879,1000);

-- 12) Show the total number of admissions
select count(patient_id) as total_admissions from admissions;

-- 13)Show all the columns from admissions where the patient was admitted and discharged on the same day.
select * from admissions where admission_date=discharge_date;

-- 14)Show the patient id and the total number of admissions for patient_id 579.
select patient_id , count(diagnosis) from admissions where patient_id=579;

-- 15) Based on the cities that our patients live in, show unique cities that are in province_id 'NS'
SELECT DISTINCT(city) AS unique_cities
FROM patients
WHERE province_id = 'NS';

-- 16)Write a query to find the first_name, last name and birth date of patients who has height greater than 160 and weight greater than 70
select first_name , last_name , birth_date FROM patients where weight>70 AND height>160;

-- 17)Write a query to find list of patients first_name, last_name, and allergies where allergies are not null and are from the city of 'Hamilton'
select first_name , last_name , allergies from patients
where allergies is not null and city='Hamilton';