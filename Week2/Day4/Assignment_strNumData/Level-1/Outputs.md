**Query #11**

    SELECT 
    LOWER(EMP_NAME) AS EMP_NAME,
    ROUND(SALARY,2) AS ROUNDED_SALARY,
    TRUNCATE(SALARY,2) AS TRUNCATED_SALARY,
    ABS(ROUND(SALARY,2) - TRUNCATE(SALARY,2)) AS PRECISION_DIFFERENCE,
    MONTHNAME(revision_date) AS revision_month,
    CASE 
    WHEN ABS(ROUND(SALARY,2) - TRUNCATE(SALARY,2)) > 0
    THEN 'PRECISION LOSS'
    ELSE 'STABLE'
    END AS PRECISION_CHECK
    FROM salary_precision;

| EMP_NAME | ROUNDED_SALARY | TRUNCATED_SALARY | PRECISION_DIFFERENCE | REVISION_MONTH | PRECISION_CHECK |
| -------- | -------------- | ---------------- | -------------------- | -------------- | ---------------- |
| ravi     | 85000.99       | 85000.98         | 0.01                 | January        | PRECISION LOSS   |
| veena    | 65000.12       | 65000.12         | 0                    | January        | STABLE           |
| anil     | 70001.00       | 70000.99         | 0.01                 | January        | PRECISION LOSS   |

---

**Query #12**

    SELECT 
    UPPER(EMP_NAME) AS EMP_NAME,
    POWER((1+GROWTH_RATE/100), YEARS_PROJECTED) * CURRENT_SALARY AS FUTURE_SALARY,
    ROUND(POWER((1+GROWTH_RATE/100), YEARS_PROJECTED) * CURRENT_SALARY) AS ROUNDED_PROJECTION,
    GROWTH_RATE AS GROWTH_PERCENTAGE,
    CASE 
    WHEN ((POWER((1+GROWTH_RATE/100), YEARS_PROJECTED)-1)*100) > 50 THEN 'RAPID GROWTH'
    WHEN ((POWER((1+GROWTH_RATE/100), YEARS_PROJECTED)-1)*100) BETWEEN 20 AND 50 THEN 'MODERATE'
    ELSE 'STABLE'
    END AS GROWTH_STATUS
    FROM salary_growth;

| EMP_NAME | FUTURE_SALARY | ROUNDED_PROJECTION | GROWTH_PERCENTAGE | GROWTH_STATUS |
| -------- | ------------- | ------------------ | ----------------- | -------------- |
| KARTHIK  | 101193.46     | 101193             | 10.5              | MODERATE       |
| VEENA    | 95506.91      | 95507              | 8.0               | MODERATE       |
| RAVI     | 106625.13     | 106625             | 12.0              | MODERATE       |

---

**Query #13**

    SELECT 
    LOWER(EMP_NAME) AS EMP_NAME,
    SALARY AS ORIGINAL_SALARY,
    REVERSE(SALARY) AS REVERSE_SALARY,
    DAYNAME(CHECK_DATE) AS CHECK_DAY,
    CASE 
    WHEN SALARY = REVERSE(SALARY) THEN 'SYMMETRIC'
    ELSE 'NON-SYMMETRIC'
    END AS SYMMETRY_STATUS
    FROM salary_symmetry;

| EMP_NAME | ORIGINAL_SALARY | REVERSE_SALARY | CHECK_DAY | SYMMETRY_STATUS |
| -------- | --------------- | -------------- | --------- | --------------- |
| ravi     | 7557            | 7557           | Wednesday | SYMMETRIC       |
| veena    | 6506            | 6056           | Thursday  | NON-SYMMETRIC   |
| anil     | 7123            | 3217           | Friday    | NON-SYMMETRIC   |

---

