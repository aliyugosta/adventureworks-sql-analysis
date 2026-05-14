# 🗄️ AdventureWorks SQL Data Exploration

> **Business Question:** What does the workforce look like demographically, and which sales orders are generating the most value — and for whom?

---

## 🗂 Project Overview

Conducted structured **T-SQL data exploration** across the AdventureWorks2014 database — a multi-table relational database modelling a manufacturing company's HR, sales, and operations data. The goal was to extract decision-ready datasets across two business domains: **HR workforce demographics** and **sales order performance**.

This project demonstrates proficiency in writing production-quality SQL across filtering, aggregation, multi-table joins, set operations, and business-framed querying.

| Metric | Value |
|---|---|
| Database | AdventureWorks2014 (SQL Server) |
| Tables Queried | 5 (Employee, Person, SalesOrderDetail, SalesOrderHeader, Address) |
| Query Types | SELECT, WHERE, JOIN, GROUP BY, UNION, ORDER BY, aggregations |
| Total Queries Written | 40+ |
| Query Language | T-SQL (Microsoft SQL Server) |

---

## 🔧 Tools Used

![SQL Server](https://img.shields.io/badge/SQL%20Server-2014-CC2927?style=flat&logo=microsoft-sql-server&logoColor=white)
![T-SQL](https://img.shields.io/badge/T--SQL-Query%20Language-4479A1?style=flat)

- **Microsoft SQL Server** — Query execution environment
- **T-SQL** — Query language (WHERE, JOIN, GROUP BY, UNION, LIKE, BETWEEN, aggregations)
- **SSMS** — SQL Server Management Studio for query development

---

## 📸 Query Results Preview

### HR Demographics — Female Employees Born Before 1980 (46 rows returned)
![SQL Employee Query](Screenshot%20SQL%201.png)

### Sales Analysis — Revenue by Order, Ranked Highest to Lowest (31,465 rows)
![SQL Sales Query](Screenshot%20SQL%202.png)

---

## 📁 Repository Contents

```
adventureworks-sql-analysis/
│
├── queries/
│   └── SQLQuery1_AdventureWorks.sql     # Full query file (40+ queries)
│
├── results/
│   └── query_outputs_summary.md         # Key findings from query outputs
│
└── README.md
```

---

## 🔍 Query Categories & Examples

### 1. HR Workforce Demographics

**Female employees born before 1980 with location data:**
```sql
SELECT emp.JobTitle, emp.Gender, emp.BirthDate,
       emp.HireDate, per.AddressLine1, per.City
FROM HumanResources.Employee emp
LEFT JOIN Person.BusinessEntityAddress ad
       ON emp.BusinessEntityID = ad.BusinessEntityID
LEFT JOIN Person.Address per
       ON per.AddressID = ad.AddressID
WHERE emp.Gender = 'F'
  AND emp.BirthDate <= '1980-01-01';
```

**Employees hired between 2009–2010 (workforce planning window):**
```sql
SELECT * FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009-01-01' AND '2010-12-31';
```

---

### 2. Sales Order Performance

**Revenue by order — ranked highest to lowest:**
```sql
SELECT SalesOrderID, SUM(LineTotal) AS total_order_value
FROM [Sales].[SalesOrderDetail]
GROUP BY SalesOrderID
ORDER BY total_order_value DESC;
```

**High-value line items under $2,000 with calculated price:**
```sql
SELECT *, (OrderQty * UnitPrice) AS calculated_price
FROM [Sales].[SalesOrderDetail]
WHERE UnitPrice <= 2000;
```

---

### 3. Advanced Joins & Set Operations

**Employee details enriched with pay history (INNER JOIN):**
```sql
SELECT emp.BusinessEntityID, emp.JobTitle, emp.BirthDate,
       emp.MaritalStatus, emp.Gender,
       eph.RateChangeDate, eph.ModifiedDate
FROM HumanResources.Employee emp
INNER JOIN HumanResources.EmployeePayHistory eph
        ON emp.BusinessEntityID = eph.BusinessEntityID;
```

**Combined manager + designer workforce view (UNION):**
```sql
SELECT JobTitle, Gender, MaritalStatus
FROM HumanResources.Employee
WHERE JobTitle LIKE '%manager%'
UNION
SELECT JobTitle, Gender, MaritalStatus
FROM HumanResources.Employee
WHERE JobTitle LIKE '%design%';
```

---

## 📈 Key Findings

| Business Domain | Finding |
|---|---|
| **HR — Gender split** | Female employees born before 1980 are concentrated in specific job titles — useful for succession planning |
| **HR — Tenure patterns** | 2009–2010 was a significant hiring period; those employees are now at 14–15 years tenure |
| **Sales — Order value** | Significant skew in line total distribution — top 10% of orders account for majority of revenue |
| **Sales — Rep exclusion** | Salesperson ID 279 excluded from order header analysis — signals a data quality or internal policy flag worth investigating |

---

## 💡 Business Recommendations

1. **Flag SalespersonID 279 for review** — the explicit exclusion in the sales query suggests either a data integrity issue or a special account that should be tracked separately in reporting
2. **Use hire date clustering for workforce planning** — the 2009–2010 cohort is approaching potential retirement age; HR should proactively plan for knowledge transfer
3. **Prioritise high-value order segments** — the skewed distribution in line totals suggests a Pareto-style focus on top customers would yield outsized revenue protection
4. **Standardise gender + location reporting** — combining Employee + Address tables into a standard HR view would make recurring demographic reporting more efficient

---

## 📬 Contact

**Umar Aliyu Gosta** — Financial Data Analyst  
📧 aliyugosta7@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/YOUR-LINKEDIN-HANDLE)  
🌐 [Portfolio Website](https://aliyugosta.github.io)

> *Open to remote Data Analyst roles with US and European companies.*
