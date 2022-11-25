use sqlassignment 

--Q101
create table useractivity (
  username varchar(30),
  activity varchar(30),
  startDate date,
  endDate date
)


insert into
  useractivity
values
  ('Alice', 'Travel', '2020-02-12', '2020-02-20'),
  ('Alice', 'Dancing', '2020-02-21', '2020-02-23'),
  ('Alice', 'Travel', '2020-02-24', '2020-02-28'),
  ('Bob', 'Travel', '2020-02-11', '2020-02-18')
  
  
select
  distinct username,
  activity,
  startDate,
  endDate
from
  (
    select
      u.*,
      rank() over (
        partition by username
        order by
          startDate desc
      ) as rnk,
      count(activity) over (partition by username) as num
    from
      UserActivity u
  ) t
where
  (
    num <> 1
    and rnk = 2
  )
  or (
    num = 1
    and rnk = 1
  ) 
  
  --Q102 &Q101 are same
  --Q103 &Q81 are same
  --Q104 &Q82 are same
  --Q105 &Q83 are same
  --Q106 &Q84 are same
  --Q107
  
  create table employees_107 (
  id int, name varchar(10), 
  salary int
  )
  
  
insert into
  employees_107
values
  (1, 'kristeen', 1420),
  (2, 'ashley', 2006),
  (3, 'julia', 2210),
  (4, 'maria', 3000)
  
  
select
  cast(
    ceiling(
      avg(cast(salary as float)) - avg(cast(replace(salary, '0', '') as float))
    ) as int
  )
from
  employees_107 
  
  --Q108
select
  max(months * salary)
from
  employee_82
where
  (months * salary) = (
    select
      max(months * salary)
    from
      employee_82
  ) 
  
--Q109
  create table occupation (
  name varchar(30), 
  occupation varchar(30)
  ) 
  
  
insert into
  occupation
values
  ('samantha', 'doctor'),
  ('julia', 'actor'),
  ('maria', 'actor'),
  ('meera', 'singer'),
  ('ashley', 'professor'),
  ('ketty', 'professor'),
  ('kristeen', 'professor'),
  ('jane', 'actor'),
  ('jenny', 'doctor'),
  ('priya', 'singer')
  
  
select
  name + '(' + SUBSTRING(OCCUPATIon, 1, 1) + ')'
from
  occupation
order by
  name asc
  
  
select
  'There are total ' + CONVERT(VARCHAR(1), COUNT(*)) + ' ' + LOWER(occupation) + 's.'
from
  occupation
group by
  occupation
order by
  COUNT(*) asc 
  
  
--Q110
  with profession as (
    select
      rank() over (
        partition by occupation
        order by
          name
      ) as rnk,
      case when occupation = 'doctor' then name else null end as Doctor,
      case when occupation = 'professor' then name else null end as Professor,
      case when occupation = 'singer' then name else null end as Singer,
      case when occupation = 'actor' then name else null end as Actor
    from
      occupation
  )
  
  
select
  min(doctor),
  min(professor),
  min(singer),
  min(actor)
from
  profession
group by
  rnk 
  
--Q111
  create table btree (n int, p int)
insert into
  btree
values
  (1, 2),
  (3, 2),
  (6, 8),
  (9, 8),
  (2, 5),
  (8, 5),
  (5, null)
  
  
select
  N,
  case when P is NULL then 'Root' when N in (
    select
      P
    from
      btree
  ) then 'Inner' else 'Leaf' end
from
  btree
order by
  N 
  
--Q112
  create table company_112 (
  companycode varchar(10), 
  founder varchar(30)
  ) 
  
  create table lead_manager (
    lead_manager_code varchar(30),
    company_code varchar(30)
  ) 
  
  create table scenior_manager (
    scenior_manager_code varchar(30),
    lead_manager_code varchar(30),
    company_code varchar(30)
  ) 
  
  create table manager (
    manager_code varchar(30),
    scenior_manager_code varchar(30),
    lead_manager_code varchar(30),
    company_code varchar(30)
  ) 
  
  create table employee_112 (
    employee_code varchar(30),
    manager_code varchar(30),
    scenior_manager_code varchar(30),
    lead_manager_code varchar(30),
    company_code varchar(30)
  )
  
  
