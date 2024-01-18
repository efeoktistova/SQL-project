create schema restaraunt;

SET search_path TO restaraunt, user021;

-- table of employees (russian names)
create table restaraunt.employee (
	id serial primary key,
	lastname varchar not null,
	firstname varchar);

insert into restaraunt.employee (id, lastname, firstname)
values
	(1, 'Иванов', 'Иван'),
	(2, 'Петров', 'Николай'),
	(3, 'Сидорова', 'Анна'),
	(4, 'Кузнецова', 'Наталья'),
	(5, 'Белова', 'Ольга'),
	(6, 'Фёдоров', 'Пётр'),
	(7, 'Кузьмин', 'Андрей'),
	(8, 'Сергеева', 'Анна'),
	(9, 'Калинин', 'Николай'),
	(10, 'Михайлова', 'Нина');

-- job roles
create table restaraunt.jobs (
	id_job serial primary key,
	job varchar,
	salary int not null);

insert into restaraunt.jobs (id_job, job, salary)
values 
	(1, 'boss', 100000),
	(2, 'cook', 70000),
	(3, 'waiter', 50000),
	(4, 'accounter', 80000),
	(5, 'cleaner', 20000);

-- add job roles to employee
alter table restaraunt.employee
add column id_job int references restaraunt.jobs (id_job);

update restaraunt.employee 
set id_job = 1 where id = 1;

update restaraunt.employee 
set id_job = 2 where id between 2 and 4;

update restaraunt.employee 
set id_job = 3 where id between 5 and 8;

update restaraunt.employee 
set id_job = 4 where id=9;

update restaraunt.employee 
set id_job = 5 where id=10;

-- another update
--update employee 
--set id_job = case
--when id = 1 then 1
--when id between 2 and 4 then 2
--when id between 5 and 8 then 3
--when id = 9 then 4
--when id = 10 then 5
--else null
--end;

-- check job roles
select *
from restaraunt.employee e join restaraunt.jobs using (id_job);

-- work time 
create table restaraunt.timesheet (
	id_ts serial primary key,
	id_empl int not null references restaraunt.employee (id),
	date_ts date,
	job_hours int);

insert into restaraunt.timesheet (id_ts, id_empl, date_ts, job_hours)
values 
	(1, 1, '2022-06-20',8),
	(2, 1, '2022-06-21',8),
	(3, 1, '2022-06-22',8),
	(4, 1, '2022-06-23',8),
	(5, 1, '2022-06-24',8),
	(6, 1, '2022-06-25',0),
	(7, 1, '2022-06-26',0),
	(8, 9, '2022-06-20',8),
	(9, 9, '2022-06-21',8),
	(10, 9, '2022-06-22',8),
	(11, 9, '2022-06-23',8),
	(12, 9, '2022-06-24',8),
	(13, 9, '2022-06-25',0),
	(14, 9, '2022-06-26',0),
	(15, 2, '2022-06-20',8),
	(16, 2, '2022-06-21',8),
	(17, 2, '2022-06-22',8),
	(18, 2, '2022-06-23',8),
	(19, 2, '2022-06-24',0),
	(20, 2, '2022-06-25',8),
	(21, 2, '2022-06-26',0),
	(22, 3, '2022-06-20',0),
	(23, 3, '2022-06-21',0),
	(24, 3, '2022-06-22',8),
	(25, 3, '2022-06-23',8),
	(26, 3, '2022-06-24',8),
	(27, 3, '2022-06-25',8),
	(28, 3, '2022-06-26',8),
	(29, 4, '2022-06-20',8),
	(30, 4, '2022-06-21',8),
	(31, 4, '2022-06-22',0),
	(32, 4, '2022-06-23',0),
	(33, 4, '2022-06-24',8),
	(34, 4, '2022-06-25',8),
	(35, 4, '2022-06-26',8),
	(36, 5, '2022-06-20',8),
	(37, 5, '2022-06-21',0),
	(38, 5, '2022-06-22',8),
	(39, 5, '2022-06-23',6),
	(40, 5, '2022-06-24',6),
	(41, 5, '2022-06-25',6),
	(42, 5, '2022-06-26',6),
	(43, 6, '2022-06-20',0),
	(44, 6, '2022-06-21',6),
	(45, 6, '2022-06-22',6),
	(46, 6, '2022-06-23',8),
	(47, 6, '2022-06-24',6),
	(48, 6, '2022-06-25',6),
	(49, 6, '2022-06-26',6),
	(50, 7, '2022-06-20',8),
	(51, 7, '2022-06-21',8),
	(52, 7, '2022-06-22',0),
	(53, 7, '2022-06-23',6),
	(54, 7, '2022-06-24',6),
	(55, 7, '2022-06-25',6),
	(56, 7, '2022-06-26',6),
	(57, 8, '2022-06-20',6),
	(58, 8, '2022-06-21',8),
	(59, 8, '2022-06-22',8),
	(60, 8, '2022-06-23',0),
	(61, 8, '2022-06-24',6),
	(62, 8, '2022-06-25',6),
	(63, 8, '2022-06-26',6),
	(64, 10, '2022-06-20',5),
	(65, 10, '2022-06-21',5),
	(66, 10, '2022-06-22',5),
	(67, 10, '2022-06-23',5),
	(68, 10, '2022-06-24',5),
	(69, 10, '2022-06-25',5),
	(70, 10, '2022-06-26',5);

