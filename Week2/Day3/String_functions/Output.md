**Query #1**

    SELECT FULL_NAME , LENGTH(FULL_NAME) 
    , CHAR_LENGTH(FULL_NAME) 
    FROM employees;

| FULL_NAME       | LENGTH(FULL_NAME) | CHAR_LENGTH(FULL_NAME) |
| --------------- | ----------------- | ---------------------- |
| Karthik Kondpak | 15                | 15                     |
| Veena Reddy     | 11                | 11                     |
| Ravi kumar      | 10                | 10                     |
| Anil            | 4                 | 4                      |
|  Suresh         | 8                 | 8                      |

---
**Query #2**

    SELECT UPPER(FULL_NAME) AS FULL_NAME ,
    LOWER(FULL_NAME) AS FULL_NAME
    FROM employees;

| FULL_NAME       | FULL_NAME       |
| --------------- | --------------- |
| KARTHIK KONDPAK | karthik kondpak |
| VEENA REDDY     | veena reddy     |
| RAVI KUMAR      | ravi kumar      |
| ANIL            | anil            |
|  SURESH         |  suresh         |

---
**Query #3**

    SELECT FULL_NAME ,
    TRIM(FULL_NAME),
    LTRIM(FULL_NAME) ,
    RTRIM(FULL_NAME) 
    FROM employees;

| FULL_NAME       | TRIM(FULL_NAME) | LTRIM(FULL_NAME) | RTRIM(FULL_NAME) |
| --------------- | --------------- | ---------------- | ---------------- |
| Karthik Kondpak | Karthik Kondpak | Karthik Kondpak  | Karthik Kondpak  |
| Veena Reddy     | Veena Reddy     | Veena Reddy      | Veena Reddy      |
| Ravi kumar      | Ravi kumar      | Ravi kumar       | Ravi kumar       |
| Anil            | Anil            | Anil             | Anil             |
|  Suresh         | Suresh          | Suresh           |  Suresh          |

---
**Query #4**

    SELECT 
    CONCAT(
      UPPER(LEFT(FULL_NAME,1)),
      LOWER(SUBSTRING(FULL_NAME,2))
      ) AS FULL_NAME,
    CONCAT(FULL_NAME , '-' , DEPARTMENT) AS EMP_DETAILS_1
    FROM employees;

| FULL_NAME       | EMP_DETAILS_1                    |
| --------------- | -------------------------------- |
| Karthik kondpak | Karthik Kondpak-Data Engineering |
| Veena reddy     | Veena Reddy-Analytics            |
| Ravi kumar      | Ravi kumar-Data Science          |
| Anil            | Anil-DEVOPS                      |
|  suresh         |  Suresh -data engineering        |

---
**Query #5**

    SELECT CONCAT_WS('|' , EMP_ID , FULL_NAME,CITY) AS EMP_DETAILS_2
    FROM employees;

| EMP_DETAILS_2               |
| --------------------------- |
| 1|Karthik Kondpak|Hyderabad |
| 2|Veena Reddy|Bangalore     |
| 3|Ravi kumar|Chennai        |
| 4|Anil|Pune                 |
| 5| Suresh | hyderabad       |

---
**Query #6**

    SELECT EMAIL,
    SUBSTRING_INDEX(email,'@', -1 ) AS EMAIL_DOMAIN,
    SUBSTRING_INDEX(email, '@' , 1) AS username,
    SUBSTRING(FULL_NAME , 2, 1 ) AS sec_char
    FROM employees;

| EMAIL               | EMAIL_DOMAIN | username   | sec_char |
| ------------------- | ------------ | ---------- | -------- |
| karthik.k@gmail.com | gmail.com    | karthik.k  | a        |
| veena_r@company.com | company.com  | veena_r    | e        |
| ravi.kumar@org.in   | org.in       | ravi.kumar | a        |
| anil@abc.com        | abc.com      | anil       | n        |
| suresh@xyz.com      | xyz.com      | suresh     | S        |

---
**Query #7**

    SELECT FULL_NAME,
    LEFT(FULL_NAME,1) ,
    RIGHT(FULL_NAME,8)
    FROM employees;

| FULL_NAME       | LEFT(FULL_NAME,1) | RIGHT(FULL_NAME,8) |
| --------------- | ----------------- | ------------------ |
| Karthik Kondpak | K                 |  Kondpak           |
| Veena Reddy     | V                 | na Reddy           |
| Ravi kumar      | R                 | vi kumar           |
| Anil            | A                 | Anil               |
|  Suresh         |                   |  Suresh            |

