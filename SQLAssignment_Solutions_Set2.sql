use sqlassignment

--Q51

create table world (
  name varchar(30) primary key,
  continent varchar(30),
  area int,
  population bigint,
  gdp bigint
  )


insert into
  world
values
  ('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
  ('Albania', 'Europe', 28748, 2831741, 12960000000),
  ('Algeria', 'Africa', 2381741, 37100000, 188681000000),
  ('Andorra', 'Europe', 468, 78115, 3712000000),
  ('Angola', 'Africa', 1246700, 20609294, 100990000000
  
  
select
  name,
  population,
  area
from
  world
where
  area > 3000000
  or population > 25000000 
  
--Q52
  create table customer_52 (
    id int primary key,
    name varchar(30),
    referee_id int
  )
  
  
insert into
  customer_52
values
  (1, 'Will', null),
  (2, 'Jane', null),
  (3, 'Alex', 2),
  (4, 'Bill', null),
  (5, 'Zack', 1),
  (6, 'Mark', 2)
select
  name
from
  customer_52
where
  referee_id <> 2
  OR referee_id IS NUL
  
--Q53
  create table customers_53 (
  id int primary key, name varchar(30)
  ) 
  
  create table orders_53 (
    id int primary key,
    customerId int foreign key references customers_53(id)
  )
  
  
insert into
  customers_53
values
  (1, 'Joe'),
  (2, 'Henry'),
  (3, 'Sam'),
  (4, 'Max')
  
  
insert into
  orders_53
values
  (1, 3),
  (2, 1)
  
  
select
  Name as Customers
from
  customers_53
where
  Id not in(
    select
      CustomerId
    from
      orders_53
  ) 
  
--Q54
  create table employee_54 (
  employee_id int primary key, 
  team_id int
  )
  
  
insert into
  employee_54
values
  (1, 8),
  (2, 8),
  (3, 8),
  (4, 7),
  (5, 9),
  (6, 9)
  
  
select
  e1.employee_id,
  count(e2.employee_id) as team_size
from
  employee_54 e1
  inner join employee_54 e2 on e1.team_id = e2.team_id
group by
  e1.employee_id,
  e2.team_id 
  
--Q55  --pending
  create table person_55 (
    id int primary key,
    name varchar(30),
    phone_number varchar(20)
  ) 
  
  create table country_55 (
    name varchar(30),
    country_code varchar(30) primary key
  ) 
  
  create table calls_55 (
  caller_id int, 
  callee_id int, 
  duration int
  )
  
  
insert into
  person_55
values
  (3, 'Jonathan', '051-1234567'),
  (12, 'Elvis', '051-7654321'),
  (1, 'Moncef', '212-1234567'),
  (2, 'Maroua', '212-6523651'),
  (7, 'Meir', '972-1234567'),
  (9, 'Rachel', '972-0011100')
  
  
insert into
  country_55
values
  ('Peru', 51),
  ('Israel', 972),
  ('Morocco', 212),
  ('Germany', 49),
  ('Ethiopia', 251)
  
  
insert into
  calls_55
values
  (1, 9, 33),
  (2, 9, 4),
  (1, 2, 59),
  (3, 12, 102),
  (3, 12, 330),
  (12, 3, 5),
  (7, 9, 13),
  (7, 1, 3),
  (9, 7, 1),
  (1, 7, 7)
  
  
select
  c.name as country
from
  person_55 p
  inner join country_55 c on left (p.phone_number, 3) = c.country_code
  inner join (
    select
      caller_id as id,
      duration
    from
      calls_55
    union all
    select
      callee_id as id,
      duration
    from
      calls_55
  ) phn on p.id = phn.id
group by
  country_code
having
  avg(duration) > (
    select
      avg(duration)
    from
      calls_55
  ) 
  
--Q56
  create table activity_56 (
    player_id int,
    device_id int,
    event_date date,
    games_played int primary key(player_id, event_date)
  )
  
  
insert into
  activity_56
values
  (1, 2, '2016-03-01', 5),
  (1, 2, '2016-05-02', 6),
  (2, 3, '2017-06-25', 1),
  (3, 1, '2016-03-02', 0),
  (3, 4, '2018-07-03', 5)
  
  
select
  player_id,
  device_id
from
  activity_56
where
  event_date in(
    select
      min(event_date) as first_login
    from
      activity_56
    group by
      player_id
  ) 
  
--Q57
  create table orders_57 (
    order_number int primary key,
    customer_number int
  )
  
  
insert into
  orders_57
values
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 3)
  
  
select
  customer_number
from
  orders_57
group by
  customer_number
order by
  COUNT(customer_number) DESC 
  
--58
  create table cinema (
    seat_id int IDENTITY(1, 1) primary key,
    free bit
  ) 
  
  --SET IDENTITY_INSERT cinema off
  
  
insert into
  cinema
values
  (1),
  (0),
  (1),
  (1),
  (1)
  
  
select
  *
from
  cinema
  
  
select
  t1.seat_id
from
  cinema AS t1
  join cinema AS t2 ON abs(t1.seat_id - t2.seat_id) = 1
  AND t1.free = 1
  AND t2.free = 1
order by
  1 
  
--Q59
  create table salesperson (
    sales_id int primary key,
    name varchar(30),
    salary int,
    commission_rate int,
    hire_date date
  ) 
  
  create table company (
    com_id int primary key,
    name varchar(30),
    city varchar(30)
  ) 
  
  create table orders_59 (
    order_id int primary key,
    order_date date,
    com_id int foreign key references company(com_id),
    sales_id int foreign key references salesperson(sales_id),
    amount int
  )
  
  
insert into
  salesperson
values
  (1, 'John', 100000, 6, '4/1/2006'),
  (2, 'Amy', 12000, 5, '5/1/2010'),
  (3, 'Mark', 65000, 12, '12/25/2008'),
  (4, 'Pam', 25000, 25, '1/1/2005'),
  (5, 'Alex', 5000, 10, '2/3/2007')
  
  
insert into
  company
values
  (1, 'RED', 'Boston'),
  (2, 'ORANGE', 'New York'),
  (3, 'YELLOW', 'Boston'),
  (4, 'GREEN', 'Austin')
  
  
insert into
  orders_59
values
  (1, '1/1/2014', 3, 4, 10000),
  (2, '2/1/2014', 4, 5, 5000),
  (3, '3/1/2014', 1, 1, 50000),
  (4, '4/1/2014', 1, 4, 25000)
  
  
select
  name
from
  salesperson
where
  sales_id NOT IN (
    select
      s.sales_id
    from
      orders_59 o
      INNER join salesperson s ON o.sales_id = s.sales_id
      INNER join company c ON o.com_id = c.com_id
    where
      c.name = 'RED'
  ) 
  
--Q60
  create table triangle (
  x int, 
  y int, 
  z int)
  
  
insert into
  triangle
values
  (13, 15, 30),
  (10, 20, 15)
  
  
select
  x,
  y,
  z,
  case when (
    x + y > z
    AND y + z > x
    AND z + x > y
  ) then 'Yes' else 'No' end
from
  triangle 
  
  
--Q61
  create table point (
  x int primary key
  )
  
  
insert into
  point
values
  (-1),
  (0),
  (2)
  
  
select
  min(abs(p1.x - p2.x)) shortest
from
  point p1,
  point p2
where
  p1.x <> p2.x 
  
--Q62
  create table actordirector (
    actor_id int,
    director_id int,
    timestamp int primary key
  )
  
  
insert into
  actordirector
values
  (1, 1, 0),
  (1, 1, 1),
  (1, 1, 2),
  (1, 2, 3),
  (1, 2, 4),
  (2, 1, 5),
  (2, 1, 6)
  
  
select
  actor_id,
  director_id
from
  actordirector
group by
  actor_id,
  director_id
having
  COUNT(*) >= 3 
  
--Q63
  create table sales_63 (
    sale_id int,
    product_id int foreign key references products_63(product_id),
    year int,
    quantity int,
    price int,
    primary key(sale_id, year)
  ) 
  
  create table products_63 (
    product_id int primary key,
    product_name varchar(30)
  )
  
  
insert into
  sales_63
values
  (1, 100, 2008, 10, 5000),
  (2, 100, 2009, 12, 5000),
  (7, 200, 2011, 15, 9000)
  
  
insert into
  products_63
values
  (100, 'Nokia'),
  (200, 'Apple'),
  (300, 'Samsung')
  
  
select
  p.product_name,
  s.year,
  s.price
from
  products_63 p
  join sales_63 s on s.product_id = p.product_id 
  
  
--Q64
  create table employee_64 (
    employee_id int primary key,
    name varchar(30),
    experience_years int
  ) 
  
  create table project_64 (
    project_id int,
    employee_id int foreign key references employee_64(employee_id) 
    primary key(project_id, employee_id)
  )
  
  
insert into
  project_64
values
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 4)
  
  
insert into
  employee_64
