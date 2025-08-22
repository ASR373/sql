/*
Find the average number of beds in each neighborhood that has at least 3 beds in total.


Output results along with the neighborhood name and sort the results based on the number of average beds in descending order.
*/

select neighbourhood, round(avg(beds),2) as n_beds_avg from airbnb_search_details
where neighbourhood <> ''
group by 1
having sum(beds) >= 3
order by 2 desc