insert into
  company_112
values
  ('c1', 'monika'),
  ('c2', 'samantha')
  
  
insert into
  lead_manager
values
  ('lm1', 'c1'),
  ('lm2', 'c2')
  
  
insert into
  scenior_manager
values
  ('sm1', 'lm1', 'c1'),
  ('sm2', 'lm1', 'c1'),
  ('sm3', 'lm2', 'c2')
  
  
insert into
  manager
values
  ('m1', 'sm1', 'lm1', 'c1'),
  ('m2', 'sm3', 'lm2', 'c2'),
  ('m3', 'sm3', 'lm2', 'c2')
  
  
insert into
  employee_112
values
  ('e1', 'm1', 'sm1', 'lm1', 'c1'),
  ('e2', 'm1', 'sm1', 'lm1', 'c1'),
  ('e3', 'm2', 'sm3', 'lm2', 'c2'),
  ('e4', 'm3', 'sm3', 'lm2', 'c2')
  
  
select
  c.companycode,
  COUNT(DIsTINCT l.lead_manager_code),
  COUNT(DIsTINCT s.scenior_manager_code),
  COUNT(DIsTINCT m.manager_code),
  COUNT(DIsTINCT e.employee_code)
from
  company_112 as c
  left join lead_manager as l on C.companycode = l.company_code
  left join scenior_manager as s on l.lead_manager_code = s.lead_manager_code
  left join manager as m on s.scenior_manager_code = m.scenior_manager_code
  left join employee_112 as e on m.manager_code = e.manager_code
group by
  c.companycode
order by
  c.companycode 
  
  
--Q113   --pending
--Q114
  with recurs_1 as (
    select
      1 as counter
    union all
    select
      counter + 1
    from
      recurs_1
    where
      counter < 5
  )
select
  REPLICATE('* ', counter)
from
  recurs_1 
  
--Q115
  with recurs_2 as (
    select
      5 as counter
    UNIon ALL
    select
      counter - 1
    from
      recurs_2
    where
      counter > 0
  )
select
  REPLICATE('* ', counter)
from
  recurs_2 
  
--Q116
  create table tab (
  x int, 
  y int
  )
  
  
insert into
  tab
values
  (20, 20),
  (20, 20),
  (20, 21),
  (23, 22),
  (22, 23),
  (21, 20)
  
  
select
  x,
  y
from
  (
    select
      x,
      y
    from
      tab
    where
      x = y
    group by
      x,
      y
    having
      COUNT(*) = 2
 UNIon
    select
      f1.x,
      f1.y
    from
      tab f1,
      tab f2
    where
      f1.x < f1.y
      AND f1.x = f2.y
      AND f2.x = f1.y
  ) t
order by
  x,
  y 
  
  --Q117 &Q81 are same
  --Q118 &Q82 are same
  --Q119 &Q83 are same
  --Q120 &Q84 are same
  --Q121 &Q85 are same
  --Q122 &Q86 are same
  --Q123 &Q87 are same
  --Q124 &Q88 are same
  --Q125 &Q89 are same
  --Q126 &Q90 are same
  --Q127 &Q91 are same
  --Q128 &Q92 are same
  --Q129 &Q93 are same
  --Q130 &Q94 are same
  --Q131 &Q95 are same
  --Q132 &Q96 are same
  --Q133 &Q97 are same
  --Q134 &Q98 are same
  --Q135 &Q99 are same
  --Q136 &Q100 are same
  --Q137,Q138 &Q102 are same
  --Q139 &Q103 are same
  --Q140 &Q82 are same
  --Q141 &Q83 are same
  --Q142 &Q84 are same
  --Q143 &Q107 are same
  --Q144 &Q108 are same
  --Q145 &Q109 are same
  --Q146 &Q110 are same
  --Q147 &Q111 are same
  --Q148 &Q112 are same
  --Q149 &Q116 are same
  
  
