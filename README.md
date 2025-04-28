# 🏥 Hospital Management System (SQL Project)

This project is a database management system for a Hospital Management System (HMS), designed using SQL. It models patient records, doctor specializations, admissions, and provinces. I solved **52 SQL queries** to practice and explore real-world database operations.



## 🎯 Objective

The goal of this project is to practice SQL queries using a structured database related to hospital data. It helps in gaining hands-on experience with:
- Database creation and normalization
- Writing optimized SQL queries
- Understanding data relationships (foreign keys, joins)
- Solving practical database challenges with real-world scenarios

---

## 🛠️ Technologies Used

- SQL (Structured Query Language)
- MySQL (or any compatible RDBMS)
- Git & GitHub

---

## 🔍 Query Levels

### 1️⃣ **Basic Level**
- Creating tables and inserting data
- Simple SELECT queries with conditions

### 2️⃣ **Intermediate Level**
- Complex SELECT queries with joins and GROUP BY
- Filtering and sorting data
- Date functions and aggregation

### 3️⃣ **Advanced Level**
- Subqueries, nested queries, and joins
- Complex data analysis like revenue analysis, customer behavior, etc.
- Creating views, stored procedures, and triggers

---

## 📈 Sample Query (Advanced)

```sql
SELECT province_name, COUNT(DISTINCT patient_id) AS total_patients
FROM patients
JOIN province_names ON patients.province_id = province_names.province_id
GROUP BY province_name
ORDER BY total_patients DESC;
