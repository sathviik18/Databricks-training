**Query #1**

    SELECT 
    CONCAT(UPPER(LEFT(emp_name , 1)), 
           LOWER(SUBSTRING(emp_name , 2)))
           AS Employee_name , 
     ROUND(BONUS + IFNULL(bonus , 0)) AS TOTAL_INCOME,
     YEAR(joining_date) AS Joining_year , 
     CASE 
     WHEN TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) > 7
     THEN 'Senior'
     WHEN TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) BETWEEN 4 AND 7
     THEN 'Mid'
     ELSE 'Junior'
     END AS Employee_levl
     FROM employee_payments;

| Employee_name | TOTAL_INCOME | Joining_year | Employee_levl |
| ------------- | ------------ | ------------ | ------------- |
| Karthik       | 10001        | 2019         | Mid           |
| Veena         | 8001         | 2021         | Mid           |
| Ravi          | 12002        | 2016         | Senior        |
| Anil          |              | 2020         | Mid           |
| Suresh        | 6001         | 2022         | Junior        |

---

**Query #2**

    SELECT 
    UPPER(customer_name) AS Customer_Name,
    DATEDIFF(
      IFNULL(DELIVERY_DATE , CURDATE()),ORDER_DATE)
      AS delivery_days,
    TRUNCATE(ORDER_AMOUNT ,1) AS truncated_amount, 
    CASE 
    WHEN DELIVERy_DATE IS NULL 
    THEN 'PENDING'
    WHEN DATEDIFF(DELIVERY_DATE,ORDER_DATE) = 0 
    THEN 'SAME-DAY'
    WHEN DATEDIFF(DELIVERY_DATE,ORDER_DATE)> 3
    THEN 'DELAYED'
    ELSE 'NORMAL'
    END AS delivery_status
    FROM orders_delivery;

| Customer_Name | delivery_days | truncated_amount | delivery_status |
| ------------- | ------------- | ---------------- | --------------- |
| RAJESH        | 4             | 12500.7          | DELAYED         |
| MEENA         | 0             | 8400.4           | SAME-DAY        |
| ARUN          | 5             | 15600.9          | DELAYED         |
| POOJA         | 483           | 9200.1           | PENDING         |

---

**Query #3**

    SELECT 
    CONCAT(
      UPPER(LEFT(cust_name , 1)),
      LOWER(SUBSTRING(cust_name , 2))
      ) AS customer_name, 
    MONTHNAME(purchase_date) AS Purchase_month,
    ROUND(PURCHASE_AMOUNT) AS rouded_amount,
    ABS(PURCHASE_AMOUNT) AS absolute_amount, 
    CASE 
    WHEN purchase_amount > 15000
    THEN 'High Spender'
    WHEN PURCHASE_AMOUNT BETWEEN 8000 AND 15000
    THEN 'Medium'
    ELSE 'Low Spender'
    END AS Spending_type
    FROM customer_spending;

| customer_name | Purchase_month | rouded_amount | absolute_amount | Spending_type |
| ------------- | -------------- | ------------- | --------------- | ------------- |
| Amit          | December       | 12001         | 12000.75        | Medium        |
| Neha          | December       | 8500          | 8500.4          | Medium        |
| Rohit         | November       | 15501         | 15500.9         | High Spender  |
| Kavya         | October        | 6000          | 6000.1          | Low Spender   |

---

**Query #4**

    SELECT 
    SUBSTRING_INDEX(USER_EMAIL , '@' ,-1) AS email_domain,
    TIMESTAMPDIFF( MONTH , START_DATE , END_DATE) AS Duration, 
    FORMAT(SUBSCRIPTION_FEE , 2) AS Formatted_fee,
    DATEDIFF(END_DATE , CURDATE()) AS Remaining_days,
    CASE 
    WHEN END_DATE > CURDATE()
    THEN 'ACTIVE'
    WHEN DATEDIFF(END_DATE,CURDATE()) <= 30 AND END_DATE>=CURDATE()
    THEN 'EXPIRING SOON'
    ELSE 'EXPIRED'
    END AS Subscription_Status
    FROM subscriptions;

| email_domain | Duration | Formatted_fee | Remaining_days | Subscription_Status |
| ------------ | -------- | ------------- | -------------- | ------------------- |
| gmail.com    | 12       | 12,000.50     | -500           | EXPIRED             |
| yahoo.com    | 6        | 8,500.75      | -517           | EXPIRED             |
| hotmail.com  | 12       | 15,000.90     | -806           | EXPIRED             |

---

**Query #5**

    SELECT UPPER(customer_name) AS customer_name ,
    ROUND(
     (LOAN_AMOUNT * POWER((1 + INTEREST_RATE/100),1))/12
    ) AS EMI,
    TIMESTAMPDIFF(YEAR , LOAN_START ,CURDATE()) AS Years_since_loan,
    CASE 
    WHEN interest_rate > 9
    THEN 'HIGH RISK'
    WHEN INTEREST_RATE BETWEEN 7.5 AND 9
    THEN 'MEDIUM RISK'
    ELSE 'LOW RISK'
    END AS Risk_category
    FROM loan_details;

| customer_name | EMI   | Years_since_loan | Risk_category |
| ------------- | ----- | ---------------- | ------------- |
| SURESH        | 45208 | 4                | MEDIUM RISK   |
| MAHESH        | 68250 | 4                | HIGH RISK     |
| ANITA         | 26950 | 2                | MEDIUM RISK   |