--Q150
  create table studnets_150 (
  id int, 
  name varchar(30)
  ) 
  
  create table friends_150 (
  id int, 
  friend_id int
  ) 
  
  create table packages_150 (
  id int, 
  salary float
  )
  
  
insert into
  friends_150
values
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 1)
  
  
insert into
  studnets_150
values
  (1, 'ashley'),
  (2, 'samantha'),
  (3, 'julia'),
  (4, 'scarlet')
  
  
insert into
  packages_150
values
  (1, 15.20),
  (2, 10.06),
  (3, 11.55),
  (4, 12.12)
  
  
select
  s.name
from
  studnets_150 as s
  left join packages_150 as p on s.id = p.id
  left join friends_150 as f on s.id = f.id
  left join packages_150 as fp on f.friend_id = fp.id
where
  p.salary < fp.salary 
  
--Q151
  create table hackers (
  hacker_id int, 
  name varchar(30)
  ) 
  
  create table difficulty (
  difficulty_level int, 
  score int
  ) 
  
  create table challenges (
    challenge_id int,
    hacker_id int,
    difficulty_level int
  ) 
  
  create table submissions (
    submission_id int,
    challenge_id int,
    hacker_id int,
    score int
  )
  
  
insert into
  hackers
values
  (5580, 'rose'),
  (8439, 'angela'),
  (27205, 'frank'),
  (52243, 'patrick'),
  (52348, 'lisa'),
  (57645, 'kimberly'),
  (77726, 'bonnie'),
  (83082, 'michael'),
  (86870, 'todd'),
  (90411, 'joe')
  
  
insert into
  difficulty
values
  (1, 20),
  (2, 30),
  (3, 40),
  (4, 60),
  (5, 80),
  (6, 100),
  (7, 120)
  
  
insert into
  challenges
values
  (4810, 77726, 4),
  (21089, 27205, 1),
  (36566, 5580, 7),
  (66730, 52243, 6),
  (71055, 52243, 2)
  
  
insert into
  submissions
values
  (68628, 77726, 36566, 30),
  (65300, 77726, 21089, 10),
  (40326, 52243, 36566, 77),
  (8941, 27205, 4810, 4),
  (83554, 77726, 66730, 30),
  (43353, 52243, 66730, 0),
  (55385, 52348, 71055, 20),
  (39784, 27205, 71055, 23),
  (94613, 86870, 71055, 30),
  (45788, 52348, 36566, 0),
  (93058, 86870, 36566, 30),
  (7344, 8439, 66730, 92),
  (2721, 8439, 4820, 36),
  (523, 5580, 71055, 4),
  (49105, 52348, 66730, 0),
  (55877, 57645, 66730, 80),
  (38355, 27205, 66730, 35),
  (3924, 8439, 36566, 80),
  (97379, 90411, 66730, 100),
  (84162, 83082, 4810, 40),
  (97431, 90411, 71055, 30)
  
  
select
  S.hacker_id,
  name
from
  submissions as S
  join HACKERS as H on S.hacker_id = H.hacker_id
  join challenges as C on S.challenge_id = C.challenge_id
  join difficulty as D on C.difficulty_level = D.difficulty_level
where
  S.score = D.score
group by
  name,
  S.hacker_id
having
  count(S.challenge_id) > 1
order by
  count(S.challenge_id) desc,
  S.hacker_id 
  
--Q152
  create table project_152 (
  task_id int, 
  start_date date, 
  end_date date
  )
  
  
insert into
  project_152
