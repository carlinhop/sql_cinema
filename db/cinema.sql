drop table if exists tickets; 
drop table if exists customers;
drop table if exists films;


create table customers(
  id serial4 primary key,
  name varchar(255),
  funds int4
); 

create table films(
  id serial4 primary key,
  title varchar(255),
  price int4 
);

create table tickets(
  id serial4 primary key,
  customer_id serial4 references customers(id),
  film_id serial4 references  films(id)
);
