#7
with cte as(
select avg(reading) as avgreading from sensors
),
cte1 as(
select deviceid, avg(reading) as avgdevicereading from sensors
group by 1)

select cte1.deviceid, cte1.avgdevicereading from cte, cte1
where cte1.avgdevicereading > cte.avgreading

#8
with cte as(
select product, region, saleid, amount,
rank() over(partition by product, region order by amount desc) rn
from productsales
)
select product, region, saleid, amount from cte
where rn = 1

#9
with cte as
(select variant, expdate, 
sum(revenue) over(partition by variant order by expdate)
as cumrevenue
from experiments)

select variant, min(expdate), cumrevenue
from cte
where cumrevenue > 100
group by 1