values
  (1, '2015-10-01', '2015-10-02'),
  (2, '2015-10-02', '2015-10-03'),
  (3, '2015-10-03', '2015-10-04'),
  (4, '2015-10-13', '2015-10-14'),
  (5, '2015-10-14', '2015-10-15'),
  (6, '2015-10-28', '2015-10-29'),
  (7, '2015-10-30', '2015-10-31')
  
  
select
  Start_Date,
  min(end_Date)
from
  (
    select
      Start_Date
    from
      project_152
    where
      Start_Date NOT IN (
        select
          end_Date
        from
          project_152
      )
  ) a,
  (
    select
      end_Date
    from
      project_152
    where
      end_Date NOT IN (
        select
          Start_Date
        from
          project_152
      )
  ) b
where
  Start_Date < end_Date
group by
  Start_Date
order by
  Start_Date asc 
  
--Q153 --pending
  create table transaction_153 (
    user_id int,
    amount float,
    transaction_date date
  ) 
  
  
insert into
  transaction_153
values
  (1, 9.99, '08/01/2022 10:00:00'),
  (1, 55, '08/17/2022 10:00:00'),
  (2, 149.5, '08/05/2022 10:00:00'),
  (2, 4.89, '08/06/2022 10:00:00'),
  (2, 34, '08/07/2022 10:00:00') 
  
--Q154
  create table payments (
  payer_id int, 
  recipient_id int, 
  amount int
  )
  
  
insert into
  payments
values
  (101, 201, 30),
  (201, 101, 10),
  (101, 301, 20),
  (301, 101, 80),
  (201, 301, 70) 
  
  
  with twoway as (
    select
      payer_id,
      recipient_id
    from
      payments
    INTERSECT
    select
      recipient_id,
      payer_id
    from
      payments
  )
select
  COUNT(payer_id) / 2 as unique_relationships
from
  twoway 
  
--Q155
  create table users_login (
  user_id int, 
  login_date date
  )
  
  
insert into
  users_login
values
  (725, '03/03/2022 12:00:00'),
  (245, '03/28/2022 12:00:00'),
  (112, '03/05/2022 12:00:00'),
  (245, '04/29/2022 12:00:00'),
  (112, '04/05/2022 12:00:00')
  
  
select
  u1.user_id
from
  users_login u1,
  users_login u2
where
  u1.login_date > u2.login_date
group by
  u1.user_id 
  
--Q156   --pending
  create table user_transaction_156 (
    transaction_id int,
    user_id int,
    spend float,
    transaction_date date
  )
  
  
insert into
  user_transaction_156
values
  (759274, 111, 49.50, '02/03/2022 00:00:00'),
  (850371, 111, 51.00, '03/15/2022 00:00:00'),
  (615348, 145, 36.30, '03/22/2022 00:00:00'),
  (137424, 156, 151.00, '04/04/2022 00:00:00'),
  (248475, 156, 87.00, '04/16/2022 00:00:00') 
  
  
--Q157  --pending
  create table measurements (
    measurement_id int,
    measurement_value float,
    measurement_time date
  )
  
  
insert into
  measurements
values
  (131233, 1109.51, '07/10/2022 09:00:00'),
  (135211, 1662.74, '07/10/2022 11:00:00'),
  (523542, 1246.24, '07/10/2022 13:15:00'),
  (143562, 1124.50, '07/11/2022 15:00:00'),
  (346462, 1234.14, '07/11/2022 16:45:00') 
  
--Q158
  create table transactions_158 (
    user_id int,
    amount float,
    transaction_date date
  )
  
  
insert into
  transactions_158
values
  (1, 9.99, '08/01/2022 10:00:00'),
  (1, 55, '08/17/2022 10:00:00'),
  (2, 149.5, '08/05/2022 10:00:00'),
  (2, 4.89, '08/06/2022 10:00:00'),
  (2, 34, '08/07/2022 10:00:00')
  
  
select
  t1.user_id
from
  transactions_158 t1,
  transactions_158 t2
where
  DATEDIFF(DAY, t1.transaction_date, t2.transaction_date) = 1 
  
