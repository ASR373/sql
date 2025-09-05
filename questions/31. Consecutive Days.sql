


with cte as(
SELECT
  user_id,
  record_date,
  DATEDIFF(record_date, LAG(record_date, 1) OVER (PARTITION BY user_id ORDER BY record_date)) AS a,
  DATEDIFF(record_date, LEAD(record_date, 1) OVER (PARTITION BY user_id ORDER BY record_date)) AS b
FROM sf_events
)
select user_id from cte
where a=1 and b=-1
