-- Заповнення таблиці Employees
INSERT INTO `LittleLemonDB`.`Employees` (`EmployeeID`, `FirstName`, `Role`, `Address`, `Contact_Number`, `Email`, `Annual_Salary`, `LastName`)
VALUES 
(1, 'John', 'Manager', '123 Main St', '1234567890', 'john@example.com', 50000, 'Doe'),
(2, 'Jane', 'Chef', '456 Elm St', '0987654321', 'jane@example.com', 45000, 'Smith'),
(3, 'Alice', 'Waiter', '789 Oak St', '1122334455', 'alice@example.com', 30000, 'Johnson'),
(4, 'Bob', 'Bartender', '321 Pine St', '2233445566', 'bob@example.com', 35000, 'Brown'),
(5, 'Charlie', 'Cleaner', '654 Maple St', '3344556677', 'charlie@example.com', 25000, 'Davis');

-- Заповнення таблиці Customers
INSERT INTO `LittleLemonDB`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `Number`, `Email`)
VALUES 
(1, 'Michael', 'Scott', '5551234567', 'michael@example.com'),
(2, 'Pam', 'Beesly', '5559876543', 'pam@example.com'),
(3, 'Jim', 'Halpert', '5556789012', 'jim@example.com'),
(4, 'Dwight', 'Schrute', '5553456789', 'dwight@example.com'),
(5, 'Angela', 'Martin', '5554567890', 'angela@example.com');

-- Заповнення таблиці Bookings
INSERT INTO `LittleLemonDB`.`Bookings` (`BookingID`, `TableNo`, `BookingSlot`, `EmployeeID`, `CustomerID`)
VALUES 
(1, 1, '2024-07-01 18:00:00', 1, 1),
(2, 2, '2024-07-01 19:00:00', 2, 2),
(3, 3, '2024-07-02 18:00:00', 3, 3),
(4, 4, '2024-07-02 19:00:00', 4, 4),
(5, 5, '2024-07-03 18:00:00', 5, 5);

-- Заповнення таблиці Menus
INSERT INTO `LittleLemonDB`.`Menus` (`MenuID`, `Cuisine`)
VALUES 
(1, 'Italian'),
(2, 'Chinese'),
(3, 'Mexican'),
(4, 'Indian'),
(5, 'American');

-- Заповнення таблиці Types
INSERT INTO `LittleLemonDB`.`Types` (`TypeID`, `Name`)
VALUES 
(1, 'Appetizer'),
(2, 'Main Course'),
(3, 'Dessert'),
(4, 'Beverage'),
(5, 'Salad');

-- Заповнення таблиці MenuItems
INSERT INTO `LittleLemonDB`.`MenuItems` (`ItemID`, `MenuID`, `TypeID`, `Name`, `Cost`)
VALUES 
(1, 1, 1, 'Bruschetta', 5.99),
(2, 1, 2, 'Spaghetti Carbonara', 12.99),
(3, 2, 1, 'Spring Rolls', 4.99),
(4, 2, 2, 'Kung Pao Chicken', 11.99),
(5, 3, 3, 'Churros', 3.99),
(6, 3, 2, 'Tacos', 9.99),
(7, 4, 4, 'Mango Lassi', 2.99),
(8, 4, 2, 'Butter Chicken', 13.99),
(9, 5, 5, 'Caesar Salad', 6.99),
(10, 5, 2, 'Cheeseburger', 10.99);

-- Заповнення таблиці Delivery
INSERT INTO `LittleLemonDB`.`Delivery` (`DeliveryID`, `DeliveryDate`, `Status`)
VALUES 
(1, '2024-07-01 18:30:00', 'Delivered'),
(2, '2024-07-01 19:30:00', 'Pending'),
(3, '2024-07-02 18:30:00', 'Delivered'),
(4, '2024-07-02 19:30:00', 'Pending'),
(5, '2024-07-03 18:30:00', 'Delivered');

-- Заповнення таблиці Orders
INSERT INTO `LittleLemonDB`.`Orders` (`OrderID`, `ItemID`, `BookingID`, `BillAmount`, `Quantity`, `DeliveryID`, `OrderDate`)
VALUES 
(1, 1, 1, 11.98, 2, 1, '2024-07-01 18:00:00'),
(2, 2, 2, 12.99, 1, 2, '2024-07-01 19:00:00'),
(3, 3, 3, 7.98, 2, 3, '2024-07-02 18:00:00'),
(4, 4, 4, 11.99, 1, 4, '2024-07-02 19:00:00'),
(5, 5, 5, 6.99, 1, 5, '2024-07-03 18:00:00');

INSERT INTO `LittleLemonDB`.`Orders` (`OrderID`, `ItemID`, `BookingID`, `BillAmount`, `Quantity`, `DeliveryID`, `OrderDate`)
VALUES 
(6, 2, 1, 155.88, 12, 1, '2024-07-04 18:00:00'),  
(7, 4, 2, 167.86, 14, 2, '2024-07-04 19:00:00'), 
(8, 8, 3, 167.88, 12, 3, '2024-07-05 18:00:00'),  
(9, 10, 4, 164.85, 15, 4, '2024-07-05 19:00:00');
