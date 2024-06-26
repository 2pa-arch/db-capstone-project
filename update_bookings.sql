START TRANSACTION;

UPDATE Bookings
SET BookingSlot = '2022-10-10', 
    CustomerID = 1, 
    TableNo = 5
WHERE BookingID = 1;

UPDATE Bookings
SET BookingSlot = '2022-11-12', 
    CustomerID = 3, 
    TableNo = 3
WHERE BookingID = 2;

UPDATE Bookings
SET BookingSlot = '2022-10-11', 
    CustomerID = 2, 
    TableNo = 2
WHERE BookingID = 3;

UPDATE Bookings
SET BookingSlot = '2022-10-13', 
    CustomerID = 1, 
    TableNo = 2
WHERE BookingID = 4;

SELECT * FROM Bookings;

COMMIT;

 -- ROLLBACK;

