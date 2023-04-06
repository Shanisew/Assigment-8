libname Orion "/home/u61762417/my_shared_file_links/jhshows0/STA5067/SAS Data/orion";

/*a.   Create a view named work.T_Shirts containing the following columns:
•	Product_ID
•	Supplier_Name (formatted as $20.)
•	Product_Name
•	Price (Label it Retail Price.)
Use data from the following tables: (Columns of interest are in parentheses.)
•	orion.Product_Dim (Product_ID, Product_Name, Supplier_Name)
•	orion.Price_list (Product_ID, Unit_Sales_Price)
Select only those records where Product_Name includes the word T-Shirt. */

proc sql;
create view work.t_shirts as 
	select 
		a.product_Id,
		Supplier_Name,
		Product_name, 
		Unit_sales_price *(Factor*(Year(Today())-year(Start_date))) as Price

from orion.Product_dim as a, orion.price_list as b

where a.product_Id=b.product_Id and product_name="T-Shirt"
;
quit;
 proc contents data= work.t_shirts;


/*b.   Write a query to display the data from your new work.T_Shirts view. Sort the report by Supplier_Name and Product_ID. Supply a useful title. */

Proc sql;
Title "T Shirt Inventory";
select *
from work.t_shirts
order by supplier_name, Product_Id
;quit;



/*c.   Write a query using your new work.T_Shirts view to display Product_ID, Product_Name, and Price for all T-shirts priced less than $20.00. Sort the report by price. Supply a useful title. */

Proc sql;
Title "T Shirt Inventory";
select 
		product_Id,
		Product_Name, 
		Price
from work.t_shirts

where price <=20.
order by price
;
quit;



/*a.   Create a view named work.Current_Catalog. The view must contain all of the columns in orion.Product_dim and a new column named Price (labeled Current Retail Price). Use data found in the following tables:
•	orion.Product_dim
•	orion.Price_list
The value of the current price (Price) is determined by multiplying the original Unit_Sales_Price times the number of years since the product was first offered times the inflation Factor. Calculate the number of years that a product was offered by subtracting the year in which the product was first offered from the current year. The inflation Factor is a percentage of the original price. The formula is shown below:
Price=Unit_Sales_Price *
      (Factor**(year(Today())-year(Start_Date)))
Round the calculated Price to the nearest cent. */

Proc sql;

create view work.current_catalog as 

	select a.*,
			b.Unit_sales_price *(Factor*(Year(Today())-year(Start_date))) as Price format=20.00
				
	from orion.Product_dim as a, orion.price_list as b
	
	where a.product_Id=b.product_Id
	
	
;
quit;

		


/*b.   Write a query to display Supplier_Name, Product_Name, and Price from your new work.Current_Catalog view for products with “Roller Skate” in the product name.  Sort the output by supplier name and price. Supply a useful title for your report.  If the current year is later than 2009 your results will differ, as prices will have increased. */


Title "Products with Roller Skate";
proc sql;

select 
	supplier_name,
	Product_name,
	Price 

from work.current_catalog

where product_name("Roller Skate")

order by Supplier_name, price

;quit;



/*c.   Write a query to display Product_Name, original Unit_Sales_Price (former Price), current Price, and the amount of Increase (calculated as Price  Unit_Sales_Price) for all products having an increase greater than $5.00. Sort the report by decreasing Increase. Supply a useful title. If the current year is later than 2009 your results will differ, as prices will have increased. */

Proc sql;

	select 
		Product_name,
		Oro












