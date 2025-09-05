/*
Redfin helps clients to find agents. Each client will have a unique request_id and each request_id has several calls. For each request_id, the first call is an “initial call” and all the following calls are “update calls”.  
What's the average call duration for all update calls?
*/

with cte as(
select *,
dense_rank() over (partition by request_id order by created_on asc) as rank
from redfin_call_tracking
)
select avg(call_duration) from cte
where rank != 1
