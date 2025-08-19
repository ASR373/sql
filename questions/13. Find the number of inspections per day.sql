/*
Find the number of inspections per day


ID 9704

Find the number of inspections per day.
Output the result along with the date of the activity.
Order results based on the activity date in the ascending order.
*/

select activity_date, count(*) as n_inspections from los_angeles_restaurant_health_inspections
group by 1
order by 1

