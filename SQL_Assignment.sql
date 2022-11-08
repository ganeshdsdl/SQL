create database sqlPracticeQuestions

use sqlPracticeQuestions


/*Question 1*/
create table orders
(
	ord_no int,
	purch_amt float,
	ord_date date,
	customer_id int,
	salesman_id int
)

insert into orders values
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70011,75.29,'2012-08-17',3003,5007),
(70013,3045.6,'2012-04-25',3002,5001)

select * from orders

select ord_date,salesman_id,ord_no,purch_amt from orders

/*Question 2*/
create table salesPerson
(
salesman_id int,
name varchar(15),
city varchar(15),
commission float
)

insert into salesPerson values
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12)

select * from salesPerson

select name,city from salesPerson where city='Paris'


/*Question 3*/
create table products
(
PRO_ID int,
PRO_NAME varchar(10),
PRO_PRICE float,
PRO_COM int
)

insert into products values
(101,'Motherboard',3200.00,15),
(102,'Keyboard',450.00,16),
(103,'ZIP drive',250.00,14),
(104,'Speaker',550.00,16),
(105,'Monitor',5000.00,11),
(106,'DVD drive',900.00,12),
(107,'CD drive',800.00,12),
(108,'Printer',2600.00,13),
(109,'Refill cartridge',350.00,13),
(110,'Mouse',250.00,12)

alter table products
alter column PRO_NAME varchar(25)

select * from products

select PRO_ID,PRO_NAME,PRO_PRICE,PRO_COM from products where PRO_PRICE>=200 and PRO_PRICE<=600
--OR
select PRO_ID,PRO_NAME,PRO_PRICE,PRO_COM from products where PRO_PRICE between 200 and 600


/*Question 4*/
select PRO_NAME,
       PRO_PRICE 
       from products 
       where PRO_PRICE>=550
       order by PRO_NAME,PRO_PRICE desc

/*Question 5*/       
select ord_no,
	   purch_amt,
	   ord_date,
	   customer_id,
	   salesman_id 
       from orders
       where NOT ord_date = '2012-09-10'
             AND (NOT salesman_id > 5005
             OR  NOT purch_amt  > 1000)
             
             
/*Question 6*/           
create table world
(
	name varchar(20),
	continent varchar(15),
	area int,
	population int,
	gdp bigint
)

insert into world
values  

	('Afghanistan','Asia',652230,25500100,20343000000),
	('Albania','Europe',28748,2831741,12960000000),
	('Algeria','Africa',2381741,37100000,188681000000),
	('Andorra','Europe',468,78115,3712000000),
	('Angola','Africa',1246700,20609294,100990000000),
	('Dominican Republic','Caribbean',48671,9445281,58898000000),
	('China','Asia',9596961,1365370000,8358400000000),
	('Colombia','South America',1141748,47662000,369813000000),
	('Comoros','Africa',1862,743798,616000000),
	('Denmark','Europe',43094,5634437,314889000000),
	('Djibouti','Africa',23200,886000,1361000000),
	('Dominica','Caribbean',751,71293,499000000)
	
	select * from world
	
select name as Country, population as HighestPopulation from world where population=(select MAX(population) from world)
select top 1 name as Country,population as HighestPopulation from world order by population desc

select name as Country, gdp as LeastGDP from world where gdp=(select MIN(gdp) from world)
select top 1 name as Country,gdp as LeastGDP from world order by gdp


select * from world where name like '%c'

select * from world where name like 'd%'

select continent as Continent, gdp as HighesttGDP from world where gdp=(select MAX(gdp) from world)
select top 1 continent as Continent,gdp as Highest from world order by gdp desc


select  SUM(gdp) as TotalGDP from world where continent='Africa'

select Continent as Continent,SUM(population) as TotalPopulation from world group by Continent

select continent,name as Country from world where population >=200000000

select continent,SUM(population) as TotalPouplation 
				from world 
				group by continent 
				having SUM(population) >= 200000000


/*Question 7*/ 

create table students
(
	student_id int,
	student_name varchar(60) not null,
	city varchar(60) not null,
	primary key(student_id)
)



create table course
(
	student_id int,
	course_name varchar(60) not null,
	Marks int not null,
	primary key(student_id),
	foreign key(student_id) references students(student_id)
)

insert into students 
values
	(200,'John Doe','Delhi'),
	(210,'John Doe','Delhi'),
	(220,'Moon ethan','Rajasthan'),
	(230,'Jessie','Bangalore'),
	(240,'Benbrook','Bihar'),
	(250,'Ethan','Bihar'),
	(260,'Johnnie','Bangalore'),
	(270,'Goh','Delhi'),
	(380,'John Doe','Delhi'),
	(280,'Pavi','Delhi'),
	(290,'Sanvi','Rajasthan'),
	(300,'Navyaa','Bangalore'),
	(310,'Ankul','Bihar'),
	(311,'Hitanshi','Bihar'),
	(312,'Aayush','Bangalore'),
	(313,'Rian','Delhi');
	
insert into course 
values
	(200,'Datascience',75),
	(210,'Datascience',75),
	(220,'Dataanalyst',80),
	(230,'Dataanalyst',80),
	(240,'Dataanalyst',84),
	(250,'Dataanalyst',50),
	(260,'Datascience',80),
	(270,'Datascience',99),
	(380,'Datascience',45),
	(280,'Datascience',78),
	(290,'Dataanalyst',78),
	(300,'Computer vision',90),
	(310,'Computer vision',90),
	(311,'Computer vision',75),
	(312,'Computer vision',39)
	
	select * from students
	select * from course
	
	-- Q1
	select students.student_id,students.student_name,course.course_name,course.Marks from course 
	left join students on course.student_id=students.student_id
	where Marks in (select MAX(course.Marks) from course group by course_name)
	
	--Q3
	select students.student_id,students.student_name,course.course_name,course.Marks from course 
	left join students on course.student_id=students.student_id
	where Marks in (select MIN(course.Marks) from course group by course_name)
    
    --Q6
    select city,COUNT(city) from students group by city
    
    --Q7 need to work
    
    select  city from students where city in (select city from students group by city having count(city)>2)
    
    select city from students group by city having count(city)>2
    
    --Q8
    
    select * from students where student_name like 'A%'
    
    --Q10
    
    select city,count(student_name)as NumberOfStudents from students group by city
    
    
 /*Question 8*/
 
 create table activity
 (
 player_id int,
 device_id int,
 event_date date,
 games_played int
 constraint comp_key PRIMARY KEY(player_id,event_date)
 )
 
 insert into activity values
(1,2,'2016-03-01',5),
(1,2,'2016-05-02',6),
(2,3,'2017-06-25',1),
(3,1,'2016-03-02',0),
(3,4,'2018-07-03',5)
 
 
 select * from activity
 
 
 select player_id,MIN(event_date) from activity group by player_id
 
  /*Question 10*/
  
  --Q1
  select name as Country,SUM(population) as TotalPopulation from world group by name
  
  --Q2
  select COUNT(*) as NoofCountries from world where population < 150000
  
  --Q3
  select AVG(gdp) as AvgGDP from world
  select MAX(population) as MaxPopulation from world
  select MIN(gdp)as MinGDP from world
  select COUNT(continent) as NoofContinents from world
  
  --Q4
  --NA
  
  --Q5
  select sum(population)/3 as AvgPopulation from world where name in ('Poland','Germany','Denmark')
  
  --Q6
  select name as Country,(population/area) as PopulationDensity from world
  --Q7
  select name as Contry,(population/area) as PopulationDensity from world 
  where population in (select MAX(population) from world)
  
  
  
 
  
  
  
  
 
 
 
 