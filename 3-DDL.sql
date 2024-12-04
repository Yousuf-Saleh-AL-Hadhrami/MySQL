
# DDL => Data Definition Language 

# Commands to Create The Users , Databases , Table and Altering The Table Structure.

# To Create a new User Account.
  
  - CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password'  -- This Command Creates a new user called admin and can connect only locally and with password value password
  - CREATE USER 'userx'@'localhost';                          -- This Command Creates a new user called userx and can connect locally without a password 
  - CREATE USER 'usery'@'example.com';                        -- This Command Creates a new user called usery and can connect from the specified domain or ip address 
  - CREATE USER 'userz'@'%';                                  -- This Command Creates a new user called userz and can connect from any host 
  - ALTER  USER  'userx'@'localhost' IDENTIFIED BY 'password' -- This Command Alters The username to make a password for his account 

  # To show Data about current mysql users 

  - SELECT User, Host, Password FROM mysql.user;

  # To Change the user or host or passowrd

  - RENAME USER 'userx'@'localhost' to 'userx'@'localhost' IDENTIFIED '123456789'
  - DROP USER 'userx'@'localhost' -- Drop it can create the user a gain databases will not be dropped 

  # Granting Priviliges to users 

  - GRANT privileges ON database_name.* TO 'username'@'host';
  - GRANT ALL ON database_name.* TO 'username'@'host';
  
  - GRANT CREATE ON *.* TO 'userx'@'localhost' FLUSH PRIVILEGES;      -- can create any database 
  - GRANT CREATE USER ON *.* TO 'userx'@'localhost' FLUSH PRIVILEGES; -- can create any database 
  - GRANT ALL PRIVILEGES ON mydb.* TO 'userx'@'localhost' WITH GRANT OPTION;
  - FLUSH PRIVILEGES;


# ==================================================================================================================================================

- CREATE DATABASE IF NOT EXISTS test;
- USE test;
- DROP DATABASE IF EXISISTS test;
- Table with all constraints 

CREATE TABLE users (
    -- Integer type with auto-increment as the primary key
    id INT PRIMARY KEY AUTO_INCREMENT,                   -- INT: Numeric, used for unique identifiers, AUTO_INCREMENT automatically increments for each new row

    -- Varying character length type, with NOT NULL constraint
    name VARCHAR(100) NOT NULL,                          -- VARCHAR: Variable-length string, NOT NULL ensures that a name is required

    -- Fixed length string
    country CHAR(3) NOT NULL,                             -- CHAR: Fixed-length string, useful for codes like country codes (e.g., 'USA'), NOT NULL ensures it can't be NULL

    -- Date and time data types
    birthdate DATE NOT NULL,                             -- DATE: Used for storing date (YYYY-MM-DD), NOT NULL ensures a date is required

    -- Time data type
    last_login TIME,                                     -- TIME: Used for storing time values (HH:MM:SS)

    -- DateTime type
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,       -- DATETIME: Stores both date and time, default value set to current timestamp

    -- Decimal type for storing precise numeric values like money
    salary DECIMAL(10, 2) NOT NULL,                       -- DECIMAL: Exact numeric value with a specified precision (10 digits, 2 after the decimal), NOT NULL ensures salary is provided

    -- Floating point type for approximate numeric values
    height FLOAT,                                        -- FLOAT: Approximate numeric values, good for things like measurements

    -- Boolean data type (using TINYINT as MySQL has no native BOOLEAN)
    is_active TINYINT(1) DEFAULT 1,                      -- TINYINT: Boolean-like, where 0 means FALSE and 1 means TRUE, default value is 1 (TRUE)

    -- Large text fields
    description TEXT,                                    -- TEXT: Used for larger string data, no length limit like VARCHAR

    -- Enumeration for fixed set of values (ACTIVE or INACTIVE)
    status ENUM('active', 'inactive') DEFAULT 'active',  -- ENUM: Defines a set of values the field can take, default is 'active'

    -- Email with UNIQUE constraint to ensure no duplicates
    email VARCHAR(100) UNIQUE NOT NULL,                  -- UNIQUE: Ensures email is unique across the table, NOT NULL means email is mandatory

    -- Foreign Key reference to another table (e.g., a 'departments' table) to create a relationship
    department_id INT,                                   -- INT: Numeric data type for storing department ID
    FOREIGN KEY (department_id) REFERENCES departments(id) -- FOREIGN KEY: Establishes a relationship with the 'departments' table, where 'id' is the primary key

    -- Set a CHECK constraint for the 'age' field, ensuring it is greater than 18
    CHECK (age > 18),                                    -- CHECK: Ensures that the value of age is greater than 18 (age should be over 18)

    -- Auto-increment for the id column (already defined above)
    PRIMARY KEY (id)                                     -- PRIMARY KEY: Uniquely identifies each row, ensuring no two rows can have the same id

) ENGINE=InnoDB;  -- InnoDB is the default storage engine in MySQL, which supports ACID transactions


1. Renaming a Table
You can rename an entire table using the RENAME TO clause.


ALTER TABLE old_table_name RENAME TO new_table_name;
Example:


ALTER TABLE users RENAME TO user_details;
2. Renaming a Column
You can rename a column in a table using the CHANGE or RENAME COLUMN keyword (depending on MySQL version).