**Query #14**

    SELECT 
    CONCAT(UPPER(LEFT(EMP_NAME,1)), LOWER(SUBSTRING(EMP_NAME,2))) AS EMPLOYEE_NAME,
    ROUND(SALARY) AS ROUNDED_SALARY,
    DAYNAME(PAYMENT_DATE) AS PAYMENT_DAY,
    YEAR(PAYMENT_DATE) AS PAYMENT_YEAR,
    CASE 
    WHEN YEAR(PAYMENT_DATE)%4=0 AND YEAR(PAYMENT_DATE)%100!=0 THEN 'LEAP YEAR PAYMENT'
    ELSE 'NORMAL PAYMENT'
    END AS LEAP_STATUS
    FROM leap_salary;

| EMPLOYEE_NAME | ROUNDED_SALARY | PAYMENT_DAY | PAYMENT_YEAR | LEAP_STATUS |
| ------------- | -------------- | ----------- | ------------ | ----------- |
| Ravi          | 85001          | Thursday    | 2024         | LEAP YEAR PAYMENT |
| Veena         | 65000          | Friday      | 2025         | NORMAL PAYMENT |
| Anil          | 70000          | Saturday    | 2020         | LEAP YEAR PAYMENT |

---

**Query #15**

    SELECT 
    UPPER(EMP_NAME) AS EMP_NAME,
    DATEDIFF(ACTUAL_CREDIT, EXPECTED_CREDIT) AS DELAY_DAYS,
    ROUND(SALARY) AS ROUNDED_SALARY,
    DAYNAME(ACTUAL_CREDIT) AS CREDIT_DAY,
    CASE 
    WHEN DATEDIFF(ACTUAL_CREDIT,EXPECTED_CREDIT) > 5 THEN 'SEVERE DELAY'
    WHEN DATEDIFF(ACTUAL_CREDIT,EXPECTED_CREDIT) BETWEEN 1 AND 5 THEN 'MINOR DELAY'
    ELSE 'ON TIME'
    END AS DELAY_STATUS
    FROM salary_credit_audit;

| EMP_NAME | DELAY_DAYS | ROUNDED_SALARY | CREDIT_DAY | DELAY_STATUS |
| -------- | ---------- | -------------- | ---------- | ------------ |
| RAVI     | 2          | 85001          | Friday     | MINOR DELAY  |
| VEENA    | 0          | 65000          | Wednesday  | ON TIME      |
| ANIL     | 7          | 70000          | Wednesday  | SEVERE DELAY |

---

**Query #16**

    SELECT 
    LOWER(EMP_NAME) AS EMP_NAME,
    TIMESTAMPDIFF(YEAR, JOINING_DATE, CURRENT_DATE_CHECK) AS EXPERIENCE_YEARS,
    ROUND(SALARY) AS ROUNDED_SALARY,
    DATEDIFF(CURRENT_DATE_CHECK, JOINING_DATE) AS TOTAL_DAYS,
    CASE 
    WHEN TIMESTAMPDIFF(YEAR, JOINING_DATE, CURRENT_DATE_CHECK) > 10 THEN 'VETERAN'
    WHEN TIMESTAMPDIFF(YEAR, JOINING_DATE, CURRENT_DATE_CHECK) BETWEEN 5 AND 10 THEN 'EXPERIENCED'
    ELSE 'FRESHER'
    END AS EXPERIENCE_STATUS
    FROM salary_time_drift;

| EMP_NAME | EXPERIENCE_YEARS | ROUNDED_SALARY | TOTAL_DAYS | EXPERIENCE_STATUS |
| -------- | ---------------- | -------------- | ---------- | ----------------- |
| karthik  | 7                | 75001          | 2557       | EXPERIENCED       |
| veena    | 3                | 65000          | 1296       | FRESHER           |
| ravi     | 10               | 85001          | 3940       | EXPERIENCED       |

---

