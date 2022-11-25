--I have used SSMS and answered all queries in SQL SERVER
--Few questions are IN PROGRESS commented as PENDING
--Few questions are duplicated written them as QUESTIONS ARE SAME


create database sqlassignment 

use sqlassignment 

--Q1
create table city (
  Id int,
  name varchar(17),
  countryCode varchar(3),
  district varchar(20),
  population int
)


insert into
  city
values
  (6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321),
  (3878, 'Scottsdale', 'USA', 'Arizona', 202705),
  (3965, 'Corona', 'USA', 'California', 124966),
  (3973, 'Concord', 'USA', 'California', 121780),
  (3977, 'Cedar Rapids', 'USA', 'Iowa', 120758),
  (3982, 'Coral Springs', 'USA', 'Florida', 117549),
  (4054, 'Fairfield', 'USA', 'California', 92256),
  (4058, 'Boulder', 'USA', 'Colorado', 91238),
  (
    4061,
    'Fall River',
    'USA',
    'Massachusetts',
    90555
  )
  
  
select
  *
from
  city 
  
  
select
  *
from
  city
where
  countryCode = 'USA'
  and population > 100000 
  
--Q2

select
  name
from
  city
where
  countryCode = 'USA'
  and population > 120000 
  
--Q3

select
  *
from
  city 
  
--Q4
update
  city
set
  Id = 1661
where
  id = 6
  
  
select
  *
from
  city
where
  Id = 1661 
  
  
--Q5
select
  *
from
  city
where
  countryCode = 'JPN' 
  
--Q6
select
  name
from
  city
where
  countryCode = 'JPN' create table station (
    id int,
    city varchar(20),
    state varchar(2),
    lat_N int,
    long_w int
  )
insert into
  station
values
  (794, 'Kissee Mills', 'MO', 139, 73),
  (824, 'Loma Mar', 'CA', 48, 130),
  (603, 'Sandy Hook', 'CT', 72, 148),
  (478, 'Tipton', 'IN', 33, 97),
  (619, 'Arlington', 'CO', 75, 92),
  (711, 'Turner', 'AR', 50, 101),
  (839, 'Slidell', 'LA', 85, 151),
  (411, 'Negreet', 'LA', 98, 105),
  (588, 'Glencoe', 'KY', 46, 136),
  (665, 'Chelsea', 'IA', 98, 59),
  (342, 'Chignik Lagoon', 'AK', 103, 153),
  (733, 'Pelahatchie', 'MS', 38, 28),
  (441, 'Hanna City', 'IL', 50, 136),
  (811, 'Dorrance', 'KS', 102, 121),
  (698, 'Albany', 'CA', 49, 80),
  (325, 'Monument', 'KS', 70, 141),
  (414, 'Manchester', 'MD', 73, 37),
  (113, 'Prescott', 'IA', 39, 65),
  (971, 'Graettinger', 'IA', 94, 150),
  (266, 'Cahone', 'CO', 116, 127)
  
select
  *
from
  station 
  
--Q7

select
  city,
  state
from
  station 
  
--Q8

select
  distinct id,
  city
from
  station
where
  id % 2 = 0 
  
--Q9
select
  (COUNT(city) - COUNT(distinct city)) as Difference
from
  station
select
  *
from
  station 
  
  --Q11
select
  distinct(city)
from
  station
where
  city like 'a%'
  or city like 'e%'
  or city like 'i%'
  or city like 'o%'
  or city like 'u%' 
  
--Q12
select
  distinct(city)
from
  station
where
  city like '%a'
  or city like '%e'
  or city like '%i'
  or city like '%o'
  or city like '%u' 
  
--Q13
select
  distinct(city)
from
  station
where
  city not like 'a%'
  and city not like 'e%'
  and city not like 'i%'
  and city not like 'o%'
  and city not like 'u%' 
  
--Q14
select
  distinct(city)
from
  station
where
  city not like '%a'
  and city not like '%e'
  and city not like '%i'
  and city not like '%o'
  and city not like '%u' 
  
--Q15
select
  distinct(city)
from
  station
where
  city not like 'a%' 
  
--Q16
select
  distinct(city)
from
  station
where
  city not like '%a'
  and city not like '%e'
  and city not like '%i'
  and city not like '%o'
  and city not like '%u'
  and city not like 'a%'
  and city not like 'e%'
  and city not like 'i%'
  and city not like 'o%'
  and city not like 'u%' 
  
