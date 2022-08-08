create database Airline
use Airline

create table customer(p_id int identity(1000,1) primary key, p_name nvarchar(20), p_phonenumber nvarchar(10), p_email nvarchar(10))


create procedure InsertCustomerDetail
@p_name nvarchar(20),
@p_phonenumber nvarchar(10),
@p_email nvarchar(10)
as
begin 
insert into customer values(@p_name, @p_phonenumber, @p_email)
end

exec InsertCustomerDetail @p_name ='Annie',@p_phonenumber='999999999',@p_email='annie@gmail.com'
exec InsertCustomerDetail @p_name ='Bob',@p_phonenumber='888888888',@p_email='Bob@gmail.com'
exec InsertCustomerDetail @p_name='Charlie', @p_phonenumber='777777777', @p_email='charlie@gmail'

select * from customer

Create table FlightDetail(f_No int identity(100,1) primary key, f_from nvarchar(20), f_departure nvarchar(20), f_time DateTime, f_Distance numeric(4,2))

select * from FlightDetail

create procedure InsertFlightDetail
@f_from nvarchar(20),
@f_departure nvarchar(20),
@f_time DateTime,
@f_Distance numeric(4,2)
as
begin
insert into FlightDetail values(@f_from, @f_departure, @f_time, @f_Distance)
end

select * from FlightDetail

exec InsertFlightDetail @f_from='Pune', @f_departure='Delhi', @f_time='2022-12-01 7:30:00', @f_Distance=50

exec InsertFlightDetail @f_from='Delhi', @f_departure='Pune', @f_time='2022-07-05 8:45:00', @f_Distance=50
exec InsertFlightDetail @f_from='Mumbai', @f_departure='Bangalore', @f_time='2022-07-07 7:30:00', @f_Distance=75
exec InsertFlightDetail @f_from='Bangalore', @f_departure='Mumbai', @f_time='2022-07-10 7:30:00', @f_Distance=75
exec InsertFlightDetail @f_from='Kolkata', @f_departure='Pune', @f_time='2022-12-01 7:30:00', @f_Distance=14
exec InsertFlightDetail @f_from='Pune', @f_departure='Kolkata', @f_time='2022-12-01 7:30:00', @f_Distance=14
exec InsertFlightDetail @f_from='Pune', @f_departure='Goa', @f_time='2022-12-01 7:30:00', @f_Distance=25
exec InsertFlightDetail @f_from='Goa', @f_departure='Delhi', @f_time='2022-12-01 7:30:00', @f_Distance=25

create table Booking(C_Id int,f_No int,seating int check(seating<90), constraint fk_b_id foreign key (C_id) references customer(p_id),constraint fk_cid foreign key (f_No) references FlightDetail(f_No) on delete cascade on update cascade)

create Procedure InsertBookingDetail
@C_Id int,
@f_No int,
@seating int
as
begin
insert into Booking values(@C_Id,@f_No,60)
end

select * from Booking
drop table Booking

exec InsertBookingDetail @C_Id=1000, @f_No=100, @seating=60

--left join
select F.f_No from FlightDetail as F left join customer on C.C_Id=F.f_No