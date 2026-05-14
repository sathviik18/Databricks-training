# 📘 Week 1 – Day 3 (SQL Joins Practice)

## 📂 Folder Structure

week1/
│
└── day3/
    ├── joins_schema.sql
    ├── day3_queries.sql
    ├── outputs.md
    └── README.md

---

## 🛠 Tools Used

- MySQL
- DB-Fiddle
- GitHub

---

## 📚 Concepts Covered Today

- INNER JOIN (concept understanding through comparison)
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN (via UNION in MySQL)
- CROSS JOIN
- Handling NULL values in joins
- Identifying unmatched records
- Multi-table joins (3+ tables)
- Join chaining in real-world scenarios

---

## 📊 Key SQL Topics Practiced

### 🔹 Basic JOIN Queries
- Display students with enrolled courses
- Linking students → enrollments → courses
- Understanding one-to-many relationships

---

### 🔹 LEFT JOIN Practice
- Show all students including those not enrolled
- Show all courses including those without enrollments
- Show all instructors including unassigned ones

---

### 🔹 RIGHT JOIN Practice
- Display all students using RIGHT JOIN
- Display all enrollments with student details
- Understanding direction of preserved table

---

### 🔹 FULL OUTER JOIN (Simulation in MySQL)
- Combine LEFT JOIN + RIGHT JOIN using UNION
- Display all students, courses, and instructors
- Identify unmatched rows from both sides

---

### 🔹 Unmatched Data Detection
- Students not enrolled in any course
- Courses with no students
- Courses without instructors
- Instructors without assigned courses

---

### 🔹 Multi-Table JOIN (Advanced)
- Student → Enrollment → Course → Instructor
- Generating complete learning platform report
- Handling missing relationships across multiple tables

---

### 🔹 CROSS JOIN (Bonus Concept)
- Every student paired with every course
- Cartesian product understanding
- Used for recommendation-style outputs

---

## 📌 Summary

In Day 3, I learned how to combine multiple tables using different types of SQL joins. I practiced identifying missing relationships, handling NULL values, and building real-world reports using multi-table joins. I also understood how FULL OUTER JOIN works in MySQL using UNION and how CROSS JOIN generates all possible combinations. 