--Q17
  create table product (
    product_id int primary key,
    product_name varchar(20),
    unit_price int
  )
  
  
insert into
  product
values
  (1, 'S8', 1000),
  (2, 'G4', 800),
  (3, 'iPhone', 1400) create table sales (
    seller_id int,
    product_id int foreign key references product(product_id),
    buyer_id int,
    sale_date date,
    quantity int,
    price int
  )
  
  
insert into
  sales
values
  (1, 1, 1, '2019-01-21', 2, 2000),
  (1, 2, 2, '2019-02-17', 1, 800),
  (2, 2, 3, '2019-06-02', 1, 800),
  (3, 3, 4, '2019-05-13', 2, 2800)
  
  
select
  *
from
  product
  
  
select
  *
from
  sales
  
  
select
  *
from
  sales
where
  sale_date between 2019 -01 -01
  and 2019 -03 -31
select
  product.product_id,
  product.product_name
from
  product
  right join sales on product.product_id = sales.product_id
where
  sales.sale_date between '2019-01-01'
  and '2019-03-31' 
  
--Q18

  create table tblview (
    article_id int,
    author_id int,
    viewer_id int,
    view_date date
  )
  
  
insert into
  tblview
values
  (1, 3, 5, '2019-08-01'),
  (1, 3, 6, '2019-08-02'),
  (2, 7, 7, '2019-08-01'),
  (2, 7, 6, '2019-08-02'),
  (4, 7, 1, '2019-07-22'),
  (3, 4, 4, '2019-07-21'),
  (3, 4, 4, '2019-07-21')
  
  
select
  *
from
  tblview
  
  
select
  distinct author_id
from
  tblview
where
  author_id = viewer_id 
  
--Q19
  create table delivery (
    delivery_id int primary key,
    customer_id int,
    order_date date,
    customer_pref_delivery_date date
  )
  
  
insert into
  delivery
values
  (1, 1, '2019-08-01', '2019-08-02'),
  (2, 5, '2019-08-02', '2019-08-02'),
  (3, 1, '2019-08-11', '2019-08-11'),
  (4, 3, '2019-08-24', '2019-08-26'),
  (5, 4, '2019-08-21', '2019-08-22'),
  (6, 2, '2019-08-11', '2019-08-13')
  
  
select
  *
from
  delivery
  
  
select
  round(
    100 * sum(
      case when order_date = customer_pref_delivery_date then 1 else 0 end
    ) / count(1),
    2
  ) immediate_percentage
from
  delivery 
  
--Q20
  create table ads (
    ad_id int,
    user_id int,
    action varchar(30) primary key(ad_id, user_id)
  )
  
  
insert into
  ads
values
  (1, 1, 'Clicked'),
  (2, 2, 'Clicked'),
  (3, 3, 'Viewed'),
  (5, 5, 'Ignored'),
  (1, 7, 'Ignored'),
  (2, 7, 'Viewed'),
  (3, 5, 'Clicked'),
  (1, 4, 'Viewed'),
  (2, 11, 'Viewed'),
  (1, 2, 'Clicked')
  
  
select
  ad_id,
  round(
    avg(case when action = 'Clicked' then 1 else 0 end) * 100,
    2
  ) ctr
from
  ads
group by
  ad_id
order by
  ad_id,
  ctr desc 
  
--Q21
  create table emp (
  employee_id int primary key, 
  team_id int
  )
  
  
insert into
  emp
values
  (1, 8),
  (2, 8),
  (3, 8),
  (4, 7),
  (5, 9),
  (6, 9) 
  
create view team_size as
select
  team_id,
  COUNT(team_id) as team_size
from
  emp
group by
  team_id
  
  
select
  emp.employee_id,
  team_size.team_size
from
  emp
  left join team_size on emp.team_id = team_size.team_id 
  
--Q22
  create table countries (
    country_id int primary key,
    country_name varchar(20)
  ) 
  
  create table weather (
    country_id int,
    weather_state int,
    day date constraint con_day primary key(country_id, day)
  )
  
  
insert into
  countries
values
  (2, 'USA'),
  (3, 'Australia'),
  (7, 'Peru'),
  (5, 'China'),
  (8, 'Morocco'),
  (9, 'Spain')
  
  
insert into
  weather