-- MENU
-- menu books
create table menu_books (
id_mb int primary key,
name varchar);

alter table  menu_books
set schema restaraunt;

insert into restaraunt.menu_books (id_mb, name)
values
	(1, 'main_menu'),
	(2, 'summer_menu'),
	(3, 'children_menu'),
	(4, 'drinks');

-- chapters of menu, relationship to menu_books
create table restaraunt.menu_groups (
	id_gr serial primary key,
	group_name varchar not null,
	id_mb int references restaraunt.menu_groups (id_gr));
	
insert into restaraunt.menu_groups (id_gr, group_name, id_mb)
values 
	(1, 'snacks', 1),
	(2, 'grill', 1),
	(3, 'main_course', 1),
	(4, 'salads', 2),
	(5, 'veg', 2),
	(6, 'deserts', 2),
	(7, 'soup', 3),
	(8, 'fruits', 3),
	(9, 'breakfasts', 3),
	(10, 'hot', 4), 
	(11, 'cold', 4),
	(12, 'alco',4);

-- constraints uniques dish, not null price, relationship to menu_groups
create table restaraunt.menu_details (
	id_det serial primary key,
	dish varchar not null unique,
	id_gr int references restaraunt.menu_groups (id_gr),
	price int not null);

-- drop cascade
-- drop table restaraunt.menu_details cascade;

insert into restaraunt.menu_details (id_det, dish, id_gr, price)
values 
	(1, 'salad_cesar', 1, 500),
	(2, 'salad_veg', 1, 400),
	(3, 'mashrooms', 1, 450),
	(4, 'cheese', 1, 600),
	(5, 'olives', 1, 350),
	(6, 'meat', 2, 1000),
	(7, 'fish', 2, 1500),
	(8, 'chicken', 2, 700),
	(9, 'plov', 2, 500),
	(10, 'barbecue', 2, 550),
	(11, 'pasta', 3, 480),
	(12, 'pizza', 3, 420),
	(13, 'risotto', 3, 360),
	(14, 'vegetables', 3, 280),
	(15, 'burger', 3, 400),
	(16, 'salad_greek', 4, 480),
	(17, 'okroshka', 4, 400),
	(18, 'salad_capreze', 4, 580),
	(19, 'gaspacho', 4, 500),
	(20, 'salad_vitamine', 4, 300),
	(21, 'tomatoes', 5, 350),
	(22, 'zucchini', 5, 310),
	(23, 'eggplants', 5, 470),
	(24, 'salad_green', 5, 450),
	(25, 'carrot', 5, 280),
	(26, 'fruit_dish', 6, 520),
	(27, 'icecream', 6, 250),
	(28, 'cake', 6, 250),
	(29, 'croussan', 6, 120),
	(30, 'strawberry', 6, 400),
	(31, 'soup_chick', 7, 200),
	(32, 'soup_veg', 7, 180),
	(33, 'soup_cream', 7, 230),
	(34, 'soup_potato', 7, 210),
	(35, 'soup_rus', 7, 270),
	(36, 'apple', 8, 120),
	(37, 'orange', 8, 130),
	(38, 'banana', 8, 100),
	(39, 'peach', 8, 140),
	(40, 'pineapple', 8, 140),
	(41, 'porridge', 9, 130),
	(42, 'eggs', 9, 160),
	(43, 'muesli', 9, 150),
	(44, 'jogurt', 9, 90),
	(45, 'pancake', 9, 140),
	(46, 'tea_black', 10, 400),
	(47, 'tea_green', 10, 400),
	(48, 'tea_red', 10, 400),
	(49, 'coffee', 10, 200),
	(50, 'cacao', 10, 180),
	(51, 'water', 11, 90),
	(52, 'juice', 11, 120),
	(53, 'icetea', 11, 110),
	(54, 'milkshake', 11, 160),
	(55, 'cola', 11, 100),
	(56, 'vine_white', 12, 400),
	(57, 'vine_red', 12, 400),
	(58, 'vine_rose', 12, 400),
	(59, 'vine_champagne', 12, 450),
	(60, 'beer', 12, 320);

