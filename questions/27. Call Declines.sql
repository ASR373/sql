/*Which company had the biggest month call decline from March to April 2020? Return the company_id and calls difference for the company with the highest decline.*/

with cte as (
select ru.company_id as com, extract(Month from rc.call_date) as month, count(rc.call_id) as total_calls from rc_calls rc
join rc_users ru on rc.user_id = ru.user_id
group by 1,2
order by 1,2
),
cte1 as(
select com, 
max(case when month = 4 then total_calls end) - max(case when month = 3 then total_calls end) as difference 
from cte
group by 1
)

select * from cte1
where difference = (select min(difference) from cte1)