values
  (2, 15, '2019-11-01'),
  (2, 12, '2019-10-28'),
  (2, 12, '2019-10-27'),
  (3, -2, '2019-11-10'),
  (3, 0, '2019-11-11'),
  (3, 3, '2019-11-12'),
  (5, 16, '2019-11-07'),
  (5, 18, '2019-11-09'),
  (5, 21, '2019-11-23'),
  (7, 25, '2019-11-28'),
  (7, 22, '2019-12-01'),
  (7, 20, '2019-12-02'),
  (8, 25, '2019-11-05'),
  (8, 27, '2019-11-15'),
  (8, 31, '2019-11-25'),
  (9, 7, '2019-10-23'),
  (9, 3, '2019-12-23')
  
  
select
  *
from
  countries
  
  
select
  *
from
  weather with con as(
    select
      weather.country_id,
      countries.country_name,
      weather.weather_state
    from
      countries
      right join weather on countries.country_id = weather.country_id
    where
      weather.day between '2019-11-01'
      and '2019-11-30'
  )
  
  
select
  country_name,
  case when AVG(weather_state) <= 15 then 'cold' when AVG(weather_state) >= 25 then 'hot' else 'warm' end
from
  con
group by
  country_name 
  
  
--Q23
  create table prices (
    product_id int,
    start_date date,
    end_date date,
    price int constraint prices_pk primary key(product_id, start_date, end_date)
  ) 
  
create table unitsold (
	product_id int, 
	purchase_date date, 
	units int
	)


insert into
  prices
values
  (1, '2019-02-17', '2019-02-28', 5),
  (1, '2019-03-01', '2019-03-22', 20),
  (2, '2019-02-01', '2019-02-20', 15),
  (2, '2019-02-21', '2019-03-31', 30)
  
insert into
  unitsold
values
  (1, '2019-02-25', 100),
  (1, '2019-03-01', 15),
  (2, '2019-02-10', 200),
  (2, '2019-03-22', 30)

select
  *
from
  prices
select
  *
from
  unitsold

select
  unitsold.product_id,
  round(sum(units * price) / sum(units), 2) as average_price
from
  unitsold
  inner join prices on unitsold.product_id = prices.product_id
  and unitsold.purchase_date between prices.start_date
  and prices.end_date
group by
  unitsold.product_id 
  
  
--Q24
  create table activity (
    player_id int,
    device_id int,
    event_date date,
    games_played int constraint comp_key PRIMARY KEY(player_id, event_date)
  )
  
  
insert into
  activity
values
  (1, 2, '2016-03-01', 5),
  (1, 2, '2016-05-02', 6),
  (2, 3, '2017-06-25', 1),
  (3, 1, '2016-03-02', 0),
  (3, 4, '2018-07-03', 5)
  
  
select
  *
from
  activity
select
  player_id,
  MIN(event_date)
from
  activity
group by
  player_id 
  
--Q25
select
  player_id,
  device_id
from
  activity
where
  event_date in (
    select
      MIN(event_date)
    from
      activity
    group by
      player_id
  ) 
  
--Q26
  create table products_26 (
    product_id int primary key,
    product_name varchar(50),
    product_category varchar(20)
  ) 
  
  create table orders_26 (
  product_id int, 
  order_date date, unit int
  )
  
  
insert into
  products_26
values
  (1, 'Leetcode Solutions', 'Book'),
  (2, 'Jewels of Stringology', 'Book'),
  (3, 'HP', 'Laptop'),
  (4, 'Lenovo', 'Laptop'),
  (5, 'Leetcode Kit', 'T-shirt')
  
  
insert into
  orders_26
values
  (1, '2020-02-05', 60),
  (1, '2020-02-10', 70),
  (2, '2020-01-18', 30),
  (2, '2020-02-11', 80),
  (3, '2020-02-17', 2),
  (3, '2020-02-24', 3),
  (4, '2020-03-01', 20),
  (4, '2020-03-04', 30),
  (4, '2020-03-04', 60),
  (5, '2020-02-25', 50),
  (5, '2020-02-27', 50),
  (5, '2020-03-01', 50)
  
  
select
  *
from
  products_26
  
  
select
  *
from
  orders_26 with pro_ord_26 as(
    select
      products_26.product_id,
      products_26.product_name,
      orders_26.order_date,
      orders_26.unit
    from
      products_26
      left join orders_26 on products_26.product_id = orders_26.product_id
    where
      orders_26.order_date between '2020-02-01'
      and '2020-02-28'
  )
  
  
select
  product_name,
  SUM(unit) as unit
from
  pro_ord_26
