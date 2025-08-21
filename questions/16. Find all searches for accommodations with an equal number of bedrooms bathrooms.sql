/* Find all searches for accommodations where the number of bedrooms is equal to the number of bathrooms.*/


select id, price, property_type, room_type, amenities, 
  accommodates,	bathrooms,	bed_type,	cancellation_policy,	
  cleaning_fee,	city,	host_identity_verified,	host_response_rate,
  host_since,	neighbourhood,	number_of_reviews,	review_scores_rating,	
  zipcode,	bedrooms,	beds
  from airbnb_search_details
  where bathrooms = bedrooms
