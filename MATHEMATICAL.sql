CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(10),
    Customer_Name VARCHAR(100),
    Product_Category VARCHAR(100),
    Product_Name VARCHAR(150),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Payment_Mode VARCHAR(50),
    Store_Location VARCHAR(100)
);

INSERT INTO Orders
(Order_ID, Order_Date, Customer_ID, Customer_Name, Product_Category, Product_Name, Quantity, Unit_Price, Payment_Mode, Store_Location)
VALUES
(1001, '2026-02-01', 'C001', 'Ravi Kumar', 'Electronics', 'Wireless Mouse', 2, 799, 'UPI', 'Bangalore'),

(1002, '2026-02-02', 'C002', 'Sneha Reddy', 'Grocery', 'Basmati Rice 5kg', 1, 650, 'Credit Card', 'Hyderabad'),

(1003, '2026-02-03', 'C003', 'Arjun Mehta', 'Fashion', 'Men''s T-Shirt', 3, 499, 'Cash', 'Chennai'),

(1004, '2026-02-04', 'C004', 'Priya Sharma', 'Electronics', 'Bluetooth Speaker', 1, 1499, 'Debit Card', 'Mumbai'),

(1005, '2026-02-05', 'C005', 'Kiran Rao', 'Home & Kitchen', 'Mixer Grinder', 1, 2499, 'UPI', 'Bangalore'),

(1006, '2026-02-06', 'C006', 'Neha Verma', 'Beauty', 'Face Cream', 4, 299, 'Credit Card', 'Delhi'),

(1007, '2026-02-07', 'C007', 'Rahul Das', 'Grocery', 'Cooking Oil 1L', 5, 180, 'Cash', 'Kolkata'),

(1008, '2026-02-08', 'C008', 'Anjali Nair', 'Fashion', 'Women''s Jeans', 2, 1199, 'UPI', 'Kochi'),

(1009, '2026-02-09', 'C009', 'Suresh Patel', 'Electronics', 'Smartphone', 1, 15999, 'Debit Card', 'Ahmedabad'),

(1010, '2026-02-10', 'C010', 'Meena Iyer', 'Home & Kitchen', 'Pressure Cooker', 1, 1899, 'Credit Card', 'Pune');

-- 1. Find sine value of an angle.
Select ceil(sin(90)) from dual;

-- 2. Find cosine value of an angle.
Select ceil(cos(90)) from dual;

-- 3. Find tangent value.
select round(tan(90),2) from dual;

-- 4. Convert degrees to radians.
SELECT round(90 * (ACOS(-1) / 180),2) AS radians FROM dual;

-- 5. Convert radians to degrees.
Select round(1.57*(180/ACOS(-1)),2) as Degree from dual;

-- 6. Find logarithm (base 10) of a number.
SELECT LOG(10, 100) AS log_result FROM dual;

-- 7. Find natural log of a number.
SELECT round(LN(20),4) AS natural_log FROM dual;


-- 8. Find square of a number.
select power(10,2) as square_num from dual;

-- 9. Find cube of a number.
select power(10,3) as square_num from dual;

-- 11. Find greatest value among three numbers.
Select greatest(12,45,78,98,54) as greatest_num from dual;

-- 12. Find least value among three numbers.
select least(12,45,78,98,54) as least_value from dual;

-- 13. Calculate variance of sales.
Select VARIANCE ( Unit_price*QUANTITY) from orders;

-- 14. Calculate standard deviation of sales.
Select STDDEV(unit_price) from ORDERS;

-- 15. Find average deviation.
 SELECT AVG(ABS(UNIT_PRICE - (SELECT AVG(UNIT_PRICE) FROM ORDERS))) FROM ORDERS;

-- 18. Find sum of squares.
Select sum(power(unit_price,2)) from ORDERS;

-- 19. Calculate correlation between two columns.
Select corr(UNIT_PRICE,QUANTITY) from ORDERS;

-- 20. Calculate regression slope.
Select regr_slope(UNIT_PRICE,QUANTITY) from orders;