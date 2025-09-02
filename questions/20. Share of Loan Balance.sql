/* Write a query that returns the rate_type, loan_id, loan balance , and a column that shows with what percentage the loan's balance contributes to the total balance among the loans of the same rate type. Sort the final output by rate_type and loan_id.
*/


select rate_type, loan_id, balance 
 round( 
  cast(
  balance*100/nullif(sum(balance) over (partition by rate_type),0) 
  as numeric)
  ,2) 
  as balance_share
  from submissions
order by 1,2 


select panrom 3 columns and the question is revloving around the 4th column thaa so basic aa we perform the forumula nd do the partition then we are rounding it off by 2... but errors varuthu so of missing values
so namma nullif use panni 0 fill panrom.. then still we get an error coz antha vaules oda data type la etho problem nu so antha case la we use the function cast inside the round function and partition laa mudinjona
we assign the data type as numeric