-- ORDERS
-- tables, size of table
create table restaraunt.tables_guest (
	id_t int primary key,
	table_guest varchar,
	guests int);

insert into restaraunt.tables_guest (id_t, table_guest, guests)
values 
	(1, 'Table 1', 2),
	(2, 'Table 2', 2),
	(3, 'Table 3', 2),
	(4, 'Table 4', 2),
	(5, 'Table 5', 4),
	(6, 'Table 6', 4),
	(7, 'Table 7', 4),
	(8, 'Table 8', 6);

-- orders, relationship
create table restaraunt.orders (
	id_order serial primary key,
	order_active timestamp, 
	table_id int references restaraunt.tables_guest (id_t),
	waiter_id int references restaraunt.employee (id),
	order_closed timestamp);

--drop table orders cascade;

-- constaints to waiter (not accounter and not admin)
alter table restaraunt.orders
add constraint waiter_id check (waiter_id != 10 and waiter_id != 9);

-- data of previos period
insert into restaraunt.orders (order_active, table_id, waiter_id, order_closed)
values 
	('2022-06-20 10:50:00', 4, 7, '2022-06-20 11:30:00'),
	('2022-06-20 13:40:00', 2, 8, '2022-06-20 14:50:00'),
	('2022-06-20 14:10:00', 7, 5, '2022-06-20 16:50:00'),
	('2022-06-21 11:10:00', 1, 7, '2022-06-21 11:58:00'),
	('2022-06-21 12:45:00', 3, 6, '2022-06-21 13:30:00'),
	('2022-06-21 14:20:00', 8, 8, '2022-06-21 15:50:00'),
	('2022-06-22 12:10:00', 5, 5, '2022-06-22 13:15:00'),
	('2022-06-22 13:18:00', 4, 6, '2022-06-22 14:30:00'),
	('2022-06-22 17:05:00', 1, 8, '2022-06-22 18:10:00'),
	('2022-06-23 11:50:00', 6, 7, '2022-06-23 12:50:00'),
	('2022-06-23 12:30:00', 2, 6, '2022-06-23 13:15:00'),
	('2022-06-23 15:10:00', 3, 5, '2022-06-23 16:50:00'),
	('2022-06-24 12:10:00', 8, 1, '2022-06-24 14:55:00'),
	('2022-06-24 18:30:00', 6, 5, '2022-06-24 20:10:00'),
	('2022-06-24 20:05:00', 3, 7, '2022-06-24 21:58:00'),
	('2022-06-25 10:30:00', 1, 6, '2022-06-25 11:30:00'),
	('2022-06-25 11:45:00', 5, 8, '2022-06-25 13:30:00'),
	('2022-06-25 17:20:00', 7, 5, '2022-06-25 19:30:00'),
	('2022-06-26 12:40:00', 3, 6, '2022-06-25 13:30:00'),
	('2022-06-26 15:05:00', 2, 7, '2022-06-25 16:30:00'),
	('2022-06-26 19:20:00', 6, 8, '2022-06-25 21:30:00');

-- update waiter
--update orders 
--set waiter_id = 5
--where id_order = 19;

-- add order's status, constraints: choose Active/Closed only, default Active
alter table restaraunt.orders
add column status varchar default 'Active';

alter table restaraunt.orders
add constraint order_status check (status = 'Active' or status = 'Closed');

-- for data of previous periods
update restaraunt.orders 
set status = 'Closed' where order_active <= current_date;

-- check constraints (add mistake)
update restaraunt.orders 
set status = 'Close' where id_order = 21;

alter table orders 
add column client int default null;

-- truncate restaraunt.orders cascade;

