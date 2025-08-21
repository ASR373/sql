/*n Find distinct searches for Los Angeles neighborhoods. Output neighborhoods and remove duplicates */


select distinct neighbourhood from airbnb_search_details
where city = 'LA' and neighbourhood <> ''
