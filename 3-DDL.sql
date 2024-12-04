
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

Privilege	           Description	                             Example Command

CREATE	Allows the user to create new databases.	GRANT CREATE ON *.* TO 'userx'@'localhost';
DROP	Allows the user to drop (delete) databases and tables.	GRANT DROP ON mydb.* TO 'userx'@'localhost';
SELECT	Allows the user to select (read) data from tables.	GRANT SELECT ON mydb.* TO 'userx'@'localhost';
INSERT	Allows the user to insert data into tables.	GRANT INSERT ON mydb.* TO 'userx'@'localhost';
UPDATE	Allows the user to update data in tables.	GRANT UPDATE ON mydb.* TO 'userx'@'localhost';
DELETE	Allows the user to delete data from tables.	GRANT DELETE ON mydb.* TO 'userx'@'localhost';
CREATE USER	Allows the user to create new MySQL user accounts.	GRANT CREATE USER ON *.* TO 'userx'@'localhost';
ALTER	Allows the user to modify the structure of existing tables (e.g., adding/removing columns).	GRANT ALTER ON mydb.* TO 'userx'@'localhost';
GRANT OPTION	Allows the user to grant privileges to other users.	GRANT SELECT, INSERT ON mydb.* TO 'userx'@'localhost' WITH GRANT OPTION;
INDEX	Allows the user to create and drop indexes.	GRANT INDEX ON mydb.* TO 'userx'@'localhost';
LOCK TABLES	Allows the user to lock tables.	GRANT LOCK TABLES ON mydb.* TO 'userx'@'localhost';
SHOW DATABASES	Allows the user to see all databases (in SHOW DATABASES command).	GRANT SHOW DATABASES ON *.* TO 'userx'@'localhost';
RELOAD	Allows the user to reload or refresh the MySQL server (e.g., FLUSH commands).	GRANT RELOAD ON *.* TO 'userx'@'localhost';
SUPER	Allows the user to perform administrative tasks, such as killing threads and setting global variables.	GRANT SUPER ON *.* TO 'userx'@'localhost';
PROCESS	Allows the user to view the processes running on the MySQL server.	GRANT PROCESS ON *.* TO 'userx'@'localhost';
REPLICATION CLIENT	Allows the user to request the status of the replication.	GRANT REPLICATION CLIENT ON *.* TO 'userx'@'localhost';
REPLICATION SLAVE	Allows the user to configure the replication slave.	GRANT REPLICATION SLAVE ON *.* TO 'userx'@'localhost';
EVENT	Allows the user to create, alter, drop, and execute events.	GRANT EVENT ON *.* TO 'userx'@'localhost';
TRIGGER	Allows the user to create, alter, and drop triggers.	GRANT TRIGGER ON mydb.* TO 'userx'@'localhost';
FILE	Allows the user to read and write files on the server's filesystem (e.g., LOAD DATA INFILE).	GRANT FILE ON *.* TO 'userx'@'localhost'; 

# ==================================================================================================================================================

- CREATE DATABASE IF NOT EXISTS test;
- USE test;
- DROP DATABASE IF EXISISTS test;







  