-- dishes in orders, relationship «many-to-many»
create table orders_details (
id_order int references orders (id_order),
id_dish int references menu_details (id_det));

alter table orders_details 
add column quantity int default 1;

alter table orders_details 
add constraint id_order_num foreign key (id_order) references orders (id_order);

insert into orders_details (id_order, id_dish, quantity)
values 
	(1, 1, 1),
	(1, 11, 1),
	(1, 46, 1),
	(1, 48, 1),
	(2, 19, 1),
	(2, 60, 1),
	(2, 6, 1),
	(4, 7, 2),
	(4, 24, 1),
	(4, 56, 2),
	(3, 5, 1),
	(3, 9, 2),
	(3, 11, 2),
	(3, 14, 2),
	(3, 28, 4),
	(3, 46, 2),
	(3, 49, 1),
	(4, 29, 2),
	(4, 50, 2),
	(5, 31, 1),
	(5, 52, 1),
	(5, 31, 2),
	(5, 33, 1),
	(6, 3, 2),
	(6, 4, 2),
	(6, 10, 6),
	(6, 14, 3),
	(6, 60, 6),
	(6, 51, 6),
	(6, 27, 2),
	(7, 12, 2),
	(7, 57, 4),
	(8, 20, 1),
	(8, 17, 1),
	(8, 47, 1),
	(9, 49, 2),
	(10, 41, 2),
	(10, 42, 2),
	(10, 38, 3),
	(10, 39, 1),
	(10, 29, 2),
	(10, 46, 1),
	(10, 47, 1),
	(11, 15, 2),
	(11, 60, 2),
	(12, 16, 1),
	(12, 18, 1),
	(12, 35, 2),
	(12, 53, 2),
	(13, 3, 2),
	(13, 4, 2),
	(13, 10, 3),
	(13, 9, 3),
	(13, 14, 3),
	(13, 60, 6),
	(13, 51, 6),
	(13, 27, 2),
	(13, 16, 2),
	(13, 22, 1),
	(13, 55, 6),
	(14, 54, 3),
	(14, 49, 1),
	(14, 30, 1),
	(14, 29, 4),
	(15, 17, 1),
	(15, 19, 1),
	(15, 8, 2),
	(15, 48, 1),
	(16, 58, 1),
	(16, 7, 1),
	(17, 34, 2),
	(17, 32, 2),
	(17, 23, 2),
	(17, 21, 2),
	(17, 10, 4),
	(17, 55, 4),
	(17, 47, 4),
	(18, 45, 4),
	(18, 44, 4),
	(18, 50, 4),
	(18, 43, 1),
	(18, 52, 1),
	(19, 51, 1),
	(19, 39, 2),
	(19, 15, 2),
	(19, 20, 1),
	(19, 25, 1),
	(19, 55, 2),
	(20, 34, 2),
	(20, 2, 2),
	(20, 6, 2),
	(20, 57, 2),
	(21, 5, 2),
	(21, 3, 2),
	(21, 4, 2),
	(21, 10, 6),
	(21, 21, 3),
	(21, 26, 2),
	(21, 22, 2),
	(21, 55, 3),
	(21, 52, 3),
	(21, 60, 6);

insert into orders_details (id_order, id_dish, quantity)
values 
     (22, 1, 1),
     (23, 2, 1);
    

-- DISCOUNT
-- discount programm, type of cards
create table discount_programm (
id_pr int primary key,
type_of_card varchar,
discount float);

insert into discount_programm (id_pr, type_of_card, discount)
values 
	(1, 'silver', 0.05),
	(2, 'gold', 0.1),
	(3, 'brilliant', 0.15);

-- cards and owners
create table discount_cards (
id_card int primary key,
type_of_card int references discount_programm (id_pr),
owner_name varchar);

insert into discount_cards (id_card, type_of_card, owner_name)
values 
	(1, 1, 'Степаненко'),
	(2, 1, 'Константинова'),
	(3, 1, 'Ильина'),
	(4, 1, 'Ромашов'),
	(5, 1, 'Игнатьев'),
	(6, 2, 'Ульянова'),
	(7, 2, 'Герасимов'),
	(8, 2, 'Топорова'),
	(9, 3, 'Ермолаева'),
	(10, 3, 'Орлов');


-- add clients to 'orders'
alter table orders 
add constraint FK_orders_client foreign key (client) references discount_cards (id_card);

