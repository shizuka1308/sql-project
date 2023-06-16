# sql-project

We propose a movie information system that provides users with a comprehensive collection of movie data, including ratings, genres, actors, release year, and other relevant information. This system will enable users to search for and discover movies that meet their specific needs and preferences quickly and easily.




To load data into the tables from tab or comma-separated files, you can use the COPY command in SQL. Here's an example of how to load data from a CSV file:
COPY my_table FROM '/path/to/my_file.csv' WITH (FORMAT csv, DELIMITER ',', HEADER true);

We have added all the 6 table in .csv format in our folder. 



CSE 4/560 Data Models and Query Language Semester Project

1.1 Tasks
The task details are as follows:

1. Select one interesting use-case domain, building your database using SQL.
It should be relatively substantial, but not too enormous. Several project ideas are described at the end of this document. However, these ideas aim to support you start thinking, and you are encouraged to come up with your own choice of usecase. Please keep the following points in mind: a) while real datasets are highly recommended, you may also use program-generated ”fake” datasets if real ones are too difficult to obtain; b) How will you use the data? What kind of queries do you want to ask? How is the data updated? Your application should support both queries and updates.

2. Design the database schema. Start with an E/R diagram and convert it
to a relational schema. Identify any constraints that may be applicable in your usecase problem and implement them using database constraints. If you plan to work with real datasets, it is important to go over some real data samples to validate your design. Do not forget to apply database design theory and check for redundancies.

3. Create a sample database using a small subset by hand to facilitate debug- ging and testing because large datasets make debugging difficult. It is good for different scripts to automatically create/load/alter/update/destroy the sample database.

4. Acquire the large ”production” dataset, either by downloading it from a real data source or generating it using a program. Make sure the dataset fits your schema. You might need to write programs/scripts to transform them into a suitable form for loading into a database for real datasets. For program- generated datasets, make sure they contain interesting enough ”links” across rows of different tables to show the results of different Ad-vanced SQL queries learned in class.

5. You are required to make sure all of your relations are in Boyce-Codd Normal Form. Provide a list of dependencies for each relation. Decompose them if the tables are not in BCNF. If you decide to keep it in 3NF instead of BCNF, justify the decision for a particular relation. Your report for this milestone should contain a separate section with the details of the transformation from the initial schema to the final schema where the relations are in BCNF. Note: This is quite possible that your initial schema is already in BCNF, and in that case, you need to provide us the functional dependencies and convince us that the relations are already in BCNF.

6. Do you specifically run into any problem while handling the larger dataset? Did you try to adopt some indexing concept to resolve? Briefly describe the questions you faced and how you solved them.

7. Test your database with more than 8 SQL queries. You are supposed to design 1 or 2 queries for each inserting, deleting, and updating operation in your dataset. And please write select queries no less than 4 queries. Your select queries should be in different types of statements, for example, you can use ”join”, ”order by”, ”group by”, subquery, etc. Get your execution results and take screenshots to show them.

8. Query execution analysis: identify three problematic queries (show their cost), where the performance can be improved. Provide a detailed exe-cution plan (you may use EXPLAIN in PostgreSQL) on how you plan to improve these queries. You can find the EXPLAIN tool as the Figure 1.

9. Bonus Task [10] Build a running website that links with your database to display/visualize query and query results. You can use any language
to implement your work. However, all the structures should be submitted in your second milestone, and the website address should be included in your final report.
