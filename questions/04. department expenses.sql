

/*
found this question on interview query - department expenses

### 🧾 SQL Problem Statement
**Background:**
As part of the financial management in a large corporation, the CFO wants to review the **expenses in all departments for the previous financial year (2022)**.

**Task:**
Write an SQL query to calculate the **total expenditure** for each department in 2022. Additionally, for comparison purposes, return the **average expense** across all departments in 2022.

---

### 📌 Requirements:

* Output must include:

  * `department_name` (from the `departments` table)
  * `total_expense` (sum of all expenses for that department in 2022)
  * `average_expense` (average of total expenses across **all departments**, repeated for each row)
* Round both `total_expense` and `average_expense` to **2 decimal places**
* Filter the data to **only include expenses in 2022**
* Sort the result by `total_expense` in **descending order**

---

### 📂 Table Schemas:

#### `departments` table

| Column | Type    |
| ------ | ------- |
| id     | INTEGER |
| name   | VARCHAR |

#### `expenses` table

| Column         | Type    |
| -------------- | ------- |
| id             | INTEGER |
| department\_id | INTEGER |
| amount         | FLOAT   |
| date           | DATE    |

---

### 📤 Expected Output:

| Column           | Type    |
| ---------------- | ------- |
| department\_name | VARCHAR |
| total\_expense   | FLOAT   |
| average\_expense | FLOAT   |

*/


with cte as(
select d.name as department_name, 
 coalesce(sum(e.amount),0) as total_expense
 from departments d
join expenses e on d.id = e.department_id 
 where to_char(date, 'yyyy') = '2022'
group by 1
)

select *, 
 round(avg(total_expense) over(), 2) as average_expense
from cte