update orders 
set client = 10
where id_order = 20;




-- sum before discount (amount) and after discount (invoice)
create or replace view invoices as
select 
	od.id_order, 
	sum(md.price*od.quantity) as amount,
	avg(dp.discount) as discount,
	case 
		when avg(dp.discount) is not null then sum(md.price*od.quantity)*(1-avg(dp.discount))
		else sum(md.price*od.quantity)
	end as invoice
from 
	orders_details od join menu_details md on od.id_dish = md.id_det
	join orders o on o.id_order = od.id_order
	left join discount_cards dc on dc.id_card = o.client
	left join discount_programm dp on dp.id_pr = dc.type_of_card
where o.status like 'Closed'
group by od.id_order
order by od.id_order;



-- PAYMENTS
create table payments (
id_pay serial primary key,
date_pay timestamp not null,
id_order int references orders (id_order),
payment_total numeric (10,2));

-- one invoice - many payments
insert into payments (date_pay, id_order, payment_total)
values 
	('2022-06-20 11:35:00', 1, 1780),
	('2022-06-20 15:00:00', 2, 1729),
	('2022-06-20 16:55:00', 3, 4870),
	('2022-06-21 12:05:00', 4, 4607.5),
	('2022-06-21 13:45:00', 5, 950),
	('2022-06-21 16:00:00', 6, 8000),
	('2022-06-21 16:01:00', 6, 740),
	('2022-06-22 13:17:00', 7, 2440),
	('2022-06-22 14:40:00', 8, 1045),
	('2022-06-22 18:13:00', 9, 400),
	('2022-06-23 13:00:00', 10, 1957),
	('2022-06-23 12:35:00', 11, 1440),
	('2022-06-23 16:49:00', 12, 1820),
	('2022-06-24 14:58:00', 13, 10920),
	('2022-06-24 20:20:00', 14, 1404),
	('2022-06-24 21:59:00', 15, 2700),
	('2022-06-25 11:35:00', 16, 1710),
	('2022-06-25 13:35:00', 17, 5000),
	('2022-06-25 13:36:00', 17, 1220),
	('2022-06-25 19:38:00', 18, 1623.5),
	('2022-06-26 13:40:00', 19, 1950),
	('2022-06-26 16:50:00', 20, 3417),
	('2022-06-26 21:45:00', 21, 11390),
	('2022-07-04 12:41:00', 22, 500),
	('2022-07-04 13:40:00', 23, 380),
	('2022-07-04 13:50:00', 24, 494);

--drop table payments ;


-- NEW ORDER

-- make an order
insert into restaraunt.orders (order_active, table_id, waiter_id)
values 
	(current_timestamp, 3, 6);

-- choose dish 
insert into orders_details (id_order, id_dish, quantity)
values 
     --(26, 15, 1),
     (40,25,1);
    
 delete from orders 
where id_order = 32;

-- close order, add discount cart
update restaraunt.orders 
set order_closed = current_timestamp,
	status = 'Closed',
	client = 2
where id_order = 40;


-- invoice
select 
	i.id_order as "заказ",
	o.order_active as "заказ открыт",
	concat (e.firstname, ' ', e.lastname) as "официант",
	i.amount as "сумма счёта",
	i.discount as "скидка",
	-i.amount*i.discount as "сумма скидки",
	i.invoice as "итого к оплате"
from 
	invoices i join orders o using (id_order)
	join employee e on e.id = o.waiter_id 
where i.id_order = 38;

-- pay
insert into payments (date_pay, id_order, payment_total)
values 
	(current_timestamp, 38, 475);

-- change discount (violation)
update restaraunt.orders 
set client = 8
where id_order = 38;


	
-- CREATE VIEW (tasks)
-- view "Menu"
create or replace view restaraunt.menu as
--explain
select b.name as menu_book, g.group_name as "group", d.dish, d.price
from restaraunt.menu_details d join restaraunt.menu_groups g using (id_gr)
	join restaraunt.menu_books b on b.id_mb = g.id_mb;

-- view «Made orders list»
create or replace view orders_active as
--explain
select 
	o.id_order,
	o.order_active,
	o.table_id,
	concat (e.lastname, ' ', e.firstname) as waiter,
	o.status
from orders o join employee e on o.waiter_id = e.id 
where status like 'Active';

