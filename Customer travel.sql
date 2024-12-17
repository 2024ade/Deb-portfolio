---Retrieve all information from our customer_data table
SELECT
      *
FROM
    Customer_data;


---Retrieve all information from the travel table
SELECT
      *
FROM
     travel;


---Retrieve the healthid column from the customer_data and the travelid from the travel table
SELECT
      Healthid AS health_and_travel_id
FROM
    Customer_data
UNION ALL
SELECT
      Travelid
FROM
    Travel;


---Retrieve recoreds about customer's travel policy and when it would end
SELECT
      c.CustomerID,
      c.Title,
      c.FirstName,
      c.MiddleInitial,
      c.Surname,
	  c.ComChannel,
      c.TravelID,
      t.PolicyEnd
FROM
    Customer_data AS c
INNER JOIN
           travel AS t
ON 
   c.TravelID = t.TravelID;


---Retrieve records of our customers with or without travel poliy and when their travel policy will end
SELECT
      c.CustomerID,
	  c.Title,
	  c.FirstName,
	  c.MiddleInitial,
	  c.Surname,
	  c.ComChannel,
	  c.TravelID,
	  t.policyStart
FROM
    Customer_data AS C
LEFT JOIN
         travel AS t
ON
   c.TravelID = t.TravelID
ORDER BY
       TravelID DESC;

---Case Statement
---Changing the null values in the occupation column to 'no occupation'
SELECT
     Occupation,
	 CASE WHEN occupation IS NULL
	 THEN 'No occupation'
	 ELSE Occupation
	 END New_occupation
FROM
    Customer_data;

---Changing the values in the gender column as follows:
---Male should be changed to 'M' and female should be change to 'f'
SELECT
      Gender,
	  CASE WHEN Gender ='Male'
	  THEN 'M'
	  WHEN Gender ='Female'
	  THEN 'F'
	  ELSE 'Neither m/f'
	  END New_gender_column
FROM
    Customer_data;


---Joining the title,firstname,middleinitial and surname column to form full names
SELECT
      Title,
	  firstname,
	  Middleinitial,
	  surname,
	  CONCAT(Title,' ',FirstName,' ','.',MiddleInitial,'.',' ',Surname) AS Full_name
FROM
    Customer_data;


---Joining the title,firstname,middleinitial and surname column to form full names
SELECT
      Title,
	  firstname,
	  Middleinitial,
	  surname,
	  CONCAT_WS(' ',title,firstname,middleinitial,surname) AS Full_name
FROM
    Customer_data;

---Substring
---Retrieve the first letter of our customer's first name
SELECT
      Firstname,
	  SUBSTRING(firstname,2,3) AS First_name_letter
FROM
    Customer_data;

---Confirming that all strings in the middle initial column is one
WITH middle_initial_cte AS(
SELECT
      Middleinitial,
	  LEN(Middleinitial) AS Middleinitial_length
FROM
    Customer_data
)
SELECT
      *
FROM
    middle_initial_cte
WHERE
     Middleinitial_length > 1;

---Changing the values in the gender column to capital letters using UPPER Function
SELECT
     Gender,
	 UPPER(gender) As CAPITAL_GENDER
FROM
    Customer_data;

---Changing the values in the location column to small letters using the lower function
SELECT
     Location,
	 LOWER(Location) AS lower_gender
FROM
    Customer_data;


---Checking my system time
SELECT
     SYSDATETIME() AS System_time;


---Add 2 years to the policystart column 
SELECT
      Policystart,
	  DATEADD(YY,2,policystart) AS '2_years-added'
FROM
     travel;

---Add 1 month to the policy start column 
SELECT
      Policystart,
	  DATEADD(MM,1,Policystart) AS '1_Month_added'
FROM
    travel;


---Datediff
---Year difference between policystart and policyend
SELECT
      Policystart,
	  Policyend,
	  DATEDIFF(YY,Policystart,Policyend) AS Year_Difference
FROM
    Travel;