group by
  product_name
having
  SUM(unit) >= 100 
  
--Q27
  create table users (
    user_id int,
    name varchar(50),
    mail varchar(50)
  )
  
  
insert into
  users
values
  (1, 'Winston', 'winston@leetcode.com'),
  (2, 'Jonathan', 'jonathanisgreat'),
  (3, 'Annabelle', 'bella-@leetcode.com'),
  (4, 'Sally', 'sally.come@leetcode.com'),
  (5, 'Marwan', 'quarz#2020@leetcode.com'),
  (6, 'David', 'david69@gmail.com'),
  (7, 'Shapiro', '.shapo@leetcode.com')
  
  
select
  *
from
  users
  
  
select
  mail
from
  users
where
  mail like '[A-Z0-9]%[@][leetcode.com]%' 
  
--Q28  --pending
  create table Customers (
    customer_id int primary key,
    name varchar(30),
    country varchar(30)
  ) 
  create table product_28 (
    product_id int primary key,
    description varchar(30),
    price int
  ) 
  create table orders_28 (
    order_id int primary key,
    customer_id int,
    product_id int,
    order_date date,
    quantity int
  )
  
insert into
  Customers
values
  (1, 'Winston', 'USA'),
  (2, 'Jonathan', ' Peru'),
  (3, 'Moustafa', ' Egypt')
  
  
insert into
  product_28
values
  (10, 'LC Phone', 300),
  (20, 'LC T-Shirt', 10),
  (30, 'LC Book', 45),
  (40, 'LC Keychain', 2)
  
  
insert into
  orders_28
values
  (1, 1, 10, '2020-06-10', 1),
  (2, 1, 20, '2020-07-01', 1),
  (3, 1, 30, '2020-07-08', 2),
  (4, 2, 10, '2020-06-15', 2),
  (5, 2, 40, '2020-07-01', 10),
  (6, 3, 20, '2020-06-24', 2),
  (7, 3, 30, '2020-06-25', 2),
  (9, 3, 30, '2020-05-08', 3)

select
  *
from
  Customers

select
  *
from
  product_28

select
  *
from
  orders_28 
  
--Q29
  create table tvprogram (
    program_date date,
    content_id int,
    channel varchar(50) primary key(program_date, content_id)
  ) 
  create table content (
    content_id varchar(50),
    title varchar(50),
    Kids_content char(5),
    content_type varchar(50),
    primary key(content_id)
  )
  
insert into
  tvprogram
values
  ('2020-06-10 08:00', 1, 'LC-Channel'),
  ('2020-05-11 12:00', 2, 'LC-Channel'),
  ('2020-05-12 12:00', 3, 'LC-Channel'),
  ('2020-05-13 14:00', 4, 'Disney Ch'),
  ('2020-06-18 14:00', 4, 'Disney Ch'),
  ('2020-07-15 16:00', 5, 'Disney Ch')

insert into
  content
values
  (1, 'Leetcode Movie', 'N', 'Movies'),
  (2, 'Alg. for Kids', 'Y', 'Series'),
  (3, 'Database Sols', 'N', 'Series'),
  (4, 'Aladdin', 'Y', 'Movies'),
  (5, 'Cinderella', 'Y', 'Movies')

select
  content.title
from
  content
  left join tvprogram on tvprogram.content_id = content.content_id
where
  content.Kids_content = 'Y'
  and tvprogram.program_date between '2020-06-01 00:00:00'
  and '2020-06-30 23:59:59' 
  
--Q30 & Q31 are same

  create table npv (
  id int, 
  year int, 
  npv int primary key(id, year)
  ) 
  
  create table queries (
  id int, 
  year int primary key(id, year)
  )


insert into
  npv
values
  (1, 2018, 100),
  (7, 2020, 30),
  (13, 2019, 40),
  (1, 2019, 113),
  (2, 2008, 121),
  (3, 2009, 12),
  (11, 2020, 99),
  (7, 2019, 0)

insert into
  queries
values
  (1, 2019),
  (2, 2008),
  (3, 2009),
  (7, 2018),
  (7, 2019),
  (7, 2020),
  (13, 2019)

select
  queries.id,
  queries.year,
  npv.npv
from
  npv
  right join queries on npv.id = queries.id
  and npv.year = queries.year 
  
--Q32
  create table employees_32 (
  id int primary key, 
  name varchar(30)
  ) 
  
  create table employeeUNI (
    id int,
    unique_id int primary key(id, unique_id)
  )
  
  
