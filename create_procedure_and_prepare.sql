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

DELIMITER //

CREATE PROCEDURE CheckBooking(IN check_time DATETIME, IN check_table INT)
BEGIN
	IF (SELECT COUNT(*) FROM Bookings WHERE BookingSlot = check_time AND TableNo = check_table) = 0 THEN
        SELECT CONCAT("Table ", check_table, " is free") AS 'Booking Status';
    ELSE
        SELECT CONCAT("Table ", check_table, " is already blocked") AS 'Booking Status';
    END IF;
END //

DELIMITER ;


DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN check_time DATETIME, IN check_table INT, IN customer_id INT,IN employee_id INT )
BEGIN
    DECLARE booking_exists INT;

    SELECT COUNT(*) INTO booking_exists
    FROM Bookings
    WHERE BookingSlot = check_time AND TableNo = check_table;

    IF booking_exists = 0 THEN
        START TRANSACTION;
        
        INSERT INTO Bookings (BookingID, BookingSlot, TableNo, CustomerID, EmployeeID)
        VALUES ((SELECT MAX(Bookings.BookingID) FROM Bookings) + 1, check_time, check_table, customer_id, employee_id);
        
        SELECT CONCAT("Table ", check_table, " is free. Booking successful") AS 'Booking Status';
        COMMIT;
    ELSE
        SELECT CONCAT("Table ", check_table, " is already blocked. Booking cancelled") AS 'Booking Status';
    END IF;
END //

DELIMITER ;


-- call AddValidBooking("2022-11-12", 3, 2, 1);


DROP PROCEDURE IF EXISTS AddBooking;


DELIMITER // 

CREATE PROCEDURE AddBooking(IN booking_id INT, IN check_time DATETIME, IN check_table INT, IN customer_id INT,IN employee_id INT )
BEGIN
	 INSERT INTO Bookings (BookingID, BookingSlot, TableNo, CustomerID, EmployeeID)
        VALUES (booking_id, check_time, check_table, customer_id, employee_id);
	 SELECT "New booking added" AS Confirmation;
END //

DELIMITER ;

-- call AddBooking(6, "2022-11-12", 3, 2, 1);

DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //

CREATE PROCEDURE UpdateBooking(IN bookingid INT, IN new_date DATETIME)
BEGIN
	UPDATE Bookings SET BookingSlot = new_date
    WHERE BookingID = bookingid;
    SELECT CONCAT("Booking ", bookingid, " updated") AS Confirmation;
END //

DELIMITER ;

-- CALL UpdateBooking(2, "2022-11-17");

DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //

CREATE PROCEDURE CancelBooking(IN bookingid INT)
BEGIN

	DELETE FROM Bookings
    WHERE BookingID = bookingid;
    SELECT CONCAT("Booking ", bookingid, " cancelled") AS Confirmation;
END //

DELIMITER ;

-- CALL CancelBooking(6);
