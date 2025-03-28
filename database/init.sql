drop table if exists users;
drop table if exists category;
drop table if exists products;

drop sequence if exists seq_user_id;
drop sequence if exists seq_category_id;
drop sequence if exists seq_product_id;
drop sequence if exists seq_admin_id;
drop sequence if exists seq_transaction_id;

create sequence seq_user_id
start 101;

create sequence seq_category_id
start 201;

create sequence seq_product_id
start 301;

create sequence seq_admin_id
start 401;

create sequence seq_transaction_id
start 1;

create table users(
	user_id int primary key default nextval('seq_user_id'),
	username varchar(50),
	email varchar(50),
	password_hash varchar,
	balance float,
	whether_admin boolean
);

create table category(
	category_id int primary key default nextval('seq_category_id'),
	category_name varchar(50)
);

create table product(
	product_id int primary key default nextval('seq_product_id'),
	category_id int references category(category_id),
	product_name varchar(50),
	price float,
	date date
);

create table admins(
	admin_id int primary key default nextval('seq_admin_id'),
	user_id int references users(user_id),
	whether_admin boolean
);

create table transaction(
	transaction_id int primary key default nextval('seq_transaction_id'),
	user_id int references users(user_id),
	product_id int references product(product_id),
	quantity int,
	date date,	
);
