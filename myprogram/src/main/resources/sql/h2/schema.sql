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
	birthday timestamp,
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
	primary key (moduleId)
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