-- view "Today income"
--explain
create or replace view income_today as
select 
	o.id_order, 
	o.status,
	i.amount,
	case 
		when i.discount is null then 0
		else i.discount*i.amount 
	end as discount_total,
	i.invoice,
	p.payment_total,
	sum(p.payment_total) over() as income_today
from 
	payments p join orders o using (id_order) 
	join invoices i using (id_order)
where 
	p.date_pay :: date = current_date
	and o.status like 'Closed';


-- view «Discount»
--create or replace view discount as
explain
select 
	o.order_closed :: date , 
	dc.owner_name as client,
	dp.type_of_card,
	od.id_order, 
	sum(md.price*od.quantity) as amount,
	avg(dp.discount)*sum(md.price*od.quantity) as discount_total,
	case 
		when avg(dp.discount) is not null then sum(md.price*od.quantity)*(1-avg(dp.discount))
		else sum(md.price*od.quantity)
	end as invoice
from 
	orders_details od join menu_details md on od.id_dish = md.id_det
	join orders o on o.id_order = od.id_order 
	join discount_cards dc on dc.id_card = o.client
	join discount_programm dp on dp.id_pr = dc.type_of_card 
group by 
	od.id_order,
	dc.owner_name,
	o.order_closed,
	dp.type_of_card 
order by od.id_order;

--create index ownername_indx on discount_cards (owner_name);
--create index ordclosed_indx on orders (order_closed);
--create index cards_indx on discount_cards (type_of_card);
--drop index cards_indx;


-- view «Employees & job roles»
create or replace view emploeee as
--explain
select 
	concat (e.lastname, ' ', e.firstname) as employee,
	j.job 
from employee e join jobs j using (id_job);

alter view emploeee rename to employee_v;


-- view «Rank of employees»
--explain
create or replace view employee_rank as
select 
	e.lastname,
	sum(p.payment_total) as income,
	rank() over (order by sum(p.payment_total) desc)
from 
	payments p natural join orders o
	join employee e on o.waiter_id = e.id
group by e.lastname;

-- view «Violations» (payment != invoice)
create or replace view violations as
--explain
select
	p.date_pay :: date, 
	i.id_order, 
	avg(i.amount) amount, 
	avg(i.invoice) discount_with,
	sum (p.payment_total) payment,
	e.lastname as waiter
from 
	invoices i left join payments p using (id_order)
	join orders o using (id_order)
	join employee e on o.waiter_id = e.id
group by 
	i.id_order, 
	p.date_pay :: date,
	e.lastname
having avg(i.invoice) != sum (p.payment_total);


-- INDEX 
-- optimizate view "Today income"
create index dpay_indx on payments(date_pay);

--optimizate view "Employees & job roles" и "Rank of employees"
create index lnameempl_indx on employee(lastname);
create index fnameempl_indx on employee(firstname);


-- TRIGGERS
-- trigger last change 'Orders'
create or replace function order_closed()
returns trigger 
language plpgsql
as
$code$
	begin 
		new.dateofchange := current_timestamp;
		new.userofchange := current_user;
		return new;
	end
$code$;

create or replace trigger order_closed_trigger before insert or update on orders
for each row execute function order_closed();

-- add column to 'orders'
alter table orders 
add column dateofchange timestamp;

alter table orders 
add column userofchange varchar;


-- trigger logs add and update 'orders' and 'payments' (one record)
create table audit (
	id_log serial primary key,
	table_name varchar,
	what text,
	user_ varchar);

create or replace function audit_log()
returns trigger 
language plpgsql
as 
$code$
begin 
	insert into audit (table_name, what, user_) values (tg_table_name, new, current_user);
	return new;
end
$code$;

create or replace trigger audit_trig after insert or update on orders
for each row execute function audit_log();

create or replace trigger audit_trig_pay after insert on payments
for each row execute function audit_log();

select * from audit;



-- trigger List of violations
create table orders_audit (
	id_log_audit serial primary key,
	id_order int references orders (id_order),
	note text,
	client_old int,
	client_new int,
	userofchange varchar);


create or replace function audit_orders()
returns trigger 
language plpgsql
as 
$code$
begin 
	if new.dateofchange > new.order_closed then 
		insert into orders_audit (id_order, note, client_old, client_new, userofchange) 
			values (new.id_order, 'изменение закрытого заказа', old.client, new.client, new.userofchange);
	end if;
	return new;
end
$code$;

create or replace trigger audit_orders_trig after update on orders
for each row execute function audit_orders();

