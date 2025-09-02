/* Write a SQL query to show each loan and its rate type. For each loan, create two new columns: fixed and variable. If the loan has a fixed rate, put a 1 in the fixed column and a 0 in the variable column. If the loan has a variable rate, do the opposite.
*/


select loan_id, 
count(case when (rate_type = 'fixed') then id
else null end) as fixed,
count(case when (rate_type = 'variable') then id
else null end) as variable
from submissions
group by 1
