/* Task 1
BULK INSERT is a Transact-SQL (T-SQL) command in SQL Server used to 
quickly import large volumes of data from a data file into a SQL Server table or view.

Purpose:
The main purpose of BULK INSERT is:

To efficiently load data from external files (such as text or CSV) into SQL Server tables.

To support data migration, ETL (Extract, Transform, Load) processes, and initial data seeding.

To reduce the overhead and time taken compared to row-by-row insertion


Task 2
Four File Formats That Can Be Imported into SQL Server:
CSV (Comma-Separated Values)
Most common format used with BULK INSERT.

Fields separated by commas and rows separated by line breaks.
TXT (Plain Text Files)

May use custom delimiters like tab (\t) or pipe (|).
XML (eXtensible Markup Language)

Typically used with OPENXML or XML Bulk Load rather than BULK INSERT.
JSON (JavaScript Object Notation)

Imported using functions like OPENJSON, or parsed post-load.

 While BULK INSERT directly supports flat file formats like .csv and .txt, XML and JSON usually
require additional parsing or use of different SQL Server features (like OPENROWSET, BULK, OPENJSON).
/*

Task 3

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);


Task 4

insert into Products values 
(1, 'Laptop', 899.99),
(2, 'Smartphone', 499.50),
(3, 'Headphones', 89.99)

select * from Products


Task 5

What is NULL?
In SQL, NULL represents a missing, unknown, or inapplicable value in a database table.
It does not mean zero (0), empty string (''), or default — it literally means “no value.”
A column defined as NULL can store a NULL value.

You can think of NULL as a placeholder indicating that a value is not known or not provided.

INSERT INTO Products (ProductID, ProductName, Price)
VALUES (4, NULL, 59.99);

In this case, the ProductName is unknown or not provided — it is stored as NULL.

 What is NOT NULL?
When a column is defined with the NOT NULL constraint, it means the column must always contain a value. You cannot insert or update a row with a NULL in that column.

It ensures data integrity by making certain fields mandatory.

Example:

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Department VARCHAR(50) NULL
);
In this case:

Name must have a value when inserting data.

Department can be left blank (i.e., assigned NULL).

task 6

ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName)


task 7
 In SQL, comments are used to describe the purpose or logic of a query for better understanding and
 maintainability. Here's an example of a SQL query with a comment explaining its purpose:

-- This query retrieves all products with a price greater than $100
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price > 100;

Comment Syntax in SQL Server:
-- for single-line comments

/* ... */ for multi-line comments

Example of a multi-line comment:

/* 
  This query selects product details
  where the price is greater than 100.
  Used for identifying premium products.
*/
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price > 100;


task 8

ALTER TABLE Products
ADD CategoryID INT


Task 9

Create table Categories (
CategoryID int Primary Key,
CategoryName Varchar(50) Unique
)


task 10
Purpose of the IDENTITY Column in SQL Server
The IDENTITY column in SQL Server is used to automatically generate unique numeric values 
for each row inserted into a table. It's commonly used to create auto-incrementing primary
keys without manual input.

Key Purposes:
Auto-Incrementing Values
Automatically generates a new number for each row — typically for IDs or keys.

Simplifies Data Entry
Users don’t need to manually supply a value for the ID column during INSERT operations.

Ensures Uniqueness
Helps enforce unique identifiers, especially when used with a PRIMARY KEY constraint.

 Syntax:

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);
IDENTITY(1,1) means:

Start at 1

Increment by 1 for each new row

You can change this, e.g., IDENTITY(1000,10) starts at 1000, increases by 10.

 Example Usage:

INSERT INTO Products (ProductName, Price)
VALUES ('Tablet', 299.99);
You do not insert a value for ProductID — it’s generated automatically.


task 11

an example of how to use BULK INSERT to import data from a text file into the Products table 
in SQL Server:

BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',   -- Fields separated by commas
    ROWTERMINATOR = '\n',    -- Rows separated by new lines
    FIRSTROW = 2             -- Skip the header row if present
);
Explanation:
Products: The target table for data import.

