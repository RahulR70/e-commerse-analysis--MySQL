
---

## 🗃️ Dataset

Each table contains **10 sample rows** for ease of testing and learning.

### Tables and Fields

#### Customers
- `customer_id` (INT, Primary Key)
- `customer_name` (VARCHAR)
- `email` (VARCHAR)
- `city` (VARCHAR)

#### Products
- `product_id` (INT, Primary Key)
- `product_name` (VARCHAR)
- `category` (VARCHAR)
- `price` (DECIMAL)

#### Orders
- `order_id` (INT, Primary Key)
- `customer_id` (Foreign Key → Customers)
- `order_date` (DATE)

#### OrderItems
- `order_item_id` (INT, Primary Key)
- `order_id` (Foreign Key → Orders)
- `product_id` (Foreign Key → Products)
- `quantity` (INT)

---


### 1. Basic SQL Queries
- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`

### 2. Joins
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`

### 3. Subqueries
- Nested queries for filtering and aggregation

### 4. Aggregate Functions
- `SUM()`, `AVG()`, `COUNT()`

### 5. Views
- Creating reusable SQL views for reporting

### 6. Query Optimization
- Using indexes to improve performance

