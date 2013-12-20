drop table if exists users;
drop table if exists category;
drop table if exists modules;
drop table if exists functions;
drop table if exists role_function;
drop table if exists departments;
drop table if exists user_department;

create table users (
	id varchar(64) not null unique,
	name varchar(64) not null,
	password varchar(255) not null,
	sex varchar(2),
	department_id varchar(64),
	email varchar(64),
	phone_num varchar(20),
	address varchar(64),
	hometown varchar(64),
	birthday date,
	register_date timestamp,
	status varchar(20),
	comment varchar(128),
	primary key (id)
);

create table category (
	id varchar(64) not null unique,
	pid varchar(64),
	name varchar(64) not null,
	created_date timestamp not null,
	trashed varchar(1) not null,
	comment varchar(128),
	primary key (id)
);

create table modules (
	module_id varchar(64) not null unique,
	pid varchar(64),
	name varchar(64) not null,
	description varchar(128),
	path varchar(128),
	primary key (module_id)
);

create table functions (
	function_id varchar(64) not null unique,
	module_id varchar(64),
	name varchar(64) not null,
	description varchar(128),
	path varchar(128),
	primary key (function_id)
);

create table roles (
	role_id varchar(64) not null unique,
	name varchar(64) not null,
	description varchar(128),
	primary key (role_id)
);

create table role_function (
	role_id varchar(64) not null,
	function_id varchar(64) not null,
	description varchar(128),
	primary key (role_id,function_id)
);

create table departments (
	department_id varchar(64) not null unique,
	name varchar(64) not null,
	pid varchar(64),
	description varchar(128),
	primary key (department_id)
);

create table user_role (
	user_id varchar(64) not null,
	role_id varchar(64) not null,
	primary key (user_id,role_id)
);

create table medias (
	media_id bigint generated by default as identity,
	media_type varchar(10),
	path varchar(128),
	status varchar(64),
	user_id varchar(64),
	upload_timestamp timestamp,
	description varchar(128),
	title varchar(64),
	author varchar(32),
	primary key (media_id)
);

create table media_category (
	media_id bigint,
	category_id varchar(64),
	primary key (media_id,category_id)
);

create table products (
	product_id bigint generated by default as identity,
	title varchar(64),
	status varchar(64),
	description varchar(128),
	default_picture_id bigint,
	price decimal(10,2),
	primary key (product_id)
);

create table product_category (
	product_id bigint,
	category_id varchar(64),
	picture_id bigint,
	primary key (product_id,category_id)
);

create table module_category (
	module_id varchar(64),
	category_id varchar(64),
	primary key (module_id,category_id)
);

create table holders (
	holder_id bigint generated by default as identity,
	holder_name varchar(32),
	address varchar(64),
	level int,
	contact varchar(24),
	phone varchar(20),
	description varchar(256),	
	primary key (holder_id)
);

create table spaces (
	space_id bigint generated by default as identity,
	holder_id bigint,
	space_name varchar(32),
	floor int,
	volume int,
	hall_height int,
	stage_length int,
	stage_width int,
	stage_height int,
	attributes varchar(256),
	description varchar(256),	
	primary key (space_id)
);

	



