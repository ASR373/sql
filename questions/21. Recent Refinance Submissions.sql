
with cte as
(
select l.user_id, s.balance as balance, l.created_at,
row_number() over (partition by user_id order by created_at desc) as rm
from loans l
left join submissions s on l.id = s.loan_id
where l.type = 'Refinance'
)
select user_id, sum(balance) from cte
where rm = 1
group by 1
