# Creating Views and Tables

1.   Creating and Using a View to Provide Consolidated Information
a.   Create a view named work.T_Shirts containing the following columns:
•	Product_ID
•	Supplier_Name (formatted as $20.)
•	Product_Name
•	Price (Label it Retail Price.)
Use data from the following tables: (Columns of interest are in parentheses.)
•	orion.Product_Dim (Product_ID, Product_Name, Supplier_Name)
•	orion.Price_list (Product_ID, Unit_Sales_Price)
Select only those records where Product_Name includes the word T-Shirt.

b.   Write a query to display the data from your new work.T_Shirts view. Sort the report by Supplier_Name and Product_ID. Supply a useful title.
c.   Write a query using your new work.T_Shirts view to display Product_ID, Product_Name, and Price for all T-shirts priced less than $20.00. Sort the report by price. Supply a useful title.
2.   Creating and Using a View That Updates Itself over Time
a.   Create a view named work.Current_Catalog. The view must contain all of the columns in orion.Product_dim and a new column named Price (labeled Current Retail Price). Use data found in the following tables:
•	orion.Product_dim
•	orion.Price_list
The value of the current price (Price) is determined by multiplying the original Unit_Sales_Price times the number of years since the product was first offered times the inflation Factor. Calculate the number of years that a product was offered by subtracting the year in which the product was first offered from the current year. The inflation Factor is a percentage of the original price. The formula is shown below:
Price=Unit_Sales_Price *
      (Factor**(year(Today())-year(Start_Date)))
Round the calculated Price to the nearest cent.
b.   Write a query to display Supplier_Name, Product_Name, and Price from your new work.Current_Catalog view for products with “Roller Skate” in the product name.  Sort the output by supplier name and price. Supply a useful title for your report.  If the current year is later than 2009 your results will differ, as prices will have increased.
c.   Write a query to display Product_Name, original Unit_Sales_Price (former Price), current Price, and the amount of Increase (calculated as Price  Unit_Sales_Price) for all products having an increase greater than $5.00. Sort the report by decreasing Increase. Supply a useful title. If the current year is later than 2009 your results will differ, as prices will have increased.

3.   Creating a Table and Adding Data Using a Query
a.   Create a table containing the following columns and name it work.Employees:
•	Employee_ID
•	Hire_Date
•	Salary
•	Birth_Date
•	Gender
•	Country
•	City
Format all date columns with MMDDYYYY10. and Salary with COMMA10.2. Only include current employees (rows where Employee_Term_Date is missing). Order the output by year (Employee_Hire_Date) and then by descending Salary. The data that you need can be obtained from these tables:
•	orion.Employee_Addresses
•	orion.Employee_Payroll
Column Sourcing Information
Employees	Employee_Addresses	orion.Employee_Payroll
Employee_ID	Employee_ID	Employee_ID
Hire_Date	-	Employee_Hire_Date
Salary	-	Salary
Birth_Date	-	Birth_Date
Gender	-	Employee_Gender
Country	Country	-
City	City	-
b.   Query the new table work.Employees to list all female employees whose salary is greater than $75,000.
4.   Creating a Table and Inserting Data Using a Complex Query
Create a table named Direct_Compensation in the Work library. The table should contain the following information for all non-managerial Sales staff (those with a level listed in their titles), formatted as indicated:

Employee_ID	
Name	
Level	
Salary	
Commission	Direct_
Compensation
12345	First Last	(I, II, III or IV)	12,345.00 	1,234.00 	13,579.00
•	Sales information is available in orion.Order_fact.
•	The table orion.Sales contains Employee_ID, First_Name, Last_Name, Job_Title, and Salary information for all Sales staff.
•	Job_Title contains level information for each employee.
•	To calculate Commission, add the Total_Retail_Price values for all sales made by an employee with an Order_Date in 2007, and take 15% of that total value as commission.
•	To calculate Direct_Compensation, add Commission plus Salary.
Add a query to list all of the data in the work.direct_compensation table.

![image](https://user-images.githubusercontent.com/101452475/230448433-14b4f575-9bbf-43b3-bc3b-e4bf206842de.png)
