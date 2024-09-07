# Weather-Station-Case
### Situation:
Led this SQL project, aimed at building a comprehensive weather data system, leveraging robust database design and query capabilities to analyze meteorological data effectively.

### Task:
The objective was to create and manage a relational database to store, manipulate, and analyze weather station data. The project required the use of SQL DDL and DML commands, aggregate functions, and various SQL operations to ensure efficient data management and insightful reporting.

### Action:
#### 1. DDL Commands
Created the database schema with two tables - station and stats. The station table includes columns such as ID (Primary Key), CITY, STATE, LAT_N, and LONG_W. The stats table includes ID (Foreign Key from 'station'), MONTH, TEMP_F, and RAIN_I.
#### 2. DML Commands
Inserted and updated records in both tables, ensuring accurate weather data.
#### 3. Aggregate Functions & ROUND() Function
Calculated max and min temperatures, along with average temperature and rainfall, thereby rounding the results for readability.
#### 4. Inner Join & Subquery
Retrieved comprehensive data by joining the two tables, and used subqueries for complex data extraction.
#### 5. Group By & Order By
Grouped data by city, and ordered data by month and temperature, in separate queries, to highlight trends and anomalies.
#### 6. IN Operator
Filtered data to produce specific results for targeted analysis.

### Result:
The project culminated in a dynamic database capable of detailed weather analysis, facilitating accurate reporting and insightful data-driven decisions.