**Query #17**

    SELECT 
    CONCAT(UPPER(LEFT(EMP_NAME,1)), LOWER(SUBSTRING(EMP_NAME,2))) AS EMP_NAME,
    TIMESTAMPDIFF(YEAR, JOINING_DATE, CURDATE()) AS ACTUAL_EXPERIENCE,
    ABS(DECLARED_EXPERIENCE - TIMESTAMPDIFF(YEAR, JOINING_DATE, CURDATE())) AS EXPERIENCE_DIFF,
    FLOOR(SALARY) AS FLOOR_SALARY,
    CASE 
    WHEN DECLARED_EXPERIENCE > TIMESTAMPDIFF(YEAR, JOINING_DATE, CURDATE()) THEN 'OVERSTATED'
    WHEN DECLARED_EXPERIENCE < TIMESTAMPDIFF(YEAR, JOINING_DATE, CURDATE()) THEN 'UNDERSTATED'
    ELSE 'MATCHED'
    END AS EXPERIENCE_STATUS
    FROM employee_experience;

| EMP_NAME | ACTUAL_EXPERIENCE | EXPERIENCE_DIFF | FLOOR_SALARY | EXPERIENCE_STATUS |
| -------- | ----------------- | --------------- | ------------- | ----------------- |
| Veena    | 7                | 3               | 65000         | UNDERSTATED       |
| Ravi     | 12               | 0               | 85000         | MATCHED           |
| Anil     | 5                | 2               | 70000         | UNDERSTATED       |

---

**Query #18**

    SELECT 
    UPPER(EMP_NAME) AS EMP_NAME,
    SALARY + IFNULL(BONUS,0) AS TOTAL_COMPENSATION,
    IFNULL(BONUS,0) AS BONUS_AMOUNT,
    MONTHNAME(SALARY_DATE) AS SALARY_MONTH,
    CASE 
    WHEN BONUS IS NULL THEN 'MISSING BONUS'
    WHEN (SALARY + IFNULL(BONUS,0)) > 90000 THEN 'HIGH COMPENSATION'
    ELSE 'STANDARD'
    END AS COMPENSATION_STATUS
    FROM salary_integrity;

| EMP_NAME | TOTAL_COMPENSATION | BONUS_AMOUNT | SALARY_MONTH | COMPENSATION_STATUS |
| -------- | ------------------ | ------------ | ------------ | ------------------- |
| RAVI     | 90001.15           | 5000.25      | January      | HIGH COMPENSATION   |
| ANIL     | 70000.10           | 0            | January      | MISSING BONUS       |
| VEENA    | 69000.90           | 4000.50      | January      | STANDARD            |

---

**Query #19**

    SELECT 
    LEFT(EMP_NAME,3) AS FIRST_THREE,
    YEAR(JOINING_DATE) AS JOIN_YEAR,
    ROUND(SALARY) AS SALARY_ROUNDED,
    MOD(ROUND(SALARY),10) AS LAST_DIGIT,
    CASE 
    WHEN MOD(ROUND(SALARY),10) = MOD(YEAR(JOINING_DATE),10) THEN 'ENCODE MATCH'
    ELSE 'MISMATCH'
    END AS ENCODING_STATUS
    FROM name_salary;

| FIRST_THREE | JOIN_YEAR | SALARY_ROUNDED | LAST_DIGIT | ENCODING_STATUS |
| ----------- | --------- | -------------- | ---------- | ---------------- |
| Kar         | 2020      | 75001          | 1          | MISMATCH         |
| Rav         | 2019      | 85001          | 1          | MISMATCH         |
| Vee         | 2021      | 65000          | 0          | MISMATCH         |

---

**Query #20**

    SELECT 
    LOWER(EMP_NAME) AS EMP_NAME,
    ROUND(ANNUAL_SALARY/12,2) AS MONTHLY_SALARY,
    MONTHNAME(PAYMENT_MONTH) AS PAYMENT_MONTH,
    CEIL(ANNUAL_SALARY/12) AS CEILING_SALARY,
    CASE 
    WHEN ANNUAL_SALARY/12 >= 100000 THEN 'PREMIUM'
    WHEN ANNUAL_SALARY/12 BETWEEN 50000 AND 99999 THEN 'MID RANGE'
    ELSE 'BASIC'
    END AS SALARY_STATUS
    FROM salary_monthly;

