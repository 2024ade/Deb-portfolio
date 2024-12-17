---CREATE a Database called Sql_Beginner_Class_Project
CREATE Database Sql_Beginner_class_Project;

---CREATE a table Called Cyclist_product
CREATE TABLE Cyclist_product(
Product_id INT PRIMARY KEY,
Product_name VARCHAR(255) NOT NULL
);


---Create a table called Cyclist_customer_behaviour
CREATE TABLE Cyclist_customer_behaviour(
Customer_id INT PRIMARY KEY,
Customer_name VARCHAR(255) NOT NULL,
Phone_number BIGINT NOT NULL,
Email_address VARCHAR(255) UNIQUE,
Product_id INT NOT NULL,
FOREIGN KEY (Product_id) REFERENCES Cyclist_product(Product_id)
);


---Inserting records to the Cyclist_product table
INSERT INTO
           Cyclist_product(Product_id,Product_name)
         VALUES
		       (1, 'SmartWatch'),
			   (2,' HandBrake'),
			   (3,'Brake'),
			   (4, 'Chainring'),
			   (5, 'Brakeshifter');
			   

---Inserting records to the Cyclist_customer_behaviour
INSERT INTO
           Cyclist_customer_behaviour(Customer_id,Customer_name,Phone_number,Email_address,Product_id)
        VALUES
		      (1, 'Janet Jones', 801234672, 'Jonesjanet@gmail.com', 2),
			  (2, 'Grace Michael', 902547815, 'MICHEALgrace@yahoo.com', 3),
			  (3, 'Alexandra Stephen', 706538915, 'alexstephen@gmail.com', 5),
			  (4, 'Helen Paul', 907652413, 'paulHELEN@outlook.com', 1),
			  (5, 'Faith Guy', 708625143, 'faithguy@gmail.com', 4);


---Adding a new column to the Cyclist_product table called Product_category
ALTER TABLE Cyclist_product
ADD Product_category VARCHAR(100);

---Count the number of each gender in the Sales_Customer_data 
SELECT
      gender,
	  COUNT(*) AS Total_number_of_each_Gender
FROM
    Sales_customer_data
GROUP BY 
       Gender;


---Retrive all records
SELECT
      *
FROM
    Sales_customer_data;


---Return the total number of sales for all shopping mall between '2021-01-01' and '2021-03-31' from the Sales_data
SELECT
     Shopping_mall,
	 SUM(quantity) AS Total_sales
FROM 
    Sales_data
WHERE
     invoice_date BETWEEN '2021-01-01' AND '2021-03-31'
GROUP BY 
       Shopping_mall
ORDER BY 
       Total_sales DESC;



---Retrieve all records from sales_data
SELECT
      *
FROM 
    Sales_data;


---Retrieving customer_id for customers that uses  Cevahair AVM, Forum Istanbul and Emaar square mall
SELECT DISTINCT
      Customer_id
FROM 
     Sales_data
WHERE 
     Shopping_mall IN  ('Cevahair AVM', 'Forum Istanbul','Emaar square mall');


---Retriving data that involve the following invoice_no,customer_id,gender,payment_method,category,price and shopping mall of customer between '2022-01-01'and '2022-03-31'
SELECT  TOP (20) 
      S.invoice_no,
	  S.category,
	  S.price,
	  S.shopping_mall,
	  C.customer_id,
	  C.gender,
	  C.payment_method
FROM Sales_Customer_data AS C
   INNER JOIN sales_data AS S
   ON   C.customer_id = S.customer_id
WHERE 
     Invoice_date BETWEEN '2022-01-01' AND '2022-03-31';


---Grouping invoice date into year 1,year 2 and year 3
SELECT
      invoice_date,
   CASE WHEN invoice_date BETWEEN '2021-01-01' AND '2021-12-31'
   THEN  'Year 1'
   WHEN invoice_date BETWEEN '2022-01-01' AND '2022-12-31'
   THEN 'Year 2'
   ELSE 'Year 3'
   END Grouped_invoice_date
FROM 
    sales_data;


     