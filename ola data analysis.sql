create database OLA;
use OLA;

#1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings
where Booking_Status = 'Success';

select * from Successful_Bookings;

#2 Find the ride distance for each vehicle type
Create View ride_distance_for_each_vehicle as
select  Vehicle_Type, avg(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;

select * from ride_distance_for_each_vehicle;

#3 Get the total number of cancveled rides by customers
create view canceled_rides_by_customers as
select count(*) from bookings
where Booking_Status = 'Canceled by Customer';

select * from canceled_rides_by_customers;

#4 List the top 5 customers who booked the highest number of rides:
create view Top_5_customers as
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5;

#5 Get the number of rides canceled by drivers due to personal and car related issues;
create view canceled_by_drivers_PC_Issues as
select count(*) from bookings
where Canceled_Rides_by_driver = 'Personal & Car related issue';

select * from canceled_by_drivers_PC_Issues;

#6 Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_rating_for_prime_sedan as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type = 'Prime Sedan';

select * from max_min_rating_for_prime_sedan;

#7 Retreive all rides where payment was using UPI
create view upi_payment as
select * from bookings
where Payment_Method = 'UPI';

#8 Find the average customer rating per vehicle type:
select Vehicle_Type, avg(Customer_Rating) as avg_cust_rating
from bookings
group by Vehicle_Type

#9 Calculate the total booking value of rides completed successfully:
use OLA;
SELECT SUM(Booking_Value) AS total_successful_value
FROM bookings
WHERE Booking_Status = 'Success';

#10 List all incomeplete rides with the reason
create view Incomplete_Rides_Reason as
select Booking_ID, Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes'
 
 use OLA
select * from Incomplete_Rides_Reason
