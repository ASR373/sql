with cte as(
select request_id, extract(hour from created_on)
from redfin_call_tracking
),
cte1 as(
select request_id, count(extract) as kk from cte
where extract >= 3 and extract <= 6
group by 1
)
select count(request_id) from cte1
where kk >=3
