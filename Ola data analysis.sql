create database ola;
use ola;
drop table bookings;
select*from bookings;

-- 1. Retrieve all successful bookings:

create view successful_bookings as
select*from bookings
where Booking_Status='Success';

select*from successful_bookings;

-- 2.Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehical as 
select Vehicle_Type,
avg(Ride_Distance)as avg_distance 
from bookings
 group by Vehicle_Type;
 
select*From ride_distance_for_each_vehical;

-- Get the total number of cancelled rides by customers:
create view canceled_ride_by_customers as 
select count(*) as canceled_by_customers 
from bookings
where Booking_Status ='Canceled by customers';

select*from canceled_ride_by_customers;

-- List the top 5 customers who booked the highest number of rides:

create view top_5_customers as 
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5;

select*from top_5_customers;

-- Get the number of rides cancelled by drivers due to personal and car-related issues:

create view rides_canceled_by_drivers_p_c_issues as 
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & car related issue';

select*from rides_canceled_by_drivers_p_c_issues;

-- Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view max_min_driver_rating as 
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings
 where Vehicle_Type='prime sedan';
 
 select*from  max_min_driver_rating;

-- Retrieve all rides where payment was made using UPI:

create view UPI_payment as 
select*from bookings
where Payment_Method='UPI';

select*from UPI_payment;

-- Find the average customer rating per vehicle type:

create view AVG_cust_rating as 
select Vehicle_Type, 
avg(Customer_Rating) as avg_customer_rating
from bookings
group by Vehicle_Type;

select*from AVG_cust_rating ;

-- Calculate the total booking value of rides completed successfully:

create view booking_value_rides_completed_successfully as 
select sum(Booking_Value) as total_successful_ride_value
from bookings
where Booking_Status='success';

select*from  booking_value_rides_completed_successfully;


--  List all incomplete rides along with the reason:

create view incomplete_ride_along_with_reason as 
select Booking_ID,Incomplete_Rides_Reason
from bookings
where Incomplete_Rides='yes';
 
 select*from incomplete_ride_along_with_reason ;






