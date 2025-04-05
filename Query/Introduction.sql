

-- Creating a new user schema (if you don't already have one)
CREATE USER mehedi IDENTIFIED BY "MehediCSEDU-29";

-- Granting privileges to the user
GRANT CONNECT, RESOURCE TO mehedi;

ALTER USER mehedi QUOTA UNLIMITED ON users;

--- We have to do this to create a new user schema in Oracle SQL. And we have to grant privileges to the user. We have to logged in as the system user to do this.



--- Table Creation ---

CREATE TABLE branch (
  branch_name VARCHAR2(15) PRIMARY KEY,
  branch_city VARCHAR2(12) NOT NULL,
  assets NUMBER(12) CHECK (assets >= 100000)
);

--- The branch table has a primary key on branch_name and a NOT NULL constraint on branch_city.
--- The assets column has a CHECK constraint to ensure that the value is at least 100000.
--- The branch_name column is of type VARCHAR2(15), and the branch_city column is of type VARCHAR2(12).
--- The assets column is of type NUMBER(12).
--- The primary key constraint ensures that each branch has a unique name.
--- The NOT NULL constraint ensures that the branch_city cannot be null.
--- The CHECK constraint ensures that the assets value is at least 100000.



CREATE TABLE customer (
  customer_id      VARCHAR2(5),
  customer_name    VARCHAR2(15),
  customer_street  VARCHAR2(12),
  customer_city    VARCHAR2(12) NOT NULL,
  cell             VARCHAR2(11) UNIQUE,
  dob              DATE NOT NULL,
  PRIMARY KEY (customer_id)
);

--- The customer table has a primary key on customer_id and a NOT NULL constraint on customer_city and dob.
--- The cell column has a UNIQUE constraint to ensure that each customer has a unique cell number.
--- The customer_id column is of type VARCHAR2(5), and the customer_name, customer_street, and customer_city columns are of type VARCHAR2(15), VARCHAR2(12), and VARCHAR2(12) respectively.
--- The dob column is of type DATE.
--- The primary key constraint ensures that each customer has a unique ID.
--- The NOT NULL constraint ensures that the customer_city and dob cannot be null.
--- The UNIQUE constraint ensures that the cell number is unique across all customers.



CREATE TABLE loan (
  loan_no       CHAR(5),
  branch_name   VARCHAR2(15),
  amount        NUMBER(10,2) NOT NULL,
  PRIMARY KEY (loan_no),
  FOREIGN KEY (branch_name) REFERENCES branch(branch_name),
  CHECK (amount >= 0),
  CHECK (loan_no LIKE 'L-%')
);


--- The loan table has a primary key on loan_no and a NOT NULL constraint on amount.
--- The branch_name column has a foreign key constraint referencing the branch table.
--- The amount column has a CHECK constraint to ensure that the value is non-negative.
--- The loan_no column has a CHECK constraint to ensure that it starts with 'L-'.
--- The loan_no column is of type CHAR(5), and the branch_name column is of type VARCHAR2(15).
--- The amount column is of type NUMBER(10,2). (10 digits total, 2 decimal places).
--- The primary key constraint ensures that each loan has a unique number.
--- The foreign key constraint ensures that the branch_name exists in the branch table.
--- The CHECK constraint ensures that the amount is non-negative.
--- The CHECK constraint on loan_no ensures that it starts with 'L-'.


CREATE TABLE account (
  account_no    CHAR(5),
  branch_name   VARCHAR2(15),
  balance       NUMBER(10,2) NOT NULL,
  CONSTRAINT pk_acc_no PRIMARY KEY (account_no),
  CONSTRAINT fk_acc_br_nm FOREIGN KEY (branch_name) REFERENCES branch(branch_name),
  CONSTRAINT chk_acc_bal CHECK (balance >= 0),
  CONSTRAINT chk_acc_acc_no CHECK (account_no LIKE 'A-%')
);

--- The account table has a primary key on account_no and a NOT NULL constraint on balance.
--- The branch_name column has a foreign key constraint referencing the branch table.
--- The balance column has a CHECK constraint to ensure that the value is non-negative.
--- The account_no column has a CHECK constraint to ensure that it starts with 'A-'.
--- The account_no column is of type CHAR(5), and the branch_name column is of type VARCHAR2(15).
--- The balance column is of type NUMBER(10,2). (10 digits total, 2 decimal places).
--- The primary key constraint ensures that each account has a unique number.
--- The foreign key constraint ensures that the branch_name exists in the branch table.
--- The CHECK constraint ensures that the balance is non-negative.
--- The CHECK constraint on account_no ensures that it starts with 'A-'.



CREATE TABLE depositor (
  customer_id  VARCHAR2(5),
  account_no   CHAR(5),
  PRIMARY KEY (customer_id, account_no),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (account_no) REFERENCES account(account_no)
);

--- The depositor table has a composite primary key on customer_id and account_no.
--- The customer_id column has a foreign key constraint referencing the customer table.
--- The account_no column has a foreign key constraint referencing the account table.
--- The customer_id column is of type VARCHAR2(5), and the account_no column is of type CHAR(5).
--- The primary key constraint ensures that each customer-account pair is unique.
--- The foreign key constraint ensures that the customer_id exists in the customer table.
--- The foreign key constraint ensures that the account_no exists in the account table.
--- The foreign key constraints ensure that the customer_id and account_no exist in their respective tables.
 


CREATE TABLE borrower (
  customer_id  VARCHAR2(5),
  loan_no      CHAR(5),
  PRIMARY KEY (customer_id, loan_no),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (loan_no) REFERENCES loan(loan_no)
);


--- The borrower table has a composite primary key on customer_id and loan_no.
--- The customer_id column has a foreign key constraint referencing the customer table.
--- The loan_no column has a foreign key constraint referencing the loan table.
--- The customer_id column is of type VARCHAR2(5), and the loan_no column is of type CHAR(5).
--- The primary key constraint ensures that each customer-loan pair is unique.
--- The foreign key constraint ensures that the customer_id exists in the customer table.
--- The foreign key constraint ensures that the loan_no exists in the loan table.
--- The foreign key constraints ensure that the customer_id and loan_no exist in their respective tables.




--- Here Independent Schemas are: --- branch, customer 
--- Here Dependent Schemas are: ---  loan, account, depositor, borrower
--- The dependent schemas are linked to the independent schemas through foreign key constraints.


--- The branch table is independent because it does not depend on any other table.
--- The customer table is also independent because it does not depend on any other table.
--- The loan table is dependent on the branch table because it has a foreign key constraint referencing the branch_name column in the branch table.
--- The account table is dependent on the branch table because it has a foreign key constraint referencing the branch_name column in the branch table.
--- The depositor table is dependent on both the customer and account tables because it has foreign key constraints referencing the customer_id and account_no columns in those tables.
--- The borrower table is dependent on both the customer and loan tables because it has foreign key constraints referencing the customer_id and loan_no columns in those tables.
--- The dependent schemas are linked to the independent schemas through foreign key constraints.
--- This means that the dependent schemas cannot exist without the independent schemas.



--- Describing a Table: ---

DESCRIBE branch;
DESCRIBE customer;  
DESCRIBE loan;
DESCRIBE account;
DESCRIBE depositor;
DESCRIBE borrower;

--- The DESCRIBE command is used to display the structure of the tables created above.
--- It shows the column names, data types, and constraints for each table.

-- Modifying the structure of a table: --

CREATE TABLE employee (
  emp_id    VARCHAR2(5),
  emp_name  VARCHAR2(50),
  salary    NUMBER(10, 2)
);

DESCRIBE employee;

--- Adding new collumns/keys to the table: --

--- Adding new columns to the employee table ---    
ALTER TABLE employee
ADD (
  mobile  NUMBER(11),
  doj     DATE NOT NULL
);

DESCRIBE employee;

--- Adding a primary key to the employee table ---
ALTER TABLE employee
ADD CONSTRAINT emp_id_pk PRIMARY KEY (emp_id);

DESCRIBE employee;

--- Modifying existing columns/data types/size: ---

DESCRIBE employee;

ALTER TABLE employee
MODIFY (emp_name VARCHAR2(35));

--- The above command modifies the size of the emp_name column from VARCHAR2(50) to VARCHAR2(35).

DESCRIBE employee;

ALTER TABLE employee
MODIFY (mobile VARCHAR2(11));

--- The above command modifies the data type of the mobile column from NUMBER(11) to VARCHAR2(11).

DESCRIBE employee;


ALTER TABLE employee
RENAME COLUMN emp_name TO employee_name;

--- The above command renames the emp_name column to employee_name.

DESCRIBE employee;


--- Dropping columns/keys: ---

DESCRIBE employee;

ALTER TABLE employee
DROP COLUMN mobile;

--- The above command drops the mobile column from the employee table.

DESCRIBE employee;

ALTER TABLE employee
DROP CONSTRAINT emp_id_pk;

--- The above command drops the primary key constraint from the employee table.

DESCRIBE employee;

-- Renaming Tables: --

RENAME employee TO emp;

--- The above command renames the employee table to emp.
DESCRIBE emp;

--- Destroying Tables: --

DROP TABLE emp;

--- The above command drops the emp table from the database.



--- Inserting Data into Tables: ---

--- Inserting data into the branch table ---

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Dhanmondi', 'Dhaka', 10000000);

--- Showing the inserted data from the branch table ---

SELECT * FROM branch;

--- Above command shows all the data from the branch table.

SELECT branch_name, assets FROM branch;

--- The above command shows the branch_name and assets columns from the branch table.


--- Insert multiple rows into the branch table ---

INSERT ALL
  INTO branch (branch_name, branch_city, assets) VALUES ('Brighton', 'Brooklyn', 7100000)
  INTO branch (branch_name, branch_city, assets) VALUES ('Downtown', 'Brooklyn', 9000000)
  INTO branch (branch_name, branch_city, assets) VALUES ('Mianus', 'Horseneck', 400000)
  INTO branch (branch_name, branch_city, assets) VALUES ('Northtown', 'Rye', 3700000)
  INTO branch (branch_name, branch_city, assets) VALUES ('Perryridge', 'Horseneck', 1700000)
  INTO branch (branch_name, branch_city, assets) VALUES ('Pownal', 'Bennington', 300000)
  INTO branch (branch_name, branch_city, assets) VALUES ('Redwood', 'Palo Alto', 2100000)
  INTO branch (branch_name, branch_city, assets) VALUES ('Round Hill', 'Horseneck', 8000000)
SELECT * FROM dual;

SELECT * FROM branch;


COMMIT;
--- The above command commits the changes made to the branch table.









 