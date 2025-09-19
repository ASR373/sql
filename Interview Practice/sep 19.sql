#13
with cte as(
select 
customerid, date_trunc('month', logindate) as loginmonth 
from logins
group by 1, 2
),
cte1 as(
select customerid, loginmonth, 
lag(loginmonth) over (partition by customerid order by loginmonth asc) 
as prevmonthlogin
from cte
)
select customerid from cte1
where prevmonthlogin is not null 
and 
loginmonth = prevmonthlogin + interval '1 month'

#14
with cte as(
select product, sum(amount) as totalsalesbyproduct from sales
group by 1
),
cte1 as (
select sum(amount) as totalsales from sales
)
select c.product, c.totalsalesbyproduct, 
round((c.totalsalesbyproduct/c1.totalsales)*100,2) as ContributionPct
from cte c
cross join cte1 c1
order by 3 desc
limit 2