--Q159  --pending
  create table rental_amenities (
  rental_id int, 
  amenity varchar(30)
  )
  
  
insert into
  rental_amenities
values
  (123, 'pool'),
  (123, 'kitchen'),
  (234, 'hot tub'),
  (234, 'fireplace'),
  (345, 'kitchen'),
  (345, 'pool'),
  (456, 'pool') 
  
--Q160
  create table ad_campaigns (
    campaign_id int,
    spend int,
    revenue float,
    advertiser_id int
  )
  
  
insert into
  ad_campaigns
values
  (1, 5000, 7500, 3),
  (2, 1000, 900, 1),
  (3, 3000, 12000, 2),
  (4, 500, 2000, 4),
  (5, 100, 400, 4)
select
  revenue / spend
from
  ad_campaigns
order by
  advertiser_id 
  
--Q161
  create table employee_pay (
  employee_id int, 
  salary int, 
  title varchar(30)
  )
  
  
insert into
  employee_pay
values
  (101, 80000, 'Data Analyst'),
  (102, 90000, 'Data Analyst'),
  (103, 100000, 'Data Analyst'),
  (104, 30000, 'Data Analyst'),
  (105, 120000, 'Data Scientist'),
  (106, 100000, 'Data Scientist'),
  (107, 80000, 'Data Scientist'),
  (108, 310000, 'Data Scientist') 
  
  
  with pay as (
    select
      employee_id,
      salary,
      title,
      (AVG(salary) over (partition by title)) * 2 as double_avg,
      (AVG(salary) over (partition by title)) / 2 as half_avg
    from
      employee_pay
  )
select
  employee_id,
  salary,
  case when salary > double_avg then 'overpaid' when salary < half_avg then 'unpaid' end as outlier_status
from
  pay
where
  salary > double_avg
  or salary < half_avg 
  
--Q162
  create table payments_162 (
  payer_id int, 
  recipient_id int, 
  amount int
  )
  
  
insert into
  payments_162
values
  (101, 201, 30),
  (201, 101, 10),
  (101, 301, 20),
  (301, 101, 80),
  (201, 301, 70) 
  
  
 with relation as (
    select
      payer_id,
      recipient_id
    from
      payments_162
    INTERSECT
    select
      recipient_id,
      payer_id
    from
      payments_162
  )
select
  COUNT(payer_id) / 2 as unique_relationships
from
  relation 
  
  --Q163
  create table purchases_163 (
    user_id int,
    product_id int,
    quantity int,
    purchase_date date
  )
  
  
insert into
  purchases_163
values
  (536, 3223, 6, '01/11/2022 12:33:44'),
  (827, 3585, 35, '02/20/2022 14:05:26'),
  (536, 3223, 5, '03/02/2022 09:33:28'),
  (536, 1435, 10, '03/02/2022 08:40:00'),
  (827, 2452, 45, '04/09/2022 00:00:00')
  
  
select
  COUNT(DISTINCT USER_ID) as USERS_NUM
from
  (
    select
      user_id,
      RANK() OVER (
        partition by USER_ID,
        product_id
        order by
          purchase_date asc
      ) as purchase_no
    from
      purchases_163
  ) as ranking
where
  purchase_no = 2 
  
  
 --Q164  --pending
  create table search_category (
    country varchar(30),
    search_cat varchar(30),
    num_search int,
    invalid_result_pct float
  )
  
  
insert into
  search_category
values
  ('UK', 'home', null, null),
  ('UK', 'tax', 98000, 1.00),
  ('UK', 'travel', 100000, 3.25) 
  
  
--Q165  --pending
  create table transaction_165 (
    transaction_id int,
    type varchar(30),
    amount float,
    transaction_date date
  )
  
  
insert into
  transaction_165
