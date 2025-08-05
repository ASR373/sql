-- engayo irunthu eduthathu
/*
Based on the images you provided, here's the fully framed SQL question and the schema involved:

---

### 🧾 SQL Problem Statement

**Task:**
Write an SQL query to **count the number of dispatched orders** in **each category** (`on_time_dispatch`, `late_dispatch`, `super_late_dispatch`) **for each restaurant**.

---

### 📂 Table Schemas

#### 🏢 `restaurants` table:

| Column   | Type                  | Description            |
| -------- | --------------------- | ---------------------- |
| id       | INTEGER (Primary Key) | Unique restaurant ID   |
| name     | VARCHAR(255)          | Restaurant name        |
| location | VARCHAR(255)          | Location of restaurant |

---

#### 📦 `orders` table:

| Column         | Type                        | Description                     |
| -------------- | --------------------------- | ------------------------------- |
| id             | INTEGER (Primary Key)       | Order ID                        |
| restaurant\_id | INTEGER                     | Foreign key to `restaurants.id` |
| order\_time    | TIMESTAMP WITHOUT TIME ZONE | Time when order was placed      |
| dispatch\_time | TIMESTAMP WITHOUT TIME ZONE | Time when order was dispatched  |

---

### 📑 Dispatch Categories (Based on Time Difference)

* **on\_time\_dispatch**: Dispatched **within 15 minutes** of order received.
* **late\_dispatch**: Dispatched **between 15 and 20 minutes** after order received.
* **super\_late\_dispatch**: Dispatched **after 20 minutes**.

---

### 📤 Expected Output

| Column                | Type    |
| --------------------- | ------- |
| restaurant\_name      | TEXT    |
| on\_time\_dispatch    | INTEGER |
| late\_dispatch        | INTEGER |
| super\_late\_dispatch | INTEGER |

*/