---

**Query #6**

    SELECT 
    LOWER(emp_name) AS emp_name,
    ROUND(
      (present_days/total_days)*100) AS Attendance_percentage,
      MONTHNAME(RECORD_DATE) AS Month,
      (TOTAL_DAYS - PRESENT_DAYS) AS Absent_days,
    CASE
    WHEN ((present_days/total_days)*100) >= 90
    THEN 'Excellent'
    WHEN ((present_days/total_days)*100)
    BETWEEN 75 AND 89
    THEN 'Average'
    ELSE 'Poor'
    END AS attendance_status
    FROM attendance;

| emp_name | Attendance_percentage | Month   | Absent_days | attendance_status |
| -------- | --------------------- | ------- | ----------- | ----------------- |
| karthik  | 93                    | January | 2           | Excellent         |
| veena    | 73                    | January | 8           | Poor              |
| ravi     | 60                    | January | 12          | Poor              |

---

**Query #7**

    SELECT 
    CONCAT(
      UPPER(LEFT(product_name,1)),
      LOWER(SUBSTRING(PRODUCT_NAME ,2))
      ) AS product_name,
    (MRP - SELLING_PRICE) AS Discount_amount,
    ROUND(
      ((MRP - SELLING_PRICE)/MRP)*100,2) 
      AS Discount_percentage,
    DAYNAME(sale_date) AS Day,
    CASE
    WHEN selling_price < mrp
    THEN 'Valid Discount'
    WHEN selling_price > mrp
    THEN 'Overpriced'
    ELSE 'No Discount'
    END AS discount_status
    FROM product_sales;

| product_name | Discount_amount | Discount_percentage | Day       | discount_status |
| ------------ | --------------- | ------------------- | --------- | --------------- |
| Laptop       | 7000.25         | 9.33                | Friday    | Valid Discount  |
| Mobile       | 2000.15         | 5.71                | Sunday    | Valid Discount  |
| Tablet       | -999.85         | -4.0                | Wednesday | Overpriced      |

---

**Query #8**

    SELECT 
    UPPER(HOLDER_NAME) AS holder_name,
    TIMESTAMPDIFF(YEAR , POLICY_START , POLICY_END) AS Duration,
    DATEDIFF(POLICY_END ,CURDATE()) AS Remaining_days,
    ROUND(PREMIUM_AMOUNT) AS Rounded_premium,
    CASE
    WHEN policy_end < CURDATE()
    THEN 'Expired'
    WHEN TIMESTAMPDIFF(
    YEAR,
    policy_start,
    policy_end
    ) >= 3
    THEN 'Long Term'
    ELSE 'Mid Term'
    END AS policy_status
    FROM insurance_policies;

| holder_name | Duration | Remaining_days | Rounded_premium | policy_status |
| ----------- | -------- | -------------- | --------------- | ------------- |
| ARJUN       | 3        | -135           | 12001           | Expired       |
| MEGHA       | 3        | -335           | 8501            | Expired       |
| VINOD       | 3        | -806           | 15001           | Expired       |

---

**Query #9**

    SELECT 
    LOWER(EMP_NAME) AS emp_name,
    TIMESTAMPDIFF(YEAR , LAST_HIKE , CURDATE()) AS Years_since_last_hike,
    CASE
    WHEN rating = 5
    THEN current_salary * 0.20
    WHEN rating = 4
    THEN current_salary * 0.10
    ELSE 0
    END AS increment_amount,
    ROUND(current_salary + 
    CASE
    WHEN rating = 5
    THEN current_salary * 0.20
    WHEN rating = 4
    THEN current_salary * 0.10
    ELSE 0
    END 
    ) AS New_salary,
    CASE
    WHEN rating = 5
    THEN 'High Increment'
    WHEN rating = 4
    THEN 'Moderate'
    ELSE 'No Increment'
    END AS increment_status
    FROM salary_revision;

| emp_name | Years_since_last_hike | increment_amount | New_salary | increment_status |
| -------- | --------------------- | ---------------- | ---------- | ---------------- |
| karthik  | 3                     | 15000.15         | 90001      | High Increment   |
| veena    | 2                     | 6500.04          | 71500      | Moderate         |
| ravi     | 4                     | 0                | 85001      | No Increment     |

---

**Query #10**

    SELECT CUSTOMER_NAME ,
    CONCAT(
      UPPER(LEFT(BRANCH ,1)),
      LOWER(SUBSTRING(BRANCH,2))
      )AS BRANCH_NAME,
    DATEDIFF(CURDATE() , LAST_TRANSACTION) AS Days_Last_Transaction,
    ABS(balance) AS absolute_balance,
    CASE
    
    WHEN balance < 0
    THEN 'Overdrawn'
    
    WHEN DATEDIFF(
    CURDATE(),
    last_transaction
    ) > 365
    THEN 'Dormant'
    
    ELSE 'Active'
    
    END AS account_status
    
    FROM bank_accounts;

| CUSTOMER_NAME | BRANCH_NAME | Days_Last_Transaction | absolute_balance | account_status |
| ------------- | ----------- | --------------------- | ---------------- | -------------- |
| ramesh        | Hyderabad   | 512                   | 125000.75        | Dormant        |
| sita          | Delhi       | 1066                  | 8500.4           | Dormant        |
| manoj         | Mumbai      | 496                   | 2500.9           | Overdrawn      |

---
