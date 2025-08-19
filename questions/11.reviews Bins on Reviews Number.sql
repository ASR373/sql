/*
❓ Problem Statement

We want to understand how the number of reviews affects accommodation prices. Each listing in the table airbnb_search_details should be classified into review categories based on the column number_of_reviews:

0 reviews → "NO"

1 to 5 reviews → "FEW"

6 to 15 reviews → "SOME"

16 to 40 reviews → "MANY"

More than 40 reviews → "A LOT"

For each listing, output:

The price

The corresponding category (reviews_qualification)

📑 Table Structure: airbnb_search_details
Column	Type	Description
id	bigint	Unique ID of listing
price	double precision	Price of the listing
number_of_reviews	bigint	Total reviews count
accommodates	bigint	Number of guests accommodated
bedrooms	bigint	Number of bedrooms
bathrooms	bigint	Number of bathrooms
room_type	text	Type of room (entire home, private room, etc.)
neighbourhood	text	Neighborhood
property_type	text	Type of property
review_scores_rating	double precision	Avg review rating
… (other Airbnb fields)	…
*/

