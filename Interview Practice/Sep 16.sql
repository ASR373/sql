#4 Find the average salary for each department where the average salary is greater than 60,000.
select dept, avg(salary) from employees
group by dept
having avg(salary) > 60000

#5 Find customers who have spent more than the average total spending across all customers.
select c.customerid, c.name, sum(o.amount) 
from customer c
left join orders o on c.customerid = o.customerid
group by 1,2
having sum(o.amount) > avg(o.amount)

#6 For each Region, return the top 2 highest sales ordered by Amount.
with cte as(
select region, saleid, product, amount,
rank() over(partition by region order by amount desc) rn
from sales
)
select region, saleid, product, amount from cte
where rn<=2
