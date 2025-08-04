

/*
got this question from interview query - sample time series

### 🧾 SQL Problem Statement

**Background:**
You are given a `transactions` table that records purchase transactions with date timestamps. The table includes user and product information, along with the quantity purchased and the date/time of the transaction.

---

### 🎯 Task:

Write an SQL query to **sample every 4th row** from the `transactions` table, **ordered by the `created_at` timestamp**.

---

### 📂 Table Schema

#### `transactions` table:

| Column      | Type     |
| ----------- | -------- |
| id          | INTEGER  |
| user\_id    | INTEGER  |
| created\_at | DATETIME |
| product\_id | INTEGER  |
| quantity    | INTEGER  |

---

### 📤 Expected Output:

| Column      | Type     |
| ----------- | -------- |
| created\_at | DATETIME |
| product\_id | INTEGER  |

*/

with cte as
  (
select created_at, product_id,
  row_number() over (order by created_at) as row_no
  from transactions t
  )
select * from cte
where row_no % 4 = 0
