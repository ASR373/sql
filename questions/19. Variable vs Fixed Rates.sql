select loan_id, 
count(case when (rate_type = 'fixed') then id
else null end) as fixed,
count(case when (rate_type = 'variable') then id
else null end) as variable
from submissions
group by 1
