    SHOW TABLES;

| Tables_in_test |
| -------------- |
| Cars           |
| Customers      |
| Owners         |
| Rentals        |

---

    SELECT * FROM Cars;

| car_id | car_name       | car_type | owner_id |
| ------ | -------------- | -------- | -------- |
| C1     | Toyota Corolla | Sedan    | O1       |
| C2     | Honda Civic    | Sedan    | O1       |
| C3     | Ford Explorer  | SUV      | O2       |

---

    SELECT * FROM Customers;

| customer_id | customer_name   | address      | phone_no   | email_id         |
| ----------- | --------------- | ------------ | ---------- | ---------------- |
| CU1         | Alice Brown     | Chicago Ave  | 9876543212 | alice@cust.com   |
| CU2         | Bob Smith       | Houston Road | 9876543213 | bob@cust.com     |
| CU3         | Charlie Johnson | Miami Blvd   | 9876543214 | charlie@cust.com |

---

    SELECT * FROM Owners;

| owner_id | owner_name  | address      | phone_no   | email_id       |
| -------- | ----------- | ------------ | ---------- | -------------- |
| O1       | John Carter | NY Street 10 | 9876543210 | john@cars.com  |
| O2       | Emily Davis | LA Street 5  | 9876543211 | emily@cars.com |

---

    SELECT * FROM Rentals;

| rental_id | customer_id | car_id | pickup_date | return_date | km_driven | fare_amount |
| --------- | ----------- | ------ | ----------- | ----------- | --------- | ----------- |
| R1        | CU1         | C1     | 2026-05-01  | 2026-05-05  | 500       | 250         |
| R2        | CU2         | C2     | 2026-05-02  | 2026-05-04  | 300       | 180         |
| R3        | CU1         | C3     | 2026-05-06  | 2026-05-08  | 400       | 300         |
| R4        | CU3         | C1     | 2026-05-07  | 2026-05-09  | 350       | 200         |

---
**Query #1**

    SELECT o.owner_id , o.owner_name , c.car_id , c.car_name 
    FROM Owners o 
    LEFT JOIN Cars c 
    ON o.owner_id = c.owner_id;

| owner_id | owner_name  | car_id | car_name       |
| -------- | ----------- | ------ | -------------- |
| O1       | John Carter | C1     | Toyota Corolla |
| O1       | John Carter | C2     | Honda Civic    |
| O2       | Emily Davis | C3     | Ford Explorer  |

---
**Query #2**

    Select r.rental_id  , c.customer_name, cr.car_name , cr.car_type , o.owner_name 
    FROM Rentals r 
    LEFT JOIN Customers c
    ON r.customer_id = c.customer_id
    LEFT JOIN Cars cr 
    ON r.car_id = cr.car_id 
    LEFT JOIN Owners o 
    ON cr.owner_id = o.owner_id;

| rental_id | customer_name   | car_name       | car_type | owner_name  |
| --------- | --------------- | -------------- | -------- | ----------- |
| R1        | Alice Brown     | Toyota Corolla | Sedan    | John Carter |
| R2        | Bob Smith       | Honda Civic    | Sedan    | John Carter |
| R3        | Alice Brown     | Ford Explorer  | SUV      | Emily Davis |
| R4        | Charlie Johnson | Toyota Corolla | Sedan    | John Carter |

---
**Query #3**

    SELECT r.rental_id,r.car_id,c.car_name,c.car_type,SUM(r.fare_amount) OVER (PARTITION BY r.car_id) AS total_fare,COUNT(r.rental_id) OVER (PARTITION BY r.car_id) AS total_rentals,AVG(r.fare_amount) OVER (PARTITION BY r.car_id) AS avg_fare_per_rental
    FROM Rentals r
    LEFT JOIN Cars c
      ON r.car_id = c.car_id;

| rental_id | car_id | car_name       | car_type | total_fare | total_rentals | avg_fare_per_rental |
| --------- | ------ | -------------- | -------- | ---------- | ------------- | ------------------- |
| R1        | C1     | Toyota Corolla | Sedan    | 450        | 2             | 225                 |
| R4        | C1     | Toyota Corolla | Sedan    | 450        | 2             | 225                 |
| R2        | C2     | Honda Civic    | Sedan    | 180        | 1             | 180                 |
| R3        | C3     | Ford Explorer  | SUV      | 300        | 1             | 300                 |

---
**Query #4**

    SELECT c.customer_name , COUNT(DISTINCT r.car_id) AS CARS_RENTED
    FROM Rentals r 
    LEFT JOIN Customers c
    ON r.customer_id = c.customer_id 
    GROUP BY c.customer_name 
    HAVING COUNT(DISTINCT r.car_id) > 1;

| customer_name | CARS_RENTED |
| ------------- | ----------- |
| Alice Brown   | 2           |

---
**Query #5**

    SELECT c.car_name , AVG(r.km_driven) AS AVG_KM 
    FROM Rentals r 
    LEFT JOIN Cars c 
    ON r.car_id = c.car_id
    GROUP BY c.car_name;

| car_name       | AVG_KM |
| -------------- | ------ |
| Toyota Corolla | 425.0  |
| Honda Civic    | 300.0  |
| Ford Explorer  | 400.0  |

---
