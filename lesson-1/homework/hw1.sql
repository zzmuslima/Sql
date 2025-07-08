/* Task 1*/
/*
Data refers to raw facts, figures, or information that can be collected, measured,
and analyzed. It has no meaning on its own until it's processed or organized.

A database is an organized collection of data that is stored and accessed electronically.
It allows users to efficiently retrieve, manage, and update data.
A relational database is a type of database that organizes data into one or more **tables** (or "relations")
where each table contains rows and columns.

Relationships between data are established using **keys** (e.g., primary keys and foreign keys). 
A table is a structured set of data elements (values) organized in rows and columns.
Each **row** (also called a record) represents a unique entry,
and each **column** (also called a field) represents a specific attribute of the data.*/

/* Task 2*/
/* 1. Relational Database Management System (RDBMS)
2. High Availability and Disaster Recovery
3. Intelligent Database Capabilities
4. Mobile Business Intelligence
5. Azure SQL Integration */ 

/* Task 3*/
/* There are 2 authentication modes: Windows Authentication mode and mixed mode.
Windows Authentication mode enables Windows Authentication and disables SQL Server Authentication.
Mixed mode enables both Windows Authentication and SQL Server Authentication. 

When a user connects through a Windows user account,
SQL Server validates the account name and password using the Windows principal token in the operating system.
This means that the user identity is confirmed by Windows. 
SQL Server doesn't ask for the password, and doesn't perform the identity validation.
Windows Authentication is the default authentication mode, and is much more secure than SQL Server Authentication.

When using SQL Server Authentication, logins are created in SQL Server that aren't based on Windows user accounts. 
Both the user name and the password are created by using SQL Server and stored in SQL Server. */


/* Task 4*/
create database SchoolDB
use SchoolDB

/* Task 5 */
create table Students (StudentID INT, Name VARCHAR(50), Age INT)
Select * from Students

/* Task 6*/
/* SQL is a language used to communicate with relational databases.
It’s a standard set of commands used to retrieve, manipulate, and manage data.

SQL Server is a Relational Database Management System (RDBMS) developed by Microsoft.
It stores and manages data using tables, and supports SQL for querying. SQL Server is the backend database engine.

SSMS is a graphical user interface (GUI) tool provided by Microsoft to manage SQL Server.
SSMS is the tool/interface used to interact with SQL Server using SQL.*/

/* Task 7*/
/* DDL (Data Definition Language)- defines and manages the structure of the database,
including creating, altering, or deleting database objects like tables, indexes, and views.
Example:DROP. It deletes objects from the database

DML (Data Manipulation Language)- Manipulates data within the database, including inserting,
updating, and deleting data. Example: UPDATE and it updates existing data within a table.

DQL (Data Query Language)- Primarily focuses on querying data from the database. 
Example: SELECT and it is used to retrieve data from the database.

DCL (Data Control Language)- Manages permissions and access control to the database.
Example:REVOKE and it removes previously granted privileges from a user account,
taking away their access to certain database objects or actions.

TCL (Transaction Control Language)- Manages transactions, ensuring data consistency and integrity. 
EXample: COMMIT- Saves all changes made during the transaction.
*/

/* Task 8 */
insert into Students values 
(1, 'Fotima', 18),
(2, 'Hasan', 19),
(3, 'Zuhra', 20)


/* Task 9 */
/* 1- STEP: Need to download the file and save it C disk.
2- STEP: C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup and save it
3- STEP: Need to open SSMS and from Object Explorer right-click the Database and press Restore Database
4-STEP: From Source need to change to Device and click ' ... ' 
5-STEP: ADD the downloaded file then press ok twice.
6-STEP: The file is restored.
*/
