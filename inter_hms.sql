
--  MEDIUM LEVEL QUEIRES
-- 18)Show unique birth years from patients and order them by ascending
select distinct year(birth_date) as birth_year from patients order by birth_year asc;

-- 19)Show unique first names from the patients table which only occurs once in the list.
select  first_name from patients group by first_name having count(*)=1;

-- 20)Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
select patient_id , first_name from patients 
where first_name like('s____%s') ;

-- 21)Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.Primary diagnosis is stored in the admissions table.
select p.patient_id , p.first_name , p.last_name 
from patients p join admissions a on p.patient_id=a.patient_id 
where diagnosis='Dementia';


-- 22)Display every patient's first_name. Order the list by the length of each name and then by alphabetically.
select first_name from patients order by len(first_name), first_name asc;

-- 23) Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.
select 
(select count(*) from patients where gender='M')as male_count ,
(select count(*) from patients where gender='F')as female_count;

-- 24)Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
select first_name , last_name , allergies from patients 
where allergies in('Penicillin','Morphine') order by allergies , first_name,last_name asc;

-- 25)Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
select patient_id , diagnosis from admissions
group by patient_id,diagnosis
having count(*)>1;

-- 26)Show the city and the total number of patients in the city.Order from most to least patients and then by city name ascending
select city , count(first_name) as num_patients from patients 
group by city 
order by num_patients desc , city asc;

-- 27)Show first name, last name and role of every person that is either patient or doctor.The roles are either "Patient" or "Doctor
select first_name , last_name , 'Patient' as role from patients
union all
select first_name , last_name , 'Doctor' as role from doctors;

-- 28)Show all allergies ordered by popularity. Remove NULL values from query.
select allergies , count(allergies) as total_diagnosis
from patients group by allergies having total_diagnosis >=1
order by total_diagnosis desc;

-- 29)how all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
SELECT
  first_name,
  last_name,
  birth_date
FROM patients
WHERE
  YEAR(birth_date) BETWEEN 1970 AND 1979
ORDER BY birth_date ASC;

-- 30)We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending orderEX: SMITH,jane
select concat( upper(last_name),',',lower(first_name))
from patients
order by first_name desc;

-- 31)Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
select province_id , sum(height) as sum_height 
from patients
group by province_id
having sum_height >= 7000;


-- 32)Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni
select (max(weight) - min (weight)) as weight_delta from patients 
where last_name='Maroni';


-- 33)Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
SELECT
  DAY(admission_date) AS day_number,
  COUNT(*) AS number_of_admissions
FROM admissions
GROUP BY day_number
ORDER BY number_of_admissions DESC;

-- 34)Show all columns for patient_id 542's most recent admission_date
select * from admissions where patient_id=542 order by admission_date desc limit 1;

-- 35) Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
-- 1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
-- 2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.
SELECT
  patient_id,
  attending_doctor_id,
  diagnosis
FROM admissions
WHERE
  (
    attending_doctor_id IN (1, 5, 19)
    AND patient_id % 2 != 0
  )
  OR 
  (
    attending_doctor_id LIKE '%2%'
    AND len(patient_id) = 3
  );
  
  

-- 36)Show first_name, last_name, and the total number of admissions attended for each doctor.Every admission has been attended by a doctor
select d.first_name , d.last_name , count(a.attending_doctor_id ) as admissions_total
from doctors d join admissions a on d.doctor_id=a.attending_doctor_id
group by attending_doctor_id ;

-- 37)For each doctor, display their id, full name, and the first and last admission date they attended.
select d.doctor_id , concat (d.first_name ,' ',last_name)
as full_name , min( a.admission_date) as first_admission_date , max(a.admission_date) as last_admission_date
from doctors d join admissions a on d.doctor_id=a.attending_doctor_id
group by full_name;


-- 38)Display the total amount of patients for each province. Order by descending.
select pr.province_name, count(p.patient_id) as patient_count
from province_names pr join patients p on pr.province_id = p.province_id
group by province_name order by patient_count desc;


-- 39)For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem
select concat (p.first_name ,' ',p.last_name) as patient_name ,
a.diagnosis  , concat (d.first_name ,' ',d.last_name) as doctor_name 
from patients p
join admissions a on p.patient_id = a.patient_id
join doctors d on a.attending_doctor_id = d.doctor_id;

-- 40)display the first name, last name and number of duplicate patients based on their first name and last name.
-- Ex: A patient with an identical name can be considered a duplicate
select first_name , last_name ,count(*)as num_of_duplicate
from patients
group by first_name,last_name
having num_of_duplicate>1;


-- 41)Display a single row with max_visits, min_visits, average_visits where the maximum, minimum and average number of admissions per day is calculated. Average is rounded to 2 decimal places.
select max(adm) as max_visits , min(adm) as min_visits ,
round( avg(adm ),2) as average_visits
from
 ( select count(admission_date) as adm from admissions
 group by admission_date );