values
  (19153, 'deposit', 65.90, '07/10/2022 10:00:00'),
  (53151, 'deposit', 178.55, '07/08/2022 10:00:00'),
  (29776, 'withdrawal', 25.90, '07/08/2022 10:00:00'),
  (16461, 'withdrawal', 45.99, '07/08/2022 10:00:00'),
  (77134, 'deposit', 32.60, '07/10/2022 10:00:00') 
  
  
--Q166
  create table product_spend (
    category varchar(30),
    product varchar(30),
    user_id int,
    spend float,
    transaction_date date
  )
  
  
insert into
  product_spend
values
  (
    'appliance',
    'refrigerator',
    165,
    246.00,
    '12/26/2021 12:00:00'
  ),
  (
    'appliance',
    'refrigerator',
    123,
    299.99,
    '03/02/2022 12:00:00'
  ),
  (
    'appliance',
    'washing machine',
    123,
    219.80,
    '03/02/2022 12:00:00'
  ),
  (
    'electronics',
    'vacuum',
    178,
    152.00,
    '04/05/2022 12:00:00'
  ),
  (
    'electronics',
    'wireless headset',
    156,
    249.90,
    '07/08/2022 12:00:00'
  ),
  (
    'electronics',
    'vacuum',
    145,
    189.00,
    '07/15/2022 12:00:00'
  )
  
  
select
  category,
  product,
  max(spend)
from
  product_spend
group by
  product,
  category 
  
--Q167  --pending
  create table users_167 (
  user_id int, 
  signup_date date, 
  last_login date
  )
  
  
insert into
  users_167
values
  (1001, '06/01/2022 12:00:00', '07/05/2022 12:00:00'),
  (1002, '06/03/2022 12:00:00', '06/15/2022 12:00:00'),
  (1004, '06/02/2022 12:00:00', '06/15/2022 12:00:00'),
  (1006, '06/15/2022 12:00:00', '06/27/2022 12:00:00'),
  (1012, '06/16/2022 12:00:00', '07/22/2022 12:00:00') 
  
--Q168
  create table songs_history (
    history_id int,
    user_id int,
    song_id int,
    song_plays int
  )
  
  
insert into
  songs_history
values
  (10011, 777, 1238, 11),
  (12452, 695, 4520, 1) 
  
  create table songs_weekly (
  user_id int, 
  song_id int, 
  listen_time date)
  
  
insert into
  songs_weekly
values
  (777, 1238, '08/01/2022 12:00:00'),
  (695, 4520, '08/04/2022 08:00:00'),
  (125, 9630, '08/04/2022 16:00:00'),
  (695, 9852, '08/07/2022 12:00:00')
  
  
select
  *
from
  songs_weekly
  
  
select
  *
from
  songs_history
  
  
select
  songs_weekly.listen_time,
  sum(songs_history.song_plays)
from
  songs_weekly
  left join songs_history 
  on songs_weekly.user_id = songs_history.user_id
group by
  songs_weekly.listen_time 
  
--Q169
  create table emails (
  email_id int, 
  user_id int, 
  signup_date date
  )
  
  
insert into
  emails
values
  (125, 7771, '06/14/2022 00:00:00'),
  (236, 6950, '07/01/2022 00:00:00'),
  (433, 1052, '07/09/2022 00:00:00') 
  
  
  create table texts (
    text_id int,
    email_id int,
    signup_action varchar(30)
  )
  
  
insert into
  texts
values
  (6878, 125, 'Confirmed'),
  (6920, 236, 'Not Confirmed'),
  (6994, 236, 'Confirmed') 
  
  
  
  with rate as (
    select
      user_id,
      case when texts.email_id IS NOT NULL then 1 else 0 end as signup
    from
      emails
      left join texts on emails.email_id = texts.email_id
      and signup_action = 'Confirmed'
  )
select
  SUM(signup) / cast(COUNT(user_id) as float) as confirm_rate
from
  rate 
  
  
--Q170
  create table tweets (tweet_id int, user_id int, tweet_date date)
insert into
  tweets
