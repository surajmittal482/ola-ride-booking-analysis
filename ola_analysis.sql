-- ============================================================
-- Ola Ride Booking Data Analysis
-- SQL Query Collection
-- Based on the provided Ola Data Analyst Project material
-- Database: MySQL
--
-- 
-- ============================================================

CREATE DATABASE IF NOT EXISTS Ola;
USE Ola;

-- 1. Retrieve all successful bookings
SELECT *
FROM bookings
WHERE Booking_Status = 'Success';


-- 2. Find the average ride distance for each vehicle type
SELECT
    Vehicle_Type,
    ROUND(AVG(Ride_Distance), 2) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type
ORDER BY avg_distance DESC;


-- 3. Count rides cancelled by customers
SELECT
    COUNT(*) AS cancelled_by_customers
FROM bookings
WHERE Booking_Status = 'cancelled by Customer';


-- 4. Find the top 5 customers by number of bookings
SELECT
    Customer_ID,
    COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;


-- 5. Count driver cancellations due to personal/car-related issues
SELECT
    COUNT(*) AS driver_cancellations_personal_car_issues
FROM bookings
WHERE cancelled_Rides_by_Driver = 'Personal & Car related issue';


-- 6. Find maximum and minimum driver ratings for Prime Sedan bookings
SELECT
    MAX(Driver_Ratings) AS max_driver_rating,
    MIN(Driver_Ratings) AS min_driver_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';


-- 7. Retrieve bookings paid using UPI
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';


-- 8. Find average customer rating for each vehicle type
SELECT
    Vehicle_Type,
    ROUND(AVG(Customer_Rating), 2) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type
ORDER BY avg_customer_rating DESC;


-- 9. Calculate total booking value for successful rides
SELECT
    ROUND(SUM(Booking_Value), 2) AS total_successful_booking_value
FROM bookings
WHERE Booking_Status = 'Success';


-- 10. List incomplete rides and their reasons
SELECT
    Booking_ID,
    Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';


-- ============================================================