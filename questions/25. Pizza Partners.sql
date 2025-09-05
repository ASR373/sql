/*
Which partners have ‘pizza’ in their name and are located in Boston? And what is the average order amount? Output the partner name and the average order amount.
*/

select pp.name as name, avg(po.amount) as avg from postmates_orders po
join postmates_markets pm on po.city_id = pm.id
join postmates_partners pp on po.seller_id = pp.id
where pm.name = 'Boston' and pp.name like '%Pizza%'
group by 1
