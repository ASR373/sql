/*
Find all industries with a positive average profit. For those industries extract their lowest sale.
Output the industry along with the corresponding lowest sale and average profit.
Sort the output based on the lowest sales in ascending order.

Table
forbes_global_2010_2014


assets: double precision
company: text
continent: text
country: text
industry: text
marketvalue: double precision
profits: double precision
rank: bigint
sales: double precision
sector: text

expected output:

industry	min_sales	avg_profit
Major Banks	27.7	11.9
Electric Utilities	32	1.27
Software & Programming	37.9	16.95
Investment Services	39.5	10.3
Beverages	43.2	9.9
*/

select industry, min(sales) as min_sales, avg(profits) as avg_profit from forbes_global_2010_2014
group by 1
having avg(profits) >0
order by 2