values
  (214252, 111, '06/01/2022 12:00:00'),
  (739252, 111, '06/01/2022 12:00:00'),
  (846402, 111, '06/02/2022 12:00:00'),
  (241425, 254, '06/02/2022 12:00:00'),
  (137374, 111, '06/04/2022 12:00:00')
  
  
select
  user_id,
  tweet_date,
  COUNT(tweet_id) as tweet_num
from
  tweets
group by
  user_id,
  tweet_date 
  
  
--Q171
  create table activities_171 (
    activity_id int,
    user_id int,
    activity_type varchar(30),
    time_spent float,
    activity_date date
  )
  
  
insert into
  activities_171
values
  (2536, 456, 'open', 3.00, '06/25/2022 12:00:00'),
  (7274, 123, 'open', 4.50, '06/22/2022 12:00:00'),
  (2425, 123, 'send', 3.50, '06/22/2022 12:00:00'),
  (1413, 456, 'send', 5.67, '06/23/2022 12:00:00'),
  (1414, 789, 'chat', 11.00, '06/25/2022 12:00:00') 
  
  create table age_breakdown (
  user_id int, 
  age_bucket varchar(30)
  )
  
  
insert into
  age_breakdown
values
  (123, '31-35'),
  (456, '26-30'),
  (789, '21-25') 
  
  
  
 with snaps_statistics as (
    select
      age.age_bucket,
      SUM(
        case when activities_171.activity_type = 'send' then activities_171.time_spent else 0 end
      ) as send_timespent,
      SUM(
        case when activities_171.activity_type = 'open' then activities_171.time_spent else 0 end
      ) as open_timespent,
      SUM(activities_171.time_spent) as total_timespent
    from
      activities_171
      join age_breakdown as age on activities_171.user_id = age.user_id
    where
      activities_171.activity_type IN ('send', 'open')
    group by
      age.age_bucket
  ) --select * from snaps_statistics
select
  age_bucket,
  (send_timespent / total_timespent) * 100.0 as send_perc,
  (open_timespent / total_timespent) * 100.0 as open_perc
from
  snaps_statistics 
  
  
--Q172
  create table personal_profile (
    profile_id int,
    name varchar(30),
    followers int
  )
  
  
insert into
  personal_profile
values
  (1, 'Nick Singh', 92000),
  (2, 'Zach Wilson', 199000),
  (3, 'Daliana Liu', 171000),
  (4, 'Ravit Jain', 107000),
  (5, 'Vin Vashishta', 139000),
  (6, 'Susan Wojcicki', 39000) 
  
  create table employee_company (
  personal_profile_id int, 
  company_id int
  )
  
  
insert into
  employee_company
values
  (5, 6),
  (6, 5),
  (1, 4),
  (1, 9),
  (2, 2),
  (3, 1),
  (4, 3) 
  
  create table company_pages (
    company_id int,
    name varchar(30),
    followers int
  )
  
  
insert into
  company_pages
values
  (1, 'The Data Science Podcast', 8000),
  (2, 'Airbnb', 700000),
  (3, 'The Ravit Show', 6000),
  (4, 'DataLemur', 200),
  (5, 'youTube', 16000000),
  (6, 'Datascience.Vin', 4500),
  (9, 'Ace The Data Science Interview', 4479)


select
  *
from
  personal_profile
  
  
select
  *
from
  employee_company
  
  
select
  *
from
  company_pages 
  
  
with comp_follow as (
    select
      pf.name,
      pf.followers profile_followers,
      pf.profile_id,
      ec.company_id,
      cp.name company_name,
      cp.followers as company_followers
    from
      personal_profile pf
      join employee_company ec on pf.profile_id = ec.personal_profile_id
      join company_pages cp on ec.company_id = cp.company_id
  )
  
  select
  profile_id
from
  comp_follow
group by
  profile_id,
  profile_followers
having
  max(company_followers) < profile_followers
order by
  profile_id asc