| EMP_NAME | MONTHLY_SALARY | PAYMENT_MONTH | CEILING_SALARY | SALARY_STATUS |
| -------- | -------------- | ------------- | -------------- | ------------- |
| ravi     | 100000         | January       | 100000         | PREMIUM       |
| anil     | 70000          | February      | 70000          | MID RANGE     |
| veena    | 50000          | March         | 50000          | MID RANGE     |

---

**Query #21**

    SELECT 
    UPPER(EMP_NAME) AS EMP_NAME,
    TRUNCATE(SALARY,0) AS TRUNCATED_SALARY,
    MOD(TRUNCATE(SALARY,0),10) AS LAST_DIGIT,
    DAY(AUDIT_DATE) AS AUDIT_DAY,
    CASE 
    WHEN MOD(TRUNCATE(SALARY,0),10) = DAY(AUDIT_DATE) THEN 'DIGIT MATCH'
    ELSE 'DIGIT MISMATCH'
    END AS DIGIT_STATUS
    FROM digit_audit;

| EMP_NAME | TRUNCATED_SALARY | LAST_DIGIT | AUDIT_DAY | DIGIT_STATUS |
| -------- | ---------------- | ---------- | --------- | ------------- |
| Karthik  | 75000            | 0          | 1         | DIGIT MISMATCH |
| Veena    | 65007            | 7          | 2         | DIGIT MISMATCH |
| Ravi     | 85009            | 9          | 3         | DIGIT MISMATCH |

---

**Query #22**

    SELECT 
    UPPER(EMP_NAME) AS EMP_NAME,
    DATEDIFF(ACTUAL_CREDIT, EXPECTED_CREDIT) AS DELAY,
    ROUND(SALARY) AS SALARY,
    DAYNAME(ACTUAL_CREDIT) AS CREDIT_DAY,
    CASE 
    WHEN DATEDIFF(ACTUAL_CREDIT,EXPECTED_CREDIT) > 5 THEN 'SEVERE DELAY'
    WHEN DATEDIFF(ACTUAL_CREDIT,EXPECTED_CREDIT) BETWEEN 1 AND 5 THEN 'MINOR DELAY'
    ELSE 'ON TIME'
    END AS STATUS
    FROM salary_credit_audit;

| EMP_NAME | DELAY | SALARY | CREDIT_DAY | STATUS |
| -------- | ----- | ------ | ---------- | ------ |
| RAVI     | 2     | 85001  | Friday     | MINOR DELAY |
| VEENA    | 0     | 65000  | Wednesday  | ON TIME |
| ANIL     | 7     | 70000  | Wednesday  | SEVERE DELAY |

---

**Query #23**

    SELECT 
    LOWER(EMP_NAME) AS EMP_NAME,
    TIMESTAMPDIFF(YEAR, JOINING_DATE, CURRENT_DATE_CHECK) AS EXPERIENCE,
    ROUND(SALARY) AS SALARY,
    DATEDIFF(CURRENT_DATE_CHECK, JOINING_DATE) AS DAYS,
    CASE 
    WHEN TIMESTAMPDIFF(YEAR, JOINING_DATE, CURRENT_DATE_CHECK) > 10 THEN 'VETERAN'
    WHEN BETWEEN 5 AND 10 THEN 'EXPERIENCED'
    ELSE 'FRESHER'
    END AS STATUS
    FROM salary_time_drift;

| EMP_NAME | EXPERIENCE | SALARY | DAYS | STATUS |
| -------- | ---------- | ------ | ---- | ------ |
| karthik  | 7          | 75001  | 2557 | EXPERIENCED |
| veena    | 3          | 65000  | 1296 | FRESHER |
| ravi     | 10         | 85001  | 3940 | EXPERIENCED |

---

**Query #24**

    SELECT 
    UPPER(EMP_NAME) AS EMP_NAME,
    ROUND(SALARY,2) AS SALARY,
    MONTHNAME(REVISION_DATE) AS MONTH,
    ABS(ROUND(SALARY,2)-TRUNCATE(SALARY,2)) AS DIFF,
    CASE 
    WHEN ABS(ROUND(SALARY,2)-TRUNCATE(SALARY,2)) > 0 THEN 'LOSS'
    ELSE 'STABLE'
    END AS STATUS
    FROM salary_precision;