insert into
  employees_32
values
  (1, 'Alice'),
  (7, 'Bob'),
  (11, 'Meir'),
  (90, 'Winston'),
  (3, 'Jonathan')


insert into
  employeeUNI
values
  (3, 1),
  (11, 2),
  (90, 3)


select
  employees_32.name,
  employeeUNI.unique_id
from
  employees_32
  left join employeeUNI on employees_32.id = employeeUNI.id 
  
--Q33
  create table users_33 (
  id int primary key, 
  name varchar(30)
  ) 
  
  create table rides (
  id int, user_id int, distance int
  )
  
insert into
  users_33
values
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Alex'),
  (4, 'Donald'),
  (7, 'Lee'),
  (13, 'Jonathan'),
  (19, 'Elvis')

insert into
  rides
values
  (1, 1, 120),
  (2, 2, 317),
  (3, 3, 222),
  (4, 7, 100),
  (5, 13, 312),
  (6, 19, 50),
  (7, 7, 120),
  (8, 19, 400),
  (9, 7, 230)

select
  users_33.name,
  rides.distance
from
  users_33
  left join rides on users_33.id = rides.user_id
  and users_33.id = rides.id
order by
  rides.distance desc,
  name asc 
  
--Q34 No complete data
--Q35 --pending
  create table movies (
  movie_id int primary key, title varchar(30)
  ) 
  
  create table users_35 (
  user_id int primary key, name varchar(30)
  ) 
  
  create table movierating (
    movie_id int,
    user_id int,
    rating int,
    created_at date primary key(movie_id, user_id)
  )
  
insert into
  movies
values
  (1, 'Avengers'),
  (2, 'Frozen 2'),
  (3, 'Joker')

insert into
  users_35
values
  (1, 'Daniel'),
  (2, 'Monica'),
  (3, 'Maria'),
  (4, 'James')

insert into
  movierating
values
  (1, 1, 3, '2020-01-12'),
  (1, 2, 4, '2020-02-11'),
  (1, 3, 2, '2020-02-12'),
  (1, 4, 1, '2020-01-01'),
  (2, 1, 5, '2020-02-17'),
  (2, 2, 2, '2020-02-01'),
  (2, 3, 2, '2020-03-01'),
  (3, 1, 3, '2020-02-22'),
  (3, 2, 4, '2020-02-25')


select
  *
from
  movierating with rat as(
    select
      movie_id,
      AVG(cast(rating as Decimal(2, 1))) as avg_rating
    from
      movierating
    where
      created_at between '2020-02-01'
      and '2020-02-26'
    group by
      movie_id
  )
  
  
select
  rat1.avg_rating
from
  rat rat1,
  rat rat2
where
  rat1.avg_rating > rat2.avg_rating 
  
--Q36&Q33 are same

--Q37&Q32 are same

--Q38
  create table dept_38 (
  id int primary key, 
  name varchar(30)
  ) 
  
  create table student_38 (
    id int primary key,
    name varchar(30),
    department_id int
  )
  
  
insert into
  dept_38
values
  (1, 'Electrical Engineering'),
  (7, 'Computer Engineering'),
  (13, 'Business Administration')


insert into
  student_38
values
  (23, 'Alice', 1),
  (1, 'Bob', 7),
  (5, 'Jennifer', 13),
  (2, 'John', 14),
  (4, 'Jasmine', 77),
  (3, 'Steve', 74),
  (6, 'Luis', 1),
  (8, 'Jonathan', 7),
  (7, 'Daiana', 33),
  (11, 'Madelynn', 1)


select
  student_38.id,
  student_38.name,
  student_38.department_id
from
  student_38
  left join dept_38 on dept_38.id = student_38.department_id
where
  student_38.department_id not in (
    select
      id
    from
      dept_38
  ) 
  
--Q39
  create table calls (
  from_id int, 
  to_id int, 
  duration int
  )
  
  
insert into
  calls
values
  (1, 2, 59),
  (2, 1, 11),
  (1, 3, 20),
  (3, 4, 100),
  (3, 4, 200),
  (3, 4, 200),
  (4, 3, 499)
  
  
select
  from_id,
  to_id,
  count(duration) as call_count,
  sum(duration) as total_duration
from
  (
    select
      *
    from
      Calls
    union all
    select
      to_id,
      from_id,
      duration
    from
      Calls
  ) a
