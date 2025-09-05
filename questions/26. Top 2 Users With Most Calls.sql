/* Return the top 2 users in each company that called the most. Output the company_id, user_id, and the user's rank. If there are multiple users in the same rank, keep all of them. */

with cte as(
select ru.company_id as company_id, rc.user_id as user_id, count(rc.call_id) as total_calls from rc_calls rc
join rc_users ru on rc.user_id = ru.user_id
group by rc.user_id, ru.company_id
),

cte1 as(
select company_id, user_id, dense_rank() over(partition by company_id order by total_calls desc) as rn from cte
)

select * from cte1
where rn < 3