---
**Query #8**

    SELECT EMAIL ,
    INSTR(EMAIL , '@') 
    FROM employees;

| EMAIL               | INSTR(EMAIL , '@') |
| ------------------- | ------------------ |
| karthik.k@gmail.com | 10                 |
| veena_r@company.com | 8                  |
| ravi.kumar@org.in   | 11                 |
| anil@abc.com        | 5                  |
| suresh@xyz.com      | 7                  |

---
**Query #9**

    SELECT EMAIL ,
    LOCATE( '.' , EMAIL)
    FROM employees;

| EMAIL               | LOCATE( '.' , EMAIL) |
| ------------------- | -------------------- |
| karthik.k@gmail.com | 8                    |
| veena_r@company.com | 16                   |
| ravi.kumar@org.in   | 5                    |
| anil@abc.com        | 9                    |
| suresh@xyz.com      | 11                   |

---
**Query #10**

    SELECT FULL_NAME , 
    REPLACE(FULL_NAME , 'a' ,'*') AS REPLACED_NAME
    FROM employees;

| FULL_NAME       | REPLACED_NAME   |
| --------------- | --------------- |
| Karthik Kondpak | K*rthik Kondp*k |
| Veena Reddy     | Veen* Reddy     |
| Ravi kumar      | R*vi kum*r      |
| Anil            | Anil            |
|  Suresh         |  Suresh         |

---
**Query #11**

    SELECT 
    FULL_NAME ,
    REVERSE(FULL_NAME) AS REV_FULLNAME
    FROM employees;

| FULL_NAME       | REV_FULLNAME    |
| --------------- | --------------- |
| Karthik Kondpak | kapdnoK kihtraK |
| Veena Reddy     | yddeR aneeV     |
| Ravi kumar      | ramuk ivaR      |
| Anil            | linA            |
|  Suresh         |  hseruS         |

---
**Query #12**

    SELECT FULL_NAME,
    LPAD(FULL_NAME , 15, '*') ,
    RPAD(FULL_NAME , 15 , '*')
    FROM employees;

| FULL_NAME       | LPAD(FULL_NAME , 15, '*') | RPAD(FULL_NAME , 15 , '*') |
| --------------- | ------------------------- | -------------------------- |
| Karthik Kondpak | Karthik Kondpak           | Karthik Kondpak            |
| Veena Reddy     | ****Veena Reddy           | Veena Reddy****            |
| Ravi kumar      | *****Ravi kumar           | Ravi kumar*****            |
| Anil            | ***********Anil           | Anil***********            |
|  Suresh         | ******* Suresh            |  Suresh *******            |

---
**Query #13**

    SELECT CITY ,
    TRIM(REPLACE(CITY ,' ','*'))
    FROM employees;

| CITY        | TRIM(REPLACE(CITY ,' ','*')) |
| ----------- | ---------------------------- |
| Hyderabad   | Hyderabad                    |
| Bangalore   | Bangalore                    |
| Chennai     | Chennai                      |
| Pune        | Pune                         |
|  hyderabad  | *hyderabad*                  |

---
**Query #14**

    SELECT FULL_NAME , REMARKS ,IFNULL(NULLIF(REMARKS ,' ') , 'NO REMARKS') AS REMARKS
    FROM employees;

| FULL_NAME       | REMARKS                 | REMARKS                 |
| --------------- | ----------------------- | ----------------------- |
| Karthik Kondpak |  Top performer          |  Top performer          |
| Veena Reddy     | Excellent communication | Excellent communication |
| Ravi kumar      | Needs improvement       | Needs improvement       |
| Anil            |                         | NO REMARKS              |
|  Suresh         |                         | NO REMARKS              |

---
**Query #15**

    SELECT FULL_NAME ,REMARKS , COALESCE(REMARKS , 'N/A') AS REMARKS
    FROM employees;

| FULL_NAME       | REMARKS                 | REMARKS                 |
| --------------- | ----------------------- | ----------------------- |
| Karthik Kondpak |  Top performer          |  Top performer          |
| Veena Reddy     | Excellent communication | Excellent communication |
| Ravi kumar      | Needs improvement       | Needs improvement       |
| Anil            |                         | N/A                     |
|  Suresh         |                         |                         |

---
**Query #16**

    SELECT 
    FIND_IN_SET('Analytics' , 'Data,Analytics,AI') AS SEARCH ;

| SEARCH |
| ------ |
| 2      |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/5)