where
  from_id < to_id
group by
  from_id,
  to_id 
  
--Q40

  create table prices_39 (
    product_id int,
    start_date date,
    end_date date,
    price int primary key(product_id, start_date, end_date)
  ) 
  
  create table unitssold (
  product_id int, 
  purchase_date date, 
  units int
  )
  
  
insert into
  prices_39
values
  (1, '2019-02-17', '2019-02-28', 5),
  (1, '2019-03-01', '2019-03-22', 20),
  (2, '2019-02-01', '2019-02-20', 15),
  (2, '2019-02-21', '2019-03-31', 30)


insert into
  unitsold
values
  (1, '2019-02-25', 100),
  (1, '2019-03-01', 15),
  (2, '2019-02-10', 200),
  (2, '2019-03-22', 30)


select
  *
from
  prices_39


select
  *
from
  unitsold with units_price as(
    select
      prices_39.product_id,
      price,
      units,
      price * units as pricesum
    from
      prices_39
      left join unitsold on prices_39.product_id = unitsold.product_id
      and purchase_date between start_date
      and end_date
  )
  
  
select
  product_id,
  cast((sum(pricesum) / SUM(units)) as decimal(5, 2)) as avg_price
from
  units_price
group by
  product_id
  
 --Q41
  create table warehouse (
    name varchar(30),
    product_id int,
    units int primary key(name, product_id)
  ) 
  
  create table products_40 (
    product_id int primary key,
    product_name varchar(30),
    Width int,
    Length int,
    Height int
  )
  
  
insert into
  warehouse
values
  ('LCHouse1', 1, 1),
  ('LCHouse1', 2, 10),
  ('LCHouse1', 3, 5),
  ('LCHouse2', 1, 2),
  ('LCHouse2', 2, 2),
  ('LCHouse3', 4, 1)


insert into
  products_40
values
  (1, 'LC-TV', 5, 50, 40),
  (2, 'LC-KeyChain', 5, 5, 5),
  (3, 'LC-Phone', 2, 10, 10),
  (4, 'LC-T-Shirt', 4, 10, 20) with vol as(
    
    
select
      warehouse.name,
      units * Width * Length * Height as volume
    from
      warehouse
      left join products_40 on warehouse.product_id = products_40.product_id
  )


select
  name,
  sum(volume) as inventory
from
  vol
group by
  name 
  
--Q42
  create table sales_42 (
    sale_date date,
    fruit varchar(20),
    sold_num int primary key(sale_date, fruit)
  )
  
  
insert into
  sales_42
values
  ('2020-05-01', 'apples', 10),
  ('2020-05-01', 'oranges', 8),
  ('2020-05-02', 'apples', 15),
  ('2020-05-02', 'oranges', 15),
  ('2020-05-03', 'apples', 20),
  ('2020-05-03', 'oranges', 0),
  ('2020-05-04', 'apples', 15),
  ('2020-05-04', 'oranges', 16)


select
  *
from
  sales_42


select
  s1.sale_date,
  s1.sold_num - s2.sold_num
from
  sales_42 s1
  left join sales_42 s2 on s1.sale_date = s2.sale_date
where
  s1.fruit = 'apples'
  and s2.fruit = 'oranges' 
  
--Q43
  create table activity_43 (
    player_id int,
    device_id int,
    event_date date,
    games_played int primary key(player_id, event_date)
  )
  
  
insert into
  activity_43
values
  (1, 2, '2016-03-01', 5),
  (1, 2, '2016-03-02', 6),
  (2, 3, '2017-06-25', 1),
  (3, 1, '2016-03-02', 0),
  (3, 4, '2018-07-03', 5) WITH first_log AS (
    SELECT
      player_id,
      MIN(event_date) as first_login
    FROM
      Activity
    GROUP BY
      player_id
  )
  
  
SELECT
  ROUND(
    SUM(
      CASE WHEN DATEDIFF(day, event_date, first_login) = 1 THEN 1 ELSE 0 END
    ) / COUNT(DISTINCT first_log.player_id),
    2
  ) as fraction
FROM
  activity
  JOIN first_log ON activity.player_id = first_log.player_id
  
 --Q44
  create table employee_44 (
    id int primary key,
    name varchar(30),
    department varchar(30),
    managerId int
  )
  
  
insert into
  employee_44
