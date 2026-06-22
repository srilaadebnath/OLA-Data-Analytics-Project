create database ola;
use ola;
#1.retrieve all successfull bookings:

create view Successfull_bookings as
SELECT * FROM `bookings-100000-rows` WHERE Booking_status='Success';
SELECT * FROM Successfull_bookings;

#2.find the avg ride distance for each vehicle type:

CREATE VIEW Avg_Distance AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS Avg_distance from `bookings-100000-rows` GROUP BY Vehicle_Type;
SELECT * FROM Avg_distance;

#3.get the total number of cancelled rides by customers:

CREATE VIEW Total_cancelled_rides_by_customers AS
SELECT COUNT(*) FROM `bookings-100000-rows` WHERE Booking_Status="Canceled by Customer";
SELECT * FROM Total_cancelled_rides_by_customers;

#4.list the top 5 customers who booked the highest number of rides:

CREATE VIEW Top_5_customers AS
SELECT CUSTOMER_ID, COUNT(Booking_ID) AS Total_Rides 
FROM `bookings-100000-rows`
GROUP BY Customer_ID
ORDER BY Total_Rides DESC LIMIT 5;
SELECT * FROM Top_5_customers;

#5.Get the number of rides cancelled by drivers due to personal and car related issues

CREATE VIEW Rides_cancelled_by_driver AS
SELECT COUNT(Canceled_Rides_by_Driver) FROM `bookings-100000-rows` WHERE Canceled_Rides_by_Driver="Personal & Car related issue";
SELECT * FROM Rides_cancelled_by_driver;

#6.Find the max and min driver ratings for prime sedan bookings:

CREATE VIEW min_max_driver_ratings AS
SELECT MAX(Driver_Ratings), MIN(Driver_Ratings) FROM `bookings-100000-rows` WHERE Vehicle_Type="Prime Sedan";
SELECT * FROM min_max_driver_ratings;

#7.retireve all rides where payment was made by UPI:

CREATE VIEW UPI_Payment AS
SELECT * FROM `bookings-100000-rows` WHERE Payment_Method="UPI";
SELECT * FROM UPI_Payment;

#8.find the avg customer rating per vehicle type:

CREATE VIEW AVG_customer_rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) FROM `bookings-100000-rows` GROUP BY Vehicle_Type;
SELECT * FROM AVG_customer_rating;

#9.calculate total booking value of rides completed successfully:

CREATE VIEW Total_booking_value AS
SELECT SUM(Booking_Value) FROM `bookings-100000-rows` WHERE Booking_Status="Success";
SELECT * FROM Total_booking_value;

#10.list all incomplete rides along with reason:

CREATE VIEW all_incomplete_rides AS
SELECT Booking_ID,Incomplete_Rides_Reason FROM `bookings-100000-rows` WHERE Incomplete_Rides="Yes";
SELECT * FROM all_incomplete_rides;