with cte as(
select *,
dense_rank() over (partition by request_id order by created_on asc) as rank
from redfin_call_tracking
)
select avg(call_duration) from cte
where rank = 1