ALTER TABLE table_name CHANGE old_column_name new_column_name column_definition;
Example (renaming name column to full_name):


ALTER TABLE users CHANGE name full_name VARCHAR(100);
In MySQL 8.0+ you can use the RENAME COLUMN syntax:


ALTER TABLE users RENAME COLUMN name TO full_name;
3. Changing a Columns Data Type
You can modify the data type of an existing column using the MODIFY keyword.


ALTER TABLE table_name MODIFY column_name new_data_type;
Example (changing the data type of the age column from INT to BIGINT):


ALTER TABLE users MODIFY age BIGINT;
Example (changing the size of a VARCHAR column):


ALTER TABLE users MODIFY email VARCHAR(255);
4. Changing the Size of a Column
You can increase or decrease the size of a VARCHAR, CHAR, or other string-type columns.

Example (increasing the size of the email column):


ALTER TABLE users MODIFY email VARCHAR(255);
Example (reducing the size of name column):


ALTER TABLE users MODIFY name VARCHAR(50);
5. Adding a New Column
You can add new columns to a table using the ADD keyword.


ALTER TABLE table_name ADD column_name column_definition;
Example (adding a new column phone_number):


ALTER TABLE users ADD phone_number VARCHAR(15);
You can also specify the position of the new column using FIRST (for the first position) or AFTER existing_column_name (for placing it after another column):

Example (adding address after name):


ALTER TABLE users ADD address VARCHAR(100) AFTER name;
6. Dropping (Removing) a Column
To remove a column from a table, use the DROP keyword.


ALTER TABLE table_name DROP column_name;
Example (dropping the phone_number column):


ALTER TABLE users DROP phone_number;
7. Adding or Removing a Default Value
You can add or remove a default value for a column.

Add a default value:


ALTER TABLE table_name ALTER column_name SET DEFAULT default_value;
Remove a default value:


ALTER TABLE table_name ALTER column_name DROP DEFAULT;
Example (adding a default value to status column):


ALTER TABLE users ALTER status SET DEFAULT 'active';
Example (removing the default value from status column):


ALTER TABLE users ALTER status DROP DEFAULT;
8. Adding or Removing a NOT NULL Constraint
You can add or remove the NOT NULL constraint to a column.

Add NOT NULL constraint:


ALTER TABLE table_name MODIFY column_name data_type NOT NULL;
Remove NOT NULL constraint:


ALTER TABLE table_name MODIFY column_name data_type NULL;
Example (making address column NOT NULL):


ALTER TABLE users MODIFY address VARCHAR(100) NOT NULL;
Example (removing the NOT NULL constraint from age):


ALTER TABLE users MODIFY age INT NULL;
9. Adding or Removing a UNIQUE Constraint
You can add or drop a UNIQUE constraint to a column.

Add UNIQUE constraint:


ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (column_name);
Remove UNIQUE constraint:


ALTER TABLE table_name DROP INDEX constraint_name;
Example (adding a UNIQUE constraint to email):


ALTER TABLE users ADD CONSTRAINT unique_email UNIQUE (email);
Example (removing the UNIQUE constraint from email):


ALTER TABLE users DROP INDEX unique_email;
10. Adding or Removing an Index
Add an index:


ALTER TABLE table_name ADD INDEX index_name (column_name);
Drop an index:


ALTER TABLE table_name DROP INDEX index_name;
Example (adding an index on name):


ALTER TABLE users ADD INDEX name_index (name);
Example (dropping the index from name):


ALTER TABLE users DROP INDEX name_index;
11. Adding or Removing a FOREIGN KEY Constraint
Add a foreign key:


ALTER TABLE table_name ADD CONSTRAINT fk_constraint_name FOREIGN KEY (column_name) REFERENCES referenced_table (referenced_column);
Drop a foreign key:


ALTER TABLE table_name DROP FOREIGN KEY fk_constraint_name;
Example (adding a foreign key to link department_id in users to id in departments):


ALTER TABLE users ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(id);
Example (removing the foreign key):


ALTER TABLE users DROP FOREIGN KEY fk_department;
12. Adding or Removing a CHECK Constraint
Add a CHECK constraint:


ALTER TABLE table_name ADD CONSTRAINT check_constraint_name CHECK (condition);
Drop a CHECK constraint:


ALTER TABLE table_name DROP CHECK check_constraint_name;
Example (adding a CHECK constraint to age column):


ALTER TABLE users ADD CONSTRAINT check_age CHECK (age > 18);
Example (removing the CHECK constraint):


ALTER TABLE users DROP CHECK check_age;
13. Changing a Columns Position
You can change the position of a column in the table using FIRST or AFTER.


ALTER TABLE table_name MODIFY column_name column_definition FIRST;

ALTER TABLE table_name MODIFY column_name column_definition AFTER existing_column_name;
Example (moving the address column to be the first column):


ALTER TABLE users MODIFY address VARCHAR(100) FIRST;
Example (moving email column after name):


ALTER TABLE users MODIFY email VARCHAR(100) AFTER name;
14. Truncating a Table (Removes All Rows)
While this is not exactly an ALTER TABLE command, it is useful for quickly removing all data without deleting the structure.


TRUNCATE TABLE table_name;







  

