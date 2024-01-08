--- Displaying All Data from the Database ---
Select
	*
From
	pizza_sales;

-------------------------- KPI's REQUIREMENTS---------------------------------

--- Diplaying the Total Revenue of the Sales ---
Select
	SUM(total_price) As Total_Revenue
From
	pizza_sales


--- Displaying the Average Price Value With Respect to Order ---
Select
	SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value
From
	pizza_sales


--- Displaying the Total Quantity of the Pizza Sold ---
Select
	SUM(quantity) AS Total_Pizza_Sold
From
	pizza_sales


--- Diplaying the Total Orders Placed ---
Select
	COUNT(DISTINCT order_id) AS Total_orders
From
	pizza_sales


--- Diplaying the Average Pizza Per Order Placed ---
Select
	CAST(CAST(SUM(quantity) AS decimal(10,2)) / CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS decimal(10,2)) AS Avg_Pizza_Per_Order
From
	pizza_sales


-------------------------------CHART's REQUIREMENTS-------------------------------------

--- Displaying the Daily Trend for Total Orders --- 
Select
	DATENAME(DW, order_date) AS order_day,
	COUNT(DISTINCT order_id) AS Total_orders
From
	pizza_sales
Group By 
	DATENAME(DW, order_date)


--- Displaying the Month Trend for Total Orders ---
Select
	DATENAME(Month, order_date) AS Month_Name,
	COUNT(DISTINCT order_id) AS Total_orders
From
	pizza_sales
Group By 
	DATENAME(Month, order_date)
Order By
	Total_orders DESC


--- Displaying the Percentage of Sales By Pizza Category ---
Select 
	pizza_category, 
	SUM(total_price) AS Total_Sales, 
	SUM(total_price) * 100 / (Select SUM(total_price) from pizza_sales) As Total_Sales_Percentage
From
	pizza_sales
Group By
	pizza_category


--- Displaying the Percentage of Sales By Pizza Size
Select 
	pizza_size, 
	SUM(total_price) AS Total_Sales,
	CAST( SUM(total_price) * 100 / (Select SUM(total_price) from pizza_sales Where DATEPART(quarter, order_date) =1) As decimal(10,2)) As Total_Sales_Percentage
From
	pizza_sales
Where
	DATEPART(quarter, order_date) =1
Group By
	pizza_size
Order By Total_Sales_Percentage


---  Diplaying Top 5 Best Sellers By Revenue ---
Select TOP 5 
	pizza_name,
	SUM(total_price) AS Total_Revenue 
From
	pizza_sales
Group By
	pizza_name
Order By
	Total_Revenue DESC


---  Diplaying Bottom 5 Best Sellers By Revenue ---
Select TOP 5 
	pizza_name,
	SUM(total_price) AS Total_Revenue 
From
	pizza_sales
Group By
	pizza_name
Order By
	Total_Revenue 


---  Diplaying Top 5 Best Sellers By Quantity ---
Select TOP 5 
	pizza_name,
	SUM(quantity) AS Total_Quantity
From
	pizza_sales
Group By
	pizza_name
Order By
	Total_Quantity DESC 


---  Diplaying Bottom 5 Best Sellers By Quantity ---
Select TOP 5 
	pizza_name,
	SUM(quantity) AS Total_Quantity
From
	pizza_sales
Group By
	pizza_name
Order By
	Total_Quantity 


---  Diplaying Top 5 Best Sellers By Orders ---
Select TOP 5 
	pizza_name,
	COUNT(DISTINCT order_id) AS Total_Orders
From
	pizza_sales
Group By
	pizza_name
Order By
	Total_Orders DESC


---  Diplaying Bottom 5 Best Sellers By Orders ---
Select TOP 5 
	pizza_name,
	COUNT(DISTINCT order_id) AS Total_Orders
From
	pizza_sales
Group By
	pizza_name
Order By
	Total_Orders



-------------------------------------------------------------------------------------------------------------------------------------------