values
  (1, 'Khaled', 3),
  (2, 'Ali', 2),
  (3, 'John', 1),
  (4, 'Doev', 2)
  
  
select
  project_id,
  round(avg(experience_years), 2) as average_years
from
  project_64 as p
  left join employee_64 as e on p.employee_id = e.employee_id
group by
  project_id 
  
--Q65
  create table product_65 (
    product_id int primary key,
    product_name varchar(30),
    unit_price int
  ) 
  
  create table sales_65 (
    seller_id int,
    product_id int foreign key references product_65(product_id),
    buyer_id int,
    sale_date date,
    quantity int,
    price int
  )
  
  
insert into
  product_65
values
  (1, 'S8', 1000),
  (2, 'G4', 800),
  (3, 'iPhone', 1400)
  
  
insert into
  sales_65
values
  (1, 1, 1, '2019-01-21', 2, 2000),
  (1, 2, 2, '2019-02-17', 1, 800),
  (2, 2, 3, '2019-06-02', 1, 800),
  (3, 3, 4, '2019-05-13', 2, 2800)
  
  
select
  a.seller_id
from
  (
    select
      seller_id,
      sum(price) as sum
    from
      sales_65
    group by
      seller_id
  ) a
where
  a.sum = (
    select
      max(b.sum)
    from(
        select
          seller_id,
          sum(price) as sum
        from
          sales_65
        group by
          seller_id
      ) b
  ) 
  
  