| EMP_NAME | SALARY | MONTH | DIFF | STATUS |
| -------- | ------ | ----- | ---- | ------ |
| ravi     | 85000.99 | January | 0.01 | LOSS |
| veena    | 65000.12 | January | 0 | STABLE |
| anil     | 70001.00 | January | 0.01 | LOSS |

---

**Query #25**

    SELECT 
    UPPER(EMP_NAME) AS EMP_NAME,
    POWER((1+GROWTH_RATE/100),YEARS_PROJECTED)*CURRENT_SALARY AS FUTURE,
    ROUND(POWER((1+GROWTH_RATE/100),YEARS_PROJECTED)*CURRENT_SALARY) AS ROUNDED,
    GROWTH_RATE,
    CASE 
    WHEN GROWTH_RATE > 10 THEN 'HIGH'
    ELSE 'LOW'
    END AS STATUS
    FROM salary_growth;

| EMP_NAME | FUTURE | ROUNDED | GROWTH_RATE | STATUS |
| -------- | ------ | -------- | ----------- | ------ |
| KARTHIK  | 101193 | 101193   | 10.5        | HIGH |
| VEENA    | 95506  | 95507    | 8.0         | LOW |
| RAVI     | 106625 | 106625   | 12.0        | HIGH |

---

**Query #26**

    SELECT 
    LOWER(EMP_NAME) AS EMP_NAME,
    REVERSE(SALARY) AS REV,
    CASE WHEN SALARY = REVERSE(SALARY) THEN 'YES' ELSE 'NO' END AS STATUS
    FROM salary_symmetry;

| EMP_NAME | REV | STATUS |
| -------- | --- | ------ |
| ravi | 7557 | YES |
| veena | 6056 | NO |
| anil | 3217 | NO |

---

**Query #27**

    SELECT 
    CONCAT(UPPER(LEFT(EMP_NAME,1)),LOWER(SUBSTRING(EMP_NAME,2))) AS EMP_NAME,
    CASE WHEN YEAR(PAYMENT_DATE)%4=0 THEN 'LEAP' ELSE 'NORMAL' END
    FROM leap_salary;

| EMP_NAME | STATUS |
| -------- | ------ |
| Ravi | LEAP |
| Veena | NORMAL |
| Anil | LEAP |

---

**Query #28**

    SELECT 
    UPPER(EMP_NAME),
    DATEDIFF(ACTUAL_CREDIT,EXPECTED_CREDIT),
    CASE WHEN DATEDIFF > 5 THEN 'SEVERE' ELSE 'OK' END
    FROM salary_credit_audit;

| EMP_NAME | DATEDIFF | STATUS |
| -------- | -------- | ------ |
| RAVI | 2 | OK |
| VEENA | 0 | OK |
| ANIL | 7 | SEVERE |

---

**Query #29**

    SELECT 
    UPPER(EMP_NAME),
    TIMESTAMPDIFF(YEAR,JOINING_DATE,CURRENT_DATE_CHECK),
    CASE WHEN TIMESTAMPDIFF(YEAR,JOINING_DATE,CURRENT_DATE_CHECK) > 10 THEN 'VETERAN' ELSE 'FRESHER' END
    FROM salary_time_drift;

| EMP_NAME | EXPERIENCE | STATUS |
| -------- | ---------- | ------ |
| KARTHIK | 7 | FRESHER |
| VEENA | 3 | FRESHER |
| RAVI | 10 | FRESHER |

---

**Query #30**

    SELECT 
    LOWER(EMP_NAME),
    ROUND(SALARY),
    CASE WHEN MOD(ROUND(SALARY),10)=0 THEN 'MATCH' ELSE 'NO MATCH' END
    FROM digit_audit;

| EMP_NAME | SALARY | STATUS |
| -------- | ------ | ------ |
| karthik | 75001 | NO MATCH |
| veena | 65007 | NO MATCH |
| ravi | 85009 | NO MATCH |
