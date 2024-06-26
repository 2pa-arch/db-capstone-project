CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, BillAmount AS Cost
FROM Orders
WHERE Quantity > 2;


CREATE VIEW GoodOrders AS
SELECT Customers.CustomerID AS CustomerID, CONCAT(Customers.FirstName, " ", Customers.LastName) AS FullName, Orders.OrderID AS OrderID, Orders.BillAmount AS Cost, Menus.Cuisine AS MenuName, MenuItems.Name AS CourseName
FROM Orders 
INNER JOIN Bookings ON Orders.BookingID = Bookings.BookingID
INNER JOIN Customers ON Customers.CustomerID = Bookings.CustomerID
INNER JOIN MenuItems ON MenuItems.ItemID = Orders.ItemID
INNER JOIN Menus ON MenuItems.MenuID = Menus.MenuID
WHERE Orders.BillAmount > 150.00 ORDER by Orders.BillAmount;


CREATE VIEW PopularMenus AS
SELECT Cuisine AS MenuName
FROM Menus
WHERE MenuID IN (
SELECT Menus.MenuID
FROM Orders INNER JOIN MenuItems ON MenuItems.ItemID = Orders.ItemID INNER JOIN Menus ON Menus.MenuID = MenuItems.MenuID GROUP BY Menus.MenuID HAVING COUNT(Menus.MenuID) > 2)