--Q66
select
  distinct buyer_id
from
  sales_65 s
  join product_65 p on p.product_id = s.product_id
where
  p.product_name = 'S8'
  and buyer_id not in (
    select
      buyer_id
    from
      sales_65 s
      join product_65 p on p.product_id = s.product_id
    where
      p.product_name = 'iPhone'
  ) 
  
  
--Q67  --pending
  create table customers_67 (
    customer_id int,
    name varchar(30),
    visited_on date,
    amount int primary key(customer_id, visited_on)
  )
  
  
insert into
  customers_67
values
  (1, 'Jhon', '2019-01-01', 100),
  (2, 'Daniel', '2019-01-02', 110),
  (3, 'Jade', '2019-01-03', 120),
  (4, 'Khaled', '2019-01-04', 130),
  (5, 'Winston', '2019-01-05', 110),
  (6, 'Elvis', '2019-01-06', 140),
  (7, 'Anna', '2019-01-07', 150),
  (8, 'Maria', '2019-01-08', 80),
  (9, 'Jaze', '2019-01-09', 110),
  (1, 'Jhon', '2019-01-10', 130),
  (3, 'Jade', '2019-01-10', 50) 
  
  --Q68
  create table sales_68 (
    player_name varchar(30),
    gender varchar(30),
    day date,
    score_points int primary key(gender, day)
  )
  
  
insert into
  sales_68
values
  ('Aron', 'F', '2020-01-01', 17),
  ('Alice', 'F', '2020-01-07', 23),
  ('Bajrang', 'M', '2020-01-07', 7),
  ('Khali', 'M', '2019-12-25', 11),
  ('Slaman', 'M', '2019-12-30', 13),
  ('Joev', 'M', '2019-12-31', 3),
  ('Jose', 'M', '2019-12-18', 2),
  ('Priya', 'F', '2019-12-31', 23),
  ('Priyanka', 'F', '2019-12-30', 17)
  
  
select
  s1.gender,
  s1.day,
  sum(s2.score_points) as total
from
  sales_68 s1,
  sales_68 s2
where
  s1.gender = s2.gender
  and s1.day >= s2.day
group by
  s1.gender,
  s1.day
order by
  s1.gender,
  s1.day 
  
--Q69 --pending
  create table logs (
  log_id int primary key
  )
  
  
insert into
  logs
values
  (1),
  (2),
  (3),
  (7),
  (8),
  (10) 
  
  
