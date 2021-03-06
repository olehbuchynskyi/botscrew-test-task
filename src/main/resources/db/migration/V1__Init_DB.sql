create sequence hibernate_sequence start 1 increment 1;

create table departments (
    id int8 generated by default as identity,
    name varchar(255),
    head_of_department_id int8,
    primary key (id)
);

create table departments_employees (
    department_id int8 not null,
    employee_id int8 not null
);

create table lectors (
    id int8 not null, 
    age int4, 
    degree varchar(255), 
    first_name varchar(255), 
    salary float8, 
    second_name varchar(255), 
    primary key (id)
);

alter table if exists departments add constraint departments_head_of_departments_fk foreign key (head_of_department_id) references lectors;
alter table if exists departments_employees add constraint departments_employees_employee_id_fk foreign key (employee_id) references lectors;
alter table if exists departments_employees add constraint departments_employees_department_id_fk foreign key (department_id) references departments;