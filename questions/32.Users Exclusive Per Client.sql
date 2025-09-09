/* Considering a dataset that tracks user interactions with different clients, identify which clients have users who are exclusively loyal to them (i.e., they don't interact with any other clients).


For each of these clients, calculate the number of such exclusive users. The output should include the client_id and the corresponding count of exclusive users.
*/

with cte as(
select client_id, user_id from fact_events
where user_id in (
select user_id from fact_events
group by 1 
having count(distinct client_id) = 1
)
)
select client_id, count(distinct user_id) as exclusive_users from cte
group by client_id
