found this question stratascratch
  /*

Write a query that returns the user ID of all users that have created at least one ‘Refinance’ submission and at least one ‘InSchool’ submission.

*/

with refinance as (
select user_id from loans
where type = 'Refinance'
),

inschool as (
select user_id from loans
where type = 'InSchool'
)

select distinct r.user_id from refinance r
inner join inschool i on r.user_id = i.user_id
