/*
Find the search details for apartments where the property type is Apartment and the accommodation is suitable for one person.
*/


select id, price, property_type, room_type, amenities, 
  accommodates,	bathrooms,	bed_type,	cancellation_policy,	
  cleaning_fee,	city,	host_identity_verified,	host_response_rate,
  host_since,	neighbourhood,	number_of_reviews,	review_scores_rating,	
  zipcode,	bedrooms,	beds
from airbnb_search_details
where property_type = 'Apartment' and accommodates = 1