FROM 'C:\Data\products.txt': Full path to the source text file.

FIELDTERMINATOR = ',': Specifies that fields (columns) are separated by commas (CSV format).

ROWTERMINATOR = '\n': Specifies that rows are separated by newline characters.

FIRSTROW = 2: Skips the first row (often the header row with column names).



Task 12

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);


Task 13

PRIMARY KEY and UNIQUE KEY both enforce uniqueness of data in a column or group of columns,
but they have some important differences:

A PRIMARY KEY uniquely identifies each row in a table. It cannot contain NULL values,
so every row must have a valid, unique value for the primary key column(s). Also, each table
can have only one primary key, but that key can be made up of multiple columns (composite key).

A UNIQUE KEY constraint also ensures that all values in the column(s) are unique, but it can 
allow a single NULL value (meaning one row can have a NULL in that column). Unlike the primary key,
a table can have multiple unique constraints on different columns.

In terms of indexing, SQL Server automatically creates a clustered index on the primary key by default 
(unless specified otherwise), but creates a non-clustered index for unique keys.

Summary:
Use a primary key when you want to uniquely identify each row and guarantee that the value is always
present (not null). Use a unique key when you want to prevent duplicates in a column but still allow 
one missing (NULL) value and possibly have multiple such constraints in a table.

Task 14

ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive
CHECK (Price > 0)

Task 15

ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

task 16

UPDATE Products
SET Price = 0
WHERE Price IS NULL


task 17
Purpose of FOREIGN KEY Constraints
A FOREIGN KEY constraint is used to enforce referential integrity between two tables.
It ensures that the value in one table (the child table) corresponds to a valid value in another table (the parent table). This helps maintain consistent and valid relationships across tables.

In other words, a foreign key:

Ensures that a column (or a set of columns) in one table only contains values that exist in a referenced column(s) of another table.

Prevents the insertion of invalid data that does not have a matching record in the referenced table.

Helps avoid orphan records — records that reference something that no longer exists.

Usage of FOREIGN KEY Constraints
Defined on the child table column(s).

References the primary key or a unique key column(s) of the parent table.

Can enforce cascading actions like ON DELETE CASCADE or ON UPDATE CASCADE to automatically propagate changes.

Example
Suppose you have two tables:

Categories (Parent Table) with CategoryID as primary key.

Products (Child Table) with a CategoryID column referencing Categories.CategoryID.

To enforce the foreign key:

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);
Summary
FOREIGN KEY constraints maintain the integrity of relationships between tables.

They prevent invalid data entry that breaks these relationships.

They enable database engines to enforce business rules automatically.

They support cascading updates or deletes to keep data consistent.


task 18

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Age INT,
    CONSTRAINT CHK_Age_Minimum CHECK (Age >= 18)
);

 task 19
CREATE TABLE Clients(
    ID INT IDENTITY(100, 10) PRIMARY KEY,
    Name VARCHAR(100)
);


task 20 
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    PRIMARY KEY (OrderID, ProductID)
);


task 21

ISNULL
Purpose: Replaces a NULL value with a specified replacement value.

Syntax:

ISNULL(expression, replacement_value)

Behavior: If expression is NULL, returns replacement_value; otherwise returns expression.

Example:

SELECT ISNULL(Price, 0) AS Price FROM Products;

This returns 0 whenever Price is NULL.

Note: ISNULL only takes two arguments.

COALESCE
Purpose: Returns the first non-NULL value from a list of expressions.

Syntax:

COALESCE(expression1, expression2, ..., expressionN)

Behavior: Evaluates expressions from left to right and returns the first that is not NULL.

Example:

SELECT COALESCE(DiscountPrice, SpecialPrice, Price, 0) AS FinalPrice FROM Products;
This returns the first non-NULL value among DiscountPrice, SpecialPrice, Price; if all are NULL, returns 0.

Note: Can take two or more arguments.


task 22

Create table Employees (
EmpID int Primary Key,
Email varchar(30) Unique 
)


task 23

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categoriess
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID)
ON DELETE CASCADE
ON UPDATE CASCADE;




