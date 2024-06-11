-- 1. Drop column picture from staff.
alter table sakila.staff
drop column picture;


-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

insert into  sakila.staff (staff_id,first_name,last_name,address_id,email,store_id,username)
values (3, 'Tammy', 'Sanders',5, 'Tammy.Sanders@sakilastaff.com', 1,'Tammy');

UPDATE sakila.staff
SET address_id = 5
where staff_id = 3;

select * from sakila.staff;


-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.

select customer_id from sakila.customer
where first_name = 'Charlotte' and last_name='Hunter';

select staff_id from sakila.staff
where first_name = 'Charlotte' and last_name= 'Hunter';

select inventory_id from sakila.inventory
join sakila.store using(store_id)
join sakila.film using(film_id)
where film.title = "Academy Dinosaur" and store.store_id = 1;




insert into sakila.rental(rental_date,inventory_id,customer_id,staff_id)
values (current_date(),4,130,1);





-- 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
select customer_id 
from sakila.customer 
where active != 1;


drop table if exists deleted_users;
create table deleted_users(
customer_id int,
email varchar(250),
date date,
constraint primary key (customer_id)
);

insert into deleted_users (customer_id, email, date)
select customer_id, email, current_date()
from sakila.customer
where active = 0;

SET FOREIGN_KEY_CHECKS=1;

delete from sakila.customer
where active = 0;

select * from sakila.customer;