--Q70 --pending
  create table students_70 (
    student_id int primary key,
    student_name varchar(30)
  ) 
  
  create table subjects_70 (
  subject_name varchar(30) primary key
  ) 
  
  create table examinations 
  (student_id int, 
  subject_name varchar(30)
  )
  
  
insert into
  students_70
values
  (1, 'Alice'),
  (2, 'Bob'),
  (13, 'John'),
  (6, 'Alex')
  
  
insert into
  subjects_70
values
  ('Math'),
  ('Physics'),
  ('Programming')
  
  
insert into
  examinations
values
  (1, 'Math'),
  (1, 'Physics'),
  (1, 'Programming'),
  (2, 'Programming'),
  (1, 'Physics'),
  (1, 'Math'),
  (13, 'Math'),
  (13, 'Programming'),
  (13, 'Physics'),
  (2, 'Math'),
  (1, 'Math') 
  
--Q71
  create table employee_71 (
    employee_id int primary key,
    employee_name varchar(30),
    manager_id int
  )
  
  
insert into
  employee_71
values
  (1, 'Boss', 1),
  (3, 'Alice', 3),
  (2, 'Bob', 1),
  (4, 'Daniel', 2),
  (7, 'Luis', 4),
  (8, 'Jhon', 3),
  (9, 'Angela', 8),
  (77, 'Robert', 1)
  
  
select
  employee_id as EMPLOYEE_ID
from
  employee_71
where
  manager_id in (
    select
      employee_id
    from
      employee_71
    where
      manager_id in (
        select
          employee_id
        from
          employee_71
        where
          manager_id = 1
      )
  )
  and employee_id != 1 
  
--Q72
  create table transactions (
    id int primary key,
    country varchar(30),
    state varchar(10),
    amount int,
    trans_date date
  )
  
  
insert into
  transactions
values
  (121, 'US', 'approved', 1000, '2018-12-18'),
  (122, 'US', 'declined', 2000, '2018-12-19'),
  (123, 'US', 'approved', 2000, '2019-01-01'),
  (124, 'DE', 'approved', 2000, '2019-01-07')
  
  
select
  country,
  count(id) as trans_count,
  sum(case when state = 'approved' then 1 else 0 end) as approved_count,
  sum(amount) as trans_total_amount,
  sum(
    case when state = 'approved' then amount else 0 end
  ) as approved_total_amount
from
  transactions
group by
  
  
 --Q73
  create table actions (
    user_id int,
    post_id int,
    action_date date,
    action varchar(20),
    extra varchar(30)
  ) 
  
  create table rmovals (
  post_id int primary key, 
  remove_date date
  )
  
  
insert into
  actions
values
  (5, 2, '2019-07-03', 'view', 'null'),
  (5, 2, '2019-07-03', 'report', 'racism'),
  (5, 5, '2019-07-03', 'view', 'null'),
  (5, 5, '2019-07-03', 'report', 'racism'),
  (1, 1, '2019-07-01', 'view', 'null'),
  (1, 1, '2019-07-01', 'like', 'null'),
  (1, 1, '2019-07-01', 'share', 'null'),
  (2, 2, '2019-07-04', 'view', 'null'),
  (2, 2, '2019-07-04', 'report', 'spam'),
  (3, 4, '2019-07-04', 'view', 'null'),
  (3, 4, '2019-07-04', 'report', 'spam'),
  (4, 3, '2019-07-02', 'view', 'null'),
  (4, 3, '2019-07-02', 'report', 'spam')
  
  
insert into
  rmovals
values
  (2, '2019-07-20'),
  (3, '2019-07-18')
  
  
select
  round(avg(daily_count), 2) as average_daily_percent
from
  (
    select
      count(distinct b.post_id) / count(distinct a.post_id) * 100 as daily_count
    from
      actions a
      left join rmovals b on a.post_id = b.post_id
    where
      extra = 'spam'
    group by
      action_date
  ) b 
  
  --Q74 & Q75 & Q43 are same
  
  --Q76
  create table salaries_76 (
    company_id int,
    employee_id int,
    employee_name varchar(30),
    salary int primary key(company_id, employee_id)
  )
  
  
insert into
  salaries_76
values
  (1, 1, 'Tony', 2000),
  (1, 2, 'Pronub', 21300),
  (1, 3, 'Tyrrox', 10800),
  (2, 1, 'Pam', 300),
  (2, 7, 'Bassem', 450),
  (2, 9, 'Hermione', 700),
  (3, 7, 'Bocaben', 100),
  (3, 2, 'Ognjen', 2200),
  (3, 13, 'Nyan Cat', 3300),
  (3, 15, 'Morning Cat', 7777)
  
  
