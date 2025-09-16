Question: Write a query to return all customers from New York with a balance greater than 2000.
Question: Write a query to find the total deposits per customer. Return CustomerID, TotalDeposits.
Question: For each CustomerID, write a query to show their running total (cumulative sum) of sales ordered by SaleDate.

solutions:
#1
select * from customers
where City = 'New York' and Balance > 2000;


#2
select a.CustomerID, sum(t.Amount) from Accounts a
left join Transactions on t a.AccountID = t.AccountID
where TxnType = 'Deposit'
group by 1

#3
select CustomerID, Amount, SaleDate,
sum(Amount) over(partition by CustomerID order by SaleDate) 
as RunningTotal
from sales



