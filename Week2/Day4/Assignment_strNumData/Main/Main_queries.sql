-- QUERY #1
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


-- QUERY #2
SELECT 
UPPER(customer_name) AS Customer_Name,
DATEDIFF(IFNULL(DELIVERY_DATE , CURDATE()),ORDER_DATE) AS delivery_days,
TRUNCATE(ORDER_AMOUNT ,1) AS truncated_amount, 
CASE 
WHEN DELIVERY_DATE IS NULL THEN 'PENDING'
WHEN DATEDIFF(DELIVERY_DATE,ORDER_DATE) = 0 THEN 'SAME-DAY'
WHEN DATEDIFF(DELIVERY_DATE,ORDER_DATE) > 3 THEN 'DELAYED'
ELSE 'NORMAL'
END AS delivery_status
FROM orders_delivery;


-- QUERY #3
SELECT 
CONCAT(
  UPPER(LEFT(cust_name , 1)),
  LOWER(SUBSTRING(cust_name , 2))
) AS customer_name, 
MONTHNAME(purchase_date) AS Purchase_month,
ROUND(PURCHASE_AMOUNT) AS rounded_amount,
ABS(PURCHASE_AMOUNT) AS absolute_amount, 
CASE 
WHEN purchase_amount > 15000 THEN 'High Spender'
WHEN purchase_amount BETWEEN 8000 AND 15000 THEN 'Medium'
ELSE 'Low Spender'
END AS Spending_type
FROM customer_spending;


-- QUERY #4
SELECT 
SUBSTRING_INDEX(USER_EMAIL , '@' ,-1) AS email_domain,
TIMESTAMPDIFF(MONTH , START_DATE , END_DATE) AS Duration, 
FORMAT(SUBSCRIPTION_FEE , 2) AS Formatted_fee,
DATEDIFF(END_DATE , CURDATE()) AS Remaining_days,
CASE 
WHEN END_DATE > CURDATE() THEN 'ACTIVE'
WHEN DATEDIFF(END_DATE,CURDATE()) <= 30 AND END_DATE>=CURDATE() THEN 'EXPIRING SOON'
ELSE 'EXPIRED'
END AS Subscription_Status
FROM subscriptions;


-- QUERY #5
SELECT 
UPPER(customer_name) AS customer_name,
ROUND((LOAN_AMOUNT * POWER((1 + INTEREST_RATE/100),1))/12) AS EMI,
TIMESTAMPDIFF(YEAR , LOAN_START ,CURDATE()) AS Years_since_loan,
CASE 
WHEN interest_rate > 9 THEN 'HIGH RISK'
WHEN interest_rate BETWEEN 7.5 AND 9 THEN 'MEDIUM RISK'
ELSE 'LOW RISK'
END AS Risk_category
FROM loan_details;


-- QUERY #6
SELECT 
LOWER(emp_name) AS emp_name,
ROUND((present_days/total_days)*100) AS Attendance_percentage,
MONTHNAME(RECORD_DATE) AS Month,
(TOTAL_DAYS - PRESENT_DAYS) AS Absent_days,
CASE
WHEN ((present_days/total_days)*100) >= 90 THEN 'Excellent'
WHEN ((present_days/total_days)*100) BETWEEN 75 AND 89 THEN 'Average'
ELSE 'Poor'
END AS attendance_status
FROM attendance;


-- QUERY #7
SELECT 
CONCAT(
  UPPER(LEFT(product_name,1)),
  LOWER(SUBSTRING(product_name,2))
) AS product_name,
(MRP - SELLING_PRICE) AS Discount_amount,
ROUND(((MRP - SELLING_PRICE)/MRP)*100,2) AS Discount_percentage,
DAYNAME(sale_date) AS Day,
CASE
WHEN selling_price < mrp THEN 'Valid Discount'
WHEN selling_price > mrp THEN 'Overpriced'
ELSE 'No Discount'
END AS discount_status
FROM product_sales;


-- QUERY #8
SELECT 
UPPER(HOLDER_NAME) AS holder_name,
TIMESTAMPDIFF(YEAR , POLICY_START , POLICY_END) AS Duration,
DATEDIFF(POLICY_END ,CURDATE()) AS Remaining_days,
ROUND(PREMIUM_AMOUNT) AS Rounded_premium,
CASE
WHEN policy_end < CURDATE() THEN 'Expired'
WHEN TIMESTAMPDIFF(YEAR,policy_start,policy_end) >= 3 THEN 'Long Term'
ELSE 'Mid Term'
END AS policy_status
FROM insurance_policies;


-- QUERY #9
SELECT 
LOWER(emp_name) AS emp_name,
TIMESTAMPDIFF(YEAR , LAST_HIKE , CURDATE()) AS Years_since_last_hike,
CASE
WHEN rating = 5 THEN current_salary * 0.20
WHEN rating = 4 THEN current_salary * 0.10
ELSE 0
END AS increment_amount,
ROUND(current_salary + 
CASE
WHEN rating = 5 THEN current_salary * 0.20
WHEN rating = 4 THEN current_salary * 0.10
ELSE 0
END) AS New_salary,
CASE
WHEN rating = 5 THEN 'High Increment'
WHEN rating = 4 THEN 'Moderate'
ELSE 'No Increment'
END AS increment_status
FROM salary_revision;


-- QUERY #10
SELECT 
CUSTOMER_NAME,
CONCAT(
  UPPER(LEFT(BRANCH ,1)),
  LOWER(SUBSTRING(BRANCH,2))
) AS BRANCH_NAME,
DATEDIFF(CURDATE() , LAST_TRANSACTION) AS Days_Last_Transaction,
ABS(balance) AS absolute_balance,
CASE
WHEN balance < 0 THEN 'Overdrawn'
WHEN DATEDIFF(CURDATE(), last_transaction) > 365 THEN 'Dormant'
ELSE 'Active'
END AS account_status
FROM bank_accounts;