select
  salaries_76.company_id,
  salaries_76.employee_id,
  salaries_76.employee_name,
  round(
    case when salary_max < 1000 then salaries_76.salary when salary_max >= 1000
    and salary_max <= 10000 then salaries_76.salary * 0.76 else salaries_76.salary * 0.51 end,
    0
  ) as salary
from
  salaries_76
  inner join (
    select
      company_id,
      max(salary) as salary_max
    from
      salaries_76
    group by
      company_id
  ) as t on salaries_76.company_id = t.company_id 
  
  
  --Q77 & Q42 same
  
  --Q78
  create table variables (
  name varchar(30) primary key, 
  value int
  ) 
  
  create table expressions (
    left_operand varchar(30),
    operator varchar(1),
    right_operand varchar(30) 
    primary key(left_operand, operator, right_operand)
  )
  
  
insert into
  variables
values
  ('x', 66),
  ('y', 77)
  
  
insert into
  expressions
values
  ('x', '>', 'y'),
  ('x', '<', 'y'),
  ('x', '=', 'y'),
  ('y', '>', 'x'),
  ('y', '<', 'x'),
  ('x', '=', 'x')
  
  
select
  left_operand,
  operator,
  right_operand,
  case when operator = '<'
  and v1.value < v2.value then 'true' when operator = '='
  and v1.value = v2.value then 'true' when operator = '>'
  and v1.value > v2.value then 'true' ELSE 'false' end as value
from
  expressions as e
  join variables as v1 ON e.left_operand = v1.name
  join Variables as v2 ON e.right_operand = v2.name 
  
  --Q79 & Q35 are same
  --Q80 & Q55 are same
  
  
  --Q81
  create table students_81 (
  id int, 
  name varchar(30), 
  marks int
  )
  
  
insert into
  students_81
values
  (1, 'ashley', 81),
  (2, 'samantha', 75),
  (3, 'julia', 76),
  (4, 'belvet', 84)
  
  
select
  name
from
  students_81
where
  marks > 75
order by
  RIGHT(name, 3),
  id asc 
  
--Q82
  create table employee_82 (
    employee_id int,
    name varchar(30),
    months int,
    salary int
  )
  
  
insert into
  employee_82
values
  (12228, 'rose', 15, 1968),
  (33645, 'angela', 1, 3443),
  (45692, 'frank', 17, 1608),
  (56118, 'patrick', 7, 1345),
  (59725, 'lisa', 11, 2330),
  (74197, 'kimberly', 16, 4372),
  (78454, 'bonnie', 8, 1771),
  (83565, 'michael', 6, 2017),
  (98607, 'todd', 5, 3396),
  (99989, 'joe', 9, 3573)
  
  
select
  name
from
  employee_82
order by
  name 
  
--Q83
select
  name
from
  employee_82
where
  salary > 2000
  AND months < 10
order by
  employee_id 
  
--Q84
  create table triangles_84 (
  a int, 
  b int, 
  c int
  )
  
  
insert into
  triangles_84
values
  (20, 20, 23),
  (20, 20, 20),
  (20, 21, 22),
  (13, 14, 30)
  
  
select
  case when a + b <= c
  or a + c <= b
  or b + c <= a then 'Not A Triangle' when a = b
  and b = c then 'Equilateral' when a = b
  or b = c
  or a = c then 'Isosceles' else 'Scalene' end
from
  triangles_84 
  
--Q85
  create table user_transaction (
    transaction_id int,
    product_id int,
    spend float,
    transaction_date date
  )
  
  
insert into
  user_transaction
values
  (1341, 123424, 1500.60, '2019-31-02'),
  (1423, 123424, 1000.20, '2020-31-02'),
  (1623, 123424, 1246.44, '2021-31-02'),
  (1322, 123424, 2145.32, '2022-31-02') 
  
--Q86  --pending
  create table inventory_86 (
    item_id int,
    item_type varchar(30),
    item_category varchar(30),
    square_footage float
  )
  
  
insert into
  inventory_86
