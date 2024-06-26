CREATE PROCEDURE GetMaxQuantity()
	SELECT MAX(Orders.Quantity) AS "Max Quantity in Order"
	FROM Orders;


PREPARE GetOrderDetail FROM
'SELECT OrderID, Quantity, Orders.BillAmount AS Cost FROM Customers
INNER JOIN Bookings ON Bookings.CustomerID = Customers.CustomerID
INNER JOIN Orders ON Orders.BookingID = Bookings.BookingID
WHERE Customers.CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;


DELIMITER //

CREATE PROCEDURE CancelOrder( IN order_id INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = order_id;
    SELECT CONCAT( 'Order ', order_id, ' is cancelled' ) AS Confirmation;
END//

DELIMITER ;
