/*Write a query to identify all companies (customer_id) whose mobile usage ranks in the bottom two positions. Mobile usage is the count of events where client_id = 'mobile'. Companies with the same usage count should share the same rank, and all companies in the bottom two ranks should be included. Return the customer_id and event count, sorted in ascending order by the number of events.

*/


with cte as(
select customer_id, count(*) as mobile_events,  dense_rank() over (order by count(*)) as rn from fact_events
where client_id = 'mobile'
group by 1
)

select c.customer_id, mobile_events from cte c
where rn <= 2