values
  (1374, 'prime_eligible', ',mini refrigerator', 68.00),
  (4245, 'not_prime', 'standing lamp', 26.40),
  (2452, 'prime_eligible', 'television', 85.00),
  (3255, 'not_prime side', 'table', 22.60),
  (1672, 'prime_eligible', 'laptop', 8.50) 
  
--Q87 --pending
  create table user_actions (
    user_id int,
    event_id int,
    event_type varchar(30),
    event_date datetime
  )
  
  
insert into
  user_actions
values
  (445, 7765, 'sign-in', '05/31/2022 12:00:00'),
  (742, 6458, 'sign-in', '06/03/2022 12:00:00'),
  (445, 3634, 'like', '06/05/2022 12:00:00'),
  (742, 1374, 'comment', '06/05/2022 12:00:00'),
  (648, 3124, 'like', '06/18/2022 12:00:00')
  
 --Q88 --pending
  create table search_freq (
  searches int, 
  num_users int
  )
  
  
insert into
  search_freq
values
  (1, 2),
  (2, 2),
  (3, 3),
  (4, 1) 
  
--Q89 --pending
  create table advertiser_89 (
  user_id varchar(30),
   status varchar(30)
   )
   
   
insert into
  advertiser_89
values
  ('bing', 'NEW'),
  ('yahoo', 'NEW'),
  ('alibaba', 'EXISTING') 
  
  create table daily_pay (
  user_id varchar(30), 
  paid float
  )
  
  
insert into
  daily_pay
values
  ('yahoo', 45.00),
  ('alibaba', 100.00),
  ('target', 13.00)
  
  
select
  advertiser_89.user_id,
  advertiser_89.status,
  payment.paid
from
  advertiser_89
  left join daily_pay AS payment 
  on advertiser_89.user_id = payment.user_id 
  
  
--Q90 --pending
  create table server_utilization (
    server_id int,
    status_time date,
    session_status varchar(30)
  )
  
  
insert into
  server_utilization
values
  (1, '08/02/2022 10:00:00', 'start'),
  (1, '08/04/2022 10:00:00', 'stop'),
  (2, '08/17/2022 10:00:00', 'start'),
  (2, '08/24/2022 10:00:00', 'stop') 
  
--Q91 --pending
  create table transactions_91 (
    transaction_id int,
    merchant_id int,
    credit_card_id int,
    amount int,
    transaction_timestamp date
  )
  
  
insert into
  transactions_91
values
  (1, 101, 1, 100, '09/25/2022 12:00:00'),
  (2, 101, 1, 100, '09/25/2022 12:08:00'),
  (3, 101, 1, 100, '09/25/2022 12:28:00'),
  (4, 102, 2, 300, '09/25/2022 12:00:00'),
  (6, 102, 2, 400, '09/25/2022 14:00:00') 
  
--Q92 --pending
  create table orders_92 (
    order_id int,
    customer_id int,
    trip_id int,
    status varchar(30),
    order_timestamp date
  )
  
  
insert into
  orders_92
values
  (
    727424,
    8472,
    100463,
    'completed successfully',
    '06/05/2022 09:12:00'
  ),
  (
    242513,
    2341,
    100482,
    'completed incorrectly',
    '06/05/2022 14:40:00'
  ),
  (
    141367,
    1314,
    100362,
    'completed incorrectly',
    '06/07/2022 15:03:00'
  ),
  (
    582193,
    5421,
    100657,
    'never_received',
    '07/07/2022 15:22:00'
  ),
  (
    253613,
    1314,
    100213,
    'completed successfully',
    '06/12/2022 13:43:00'
  ) 
  
  create table trips (
    dasher_id int,
    trip_id int,
    estimated_delivery_timestamp date,
    actual_delivery_timestamp date
  )
  
  
insert into
  trips
values
  (
    101,
    100463,
    '06/05/2022 09:42:00',
    '06/05/2022 09:38:00'
  ),
  (
    102,
    100482,
    '06/05/2022 15:10:00',
    '06/05/2022 15:46:00'
  ),
  (
    101,
    100362,
    '06/07/2022 15:33:00',
    '06/07/2022 16:45:00'
  ),
  (
    103,
    100213,
    '06/12/2022 14:13:00',
    '06/12/2022 14:10:00'
  ) 
  
  create table customers_92 (
  customer_id int, 
  signup_timestamp date
  )
  
  
insert into
  customers_92
