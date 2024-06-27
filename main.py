from mysql.connector.pooling import MySQLConnectionPool
from mysql.connector import Error, PoolError
import mysql.connector as connector

dbconfig={
    "database":"LittleLemonDB",
    "user":"coursera",
    "password":"gxiVkcm1RjH7HB"
}

print("Connection to database")
connection = connector.connect(**dbconfig)

print("Create cursor")
cursor = connection.cursor()
print()

print("Show tables")
show_tables_query = "SHOW tables" 
cursor.execute(show_tables_query)

result = cursor.fetchall()

print(result)
print()


select_cust = """
SELECT CONCAT(Customers.FirstName, " ", Customers.LastName) AS FullName, Customers.Email AS Email, Customers.Number AS Number, SUM(Orders.BillAmount) AS Total
FROM Orders
INNER JOIN Bookings ON Bookings.BookingID = Orders.BookingID
INNER JOIN Customers ON Customers.CustomerID = Bookings.CustomerID
WHERE Bookings.BookingID IN (SELECT Bookings.BookingID FROM Orders
							INNER JOIN Bookings ON Bookings.BookingID = Orders.BookingID
                            WHERE Orders.BillAmount >=60)
GROUP BY Customers.CustomerID;

"""

cursor.execute(select_cust)

print(cursor.column_names)

for cust in cursor.fetchall():
    print(cust)
print()


print("Cursor close.")
cursor.close()
print("Connection close.")
connection.close()
print()
