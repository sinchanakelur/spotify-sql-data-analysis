
Spotify Data Analysis and Query Optimization using SQL

## Dataset

- Source: Kaggle
- Dataset Name: Spotify Dataset
- Link:[ https://www.kaggle.com/datasets/your-link-here](https://www.kaggle.com/datasets/sanjanchaudhari/spotify-dataset)

Key Insights
Identified tracks with higher Spotify engagement compared to YouTube views
Analyzed top-performing artists and albums
Observed relationship between energy levels and track popularity
Achieved ~97% query performance improvement using indexing

SQL Concepts Used
Filtering & Sorting
GROUP BY & Aggregations
Subqueries
Common Table Expressions (CTE)
Window Functions (ROW_NUMBER, SUM OVER)
Query Optimization (EXPLAIN, Indexing)

Query Optimization Technique

To improve query performance, we analyzed and optimized SQL queries using indexing and execution plans.

🔍 Initial Performance Analysis (Before Index)

We used the EXPLAIN command to evaluate query performance when retrieving tracks based on the artist column.

Execution Time (E.T.): ~7 ms
Planning Time (P.T.): ~0.17 ms

![EXPLAIN After Index](optimization/explain_after.png)

⚙️ Index Creation

To enhance performance, an index was created on the artist column:

CREATE INDEX idx_artist ON spotify(artist);

👉 This allows faster lookup for queries filtering by artist.

🚀 Performance After Optimization

After indexing, the same query was executed again:

Execution Time (E.T.): ~0.153 ms
Planning Time (P.T.): ~0.152 ms

📸 Refer to screenshot: EXPLAIN After Index

📊 Performance Comparison

The results show a significant reduction in execution time (~97% improvement) after applying indexing.

📈 Refer to performance graph screenshots

💡 Conclusion

Indexing drastically improved query efficiency by reducing execution time and optimizing data retrieval.
This demonstrates the importance of indexing in large-scale databases for performance tuning.

🛠️ Technology Stack
Database: PostgreSQL
SQL Concepts:
DDL, DML
Aggregations, Joins
Subqueries
Window Functions
CTE (WITH clause)
Tools: pgAdmin 4, PostgreSQL
▶️ How to Run the Project
Install PostgreSQL and pgAdmin
Create the database and table
Import dataset (CSV)
Execute queries from /queries folder
Use EXPLAIN to analyze performance
Apply indexing and compare results
🚀 Future Improvements
Build dashboards using Power BI / Tableau
Expand dataset for scalability testing
Apply advanced query optimization techniques