values
  (101, 'John', 'A', null),
  (102, 'Dan', 'A', 101),
  (103, 'James', 'A', 101),
  (104, 'Amy', 'A', 101),
  (105, 'Anne', 'A', 101),
  (106, 'Ron', 'B', 101)


select
  e1.name
from
  employee_44 e1
  inner join employee_44 e2 on (e1.id = e2.managerid)
group by
  e1.name
having
  count(distinct e2.id) >= 5 
  
  
--Q45
  create table student_45 (
    student_id int primary key,
    student_name varchar(30),
    gender varchar(30),
    dept_id int foreign key references department_45(dept_id)
  ) 
  
  create table department_45 (
  dept_id int primary key, 
  dept_name varchar(30)
  )


insert into
  student_45
values
  (1, 'Jack', 'M', 1),
  (2, 'Jane', 'F', 1),
  (3, 'Mark', 'M', 2)


insert into
  department_45
values
  (1, 'Engineering'),
  (2, 'Science'),
  (3, 'Law')


select
  d.dept_name,
  COUNT(s.student_id) as student_number
from
  department_45 as d
  left join student_45 as s on d.dept_id = s.dept_id
group by
  d.dept_name
order by
  student_number desc,
  d.dept_name asc 
  
--Q46
  create table customer_46 (
    customer_id int,
    product_key int foreign key references product_46(product_key)
  ) 
  
  create table product_46 (
  product_key int primary key
  )


insert into
  customer_46
values
  (1, 5),
  (2, 6),
  (3, 5),
  (3, 6),
  (1, 6)


insert into
  product_46
values
  (5),
  (6)


select
  customer_id
from
  customer_46
group by
  customer_id
having
  COUNT(distinct product_key) = (
    select
      COUNT(*)
    from
      product_46
  ) 
  
--Q47
  create table project (
    project_id int,
    employee_id int primary key(project_id, employee_id)
  ) create table employee_47 (
    employee_id int primary key,
    name varchar(30),
    experience_years int
  )
  
  
insert into
  project
values
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 4)
  
  
insert into
  employee_47
values
  (1, 'Khaled', 3),
  (2, 'Ali', 2),
  (3, 'John', 3),
  (4, 'Doe', 2)
  
  
select
  p.project_id,
  e.employee_id,
  e.experience_years,
  Rank() over (
    partition by project_id
    order by
      experience_years desc
  ) as rank_experience
from
  Project p
  join employee_47 e on p.employee_id = e.employee_id --where p.rank_experience=1
  
  
--Q48 --insufficient data
  create table books_48 (
    book_id int primary key,
    name varchar(30),
    available_from date
  ) 
  create table orders_48 (
    order_id int primary key,
    book_id int foreign key references books_48(book_id),
    quantity int,
    dispatch_date date
  )
  
  
insert into
  books_48
values
  (1, 'Kalila And Demna', '2010-01-01'),
  (2, '28 Letters', '2012-05-12'),
  (3, 'The Hobbit', '2019-06-10'),
  (4, '13 Reasons Why', '2019-06-01'),
  (5, 'The Hunger Games', '2008-09-21') 
  
--Q49
  create table enrollment (
    student_id int,
    course_id int,
    grade int,
    primary key(student_id, course_id)
  )
  
  
insert into
  enrollment
values
  (2, 2, 95),
  (2, 3, 95),
  (1, 1, 90),
  (1, 2, 99),
  (3, 1, 80),
  (3, 2, 75),
  (3, 3, 82)
  
  
SELECT
  student_id,
  course_id,
  grade
FROM
  (
    SELECT
      student_id,
      course_id,
      grade,
      desnse_rank() over(
        partition by student_id orders_26 by grade desc,
        course_id
      ) as rnk
    FROM
      enrollment
  ) x
WHERE
  rnk = 1
ORDER BY
  1 
  
--Q50 --pending
  create table teams (
  team_id int primary key, 
  team_name varchar(30)
  ) 
  
  create table matches (
    match_id int primary key,
    host_team int,
    guest_team int,
    host_goals int,
    guest_goals int
  )
  
  
insert into
  teams
values
  (15, 1),
  (25, 1),
  (30, 1),
  (45, 1),
  (10, 2),
  (35, 2),
  (50, 2),
  (20, 3),
  (40, 3)
insert into
  matches
values
  (1, 15, 45, 3, 0),
  (2, 30, 25, 1, 2),
  (3, 30, 15, 2, 0),
  (4, 40, 20, 5, 2),
  (5, 35, 50, 1, 1)
