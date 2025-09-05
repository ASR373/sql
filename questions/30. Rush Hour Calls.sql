/*Redfin helps clients to find agents. Each client will have a unique request_id and each request_id has several calls. For each request_id, the first call is an “initial call” and 
all the following calls are “update calls”.  How many customers have called 3 or more times between 3 PM and 6 PM (initial and update calls combined)?
*/

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

----- optimized

select count(*) from (
  select request_id from redfin_call_tracking
where extract(hour from created_on) between 3 and 6
group by 1
having count(*) >= 3
  )
as t
