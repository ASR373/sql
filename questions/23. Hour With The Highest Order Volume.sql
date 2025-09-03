/*
Which hour of the day has the highest average number of orders across all recorded days? Your output should include the hour that satisfies this condition and the corresponding average number of orders per 
hour. The "order volume" refers to the count of orders placed within each hour of the day.
*/


with hour_counts as(
select date(order_timestamp_utc),
  extract(hour from order_timestamp_utc) as hour, count(*) as count_of_orders from postmates_orders
  group by 1,2
  ),

avg_orders as (
  select hour, avg(count_of_orders) as avg_orderss from hour_counts
  group by 1
  )

select * from avg_orders
where avg_orderss = (select max(avg_orderss) from avg_orders)

