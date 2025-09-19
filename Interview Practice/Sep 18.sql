#10
select program, sum(kwh), avg(customer_avg) from 
(select program, customer, avg(kwh) as customer_Avg
from energy usage
group by 1,2)
group by 1

#11
select c.customerid, c.name from customers c
join energyusage e on e.customerid = c.customerid
where c.city = 'Minneapolis' and e.program in ('Efficiency', 'Renewable')
group by 1,2
having count(distinct e.program) = 2

#12
select CustomerID, month, KWh,
round(avg(kwh) over(partition by customerid order by (month, 'mon') 
rows between 2 preceding and current row),2)
from monthlyusage
