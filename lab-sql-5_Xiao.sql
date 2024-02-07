use sakila;

alter table staff
drop column picture;


insert into staff (staff_id, first_name, last_name, address_id, store_id, active, username)
values (3, 'Tammy', 'Sanders', 4, 2, 1, 'Tammy');

select * from staff;

select * from rental;
select max(rental_id) from rental; #16049
select now(); #2024-02-07 21:16:02
select inventory_id from inventory where film_id =1 and store_id = 1;
select * from staff; #staff_id=1
select * from film where title = 'Academy Dinosaur'; # film_id = 1
select * from customer where store_id = 1 and first_name = 'Charlotte' and last_name = 'Hunter'; #customer_id = 130, address_id = 134

insert into rental (rental_id, rental_date, inventory_id, customer_id, staff_id)
values (16050, '2024-02-07 21:16:02', 4, 130, 1);

select * from rental order by rental_id desc;




#Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
#Check if there are any non-active users
#Create a table backup table as suggested
#Insert the non active users in the table backup table
#Delete the non active users from the table customer
#select * from customer where active=0;

create table deleted_users(
customer_id int default null, 
email varchar(50) default null,
date varchar(50) default null
);

 alter table deleted_users
  modify email varchar(50);
        
INSERT INTO deleted_users(customer_id, email, date)
SELECT customer_id, email, create_date
FROM customer WHERE active=0;

select * from deleted_users;

# to solve Error 1451: bypass foreign key check.
SET foreign_key_checks = 0;
delete from customer where active=0;
SET foreign_key_checks = 1;
select * from customer where active=0;





