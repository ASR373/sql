with cte as(
select city_id, date(order_timestamp_utc) as date, sum(amount) as sales from postmates_orders
group by 1,2
order by 1
),

cte2 as(
select city_id,
MAX(CASE WHEN date = '2019-04-11' THEN sales END) AS sales_apr,
    MAX(CASE WHEN date = '2019-03-11' THEN sales END) AS sales_mar,
    MAX(CASE WHEN date = '2019-04-11' THEN sales END) - MAX(CASE WHEN date = '2019-03-11' THEN sales END) AS difference
  FROM cte
  GROUP BY city_id
),

ct as (
select pm.name as city_name, c.difference as amount_difference from postmates_markets pm
left join cte2 c on pm.id = c.city_id
)

select * from(
select city_name, amount_difference from ct
order by 2 asc
limit 1
)

 union all 
 
select * from (
 select city_name, amount_difference from ct
order by 2 desc
limit 1
)