values
  (8472, '05/30/2022 00:00:00'),
  (2341, '06/01/2022 00:00:00'),
  (1314, '06/03/2022 00:00:00'),
  (1435, '06/05/2022 00:00:00'),
  (5421, '06/07/2022 00:00:00') 
  
--Q93
  create table scores (
    player_name varchar(30),
    gender varchar(30),
    day date,
    score_points int primary key(gender, day)
  )
  
  
insert into
  scores
values
  ('Aron', 'F', '2020-01-01', 17),
  ('Alice', 'F', '2020-01-07', 23),
  ('Bajrang', 'M', '2020-01-07', 7),
  ('Khali', 'M', '2019-12-25', 11),
  ('Slaman', 'M', '2019-12-30', 13),
  ('Joe', 'M', '2019-12-31', 3),
  ('Jose', 'M', '2019-12-18', 2),
  ('Priya', 'F', '2019-12-31', 23),
  ('Priyanka', 'F', '2019-12-30', 17)
  
  
select
  s1.gender,
  s1.day,
  sum(s2.score_points) as total
from
  Scores s1,
  Scores s2
where
  s1.gender = s2.gender
  and s1.day >= s2.day
group by
  s1.gender,
  s1.day
order by
  s1.gender,
  s1.day 
  
  
--Q94 & Q55 are same  --pending

--Q95 --pending
  create table numbers (
  num int primary key, 
  frequency int
  )
  
  
insert into
  numbers
values
  (0, 7),
  (1, 1),
  (2, 3),
  (3, 1) 
  
--Q96 --pending
  create table salary_96 (
    id int primary key,
    employee_id int foreign key references employee_96(employee_id),
    amount int,
    pay_date date
  ) 
  
  create table employee_96 (employee_id int primary key, 
  department_id int
  )
  
  
insert into
  salary_96
values
  (1, 1, 9000, '2017/03/31'),
  (2, 2, 6000, '2017/03/31'),
  (3, 3, 10000, '2017/03/31'),
  (4, 1, 7000, '2017/02/28'),
  (5, 2, 6000, '2017/02/28'),
  (6, 3, 8000, '2017/02/28')
  
  
insert into
  employee_96
values
  (1, 1),
  (2, 2),
  (3, 2) 
  
--Q97 --pending
  create table activity_97 (
    player_id int,
    device_id int,
    event_date date,
    games_played int primary key(player_id, event_date)
  )
  
  
insert into
  activity_97
values
  (1, 2, '2016-03-01', 5),
  (1, 2, '2016-03-02', 6),
  (2, 3, '2017-06-25', 1),
  (3, 1, '2016-03-01', 0),
  (3, 4, '2016-07-03', 5)
  
  
select
  event_date,
  count(player_id)
from
  (
    select
      event_date,
      player_id
    from
      activity_97
    group by
      player_id
    order by
      player_id,
      event_date
  ) a
group by
  event_date 
  
  
--Q98 --pending
  create table players (
  player_id int primary key, 
  group_id int
  ) 
  
  create table matches_98 (
    match_id int primary key,
    first_player int,
    second_player int,
    first_score int,
    second_score int
  )
  
  
insert into
  players
values
  (20, 3),
  (40, 3),
  (15, 1),
  (25, 1),
  (30, 1),
  (45, 1),
  (10, 2),
  (35, 2),
  (50, 2)
  
  
insert into
  matches_98
values
  (1, 15, 45, 3, 0),
  (2, 30, 25, 1, 2),
  (3, 30, 15, 2, 0),
  (4, 40, 20, 5, 2),
  (5, 35, 50, 1, 1) 
  
  
--Q99 & Q100 are same -pending
  create table student_99 (
  student_id int, 
  student_name varchar(30)
  ) 
  
  create table exam_99 (
    exam_id int,
    student_id int,
    score int primary key(exam_id, student_id)
  )
  
  
insert into
  student_99
values
  (1, 'Daniel'),
  (2, 'Jade'),
  (3, 'Stella'),
  (4, 'Jonathan'),
  (5, 'Will')
  
  
insert into
  exam_99
values
  (10, 1, 70),
  (10, 2, 80),
  (10, 3, 90),
  (20, 1, 80),
  (30, 1, 70),
  (30, 3, 80),
  (30, 4, 90),
  (40, 1, 60),
  (40, 2, 70),
  (40, 4, 80)
