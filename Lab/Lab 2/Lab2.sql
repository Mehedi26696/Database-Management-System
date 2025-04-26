

-- Lab 2: SQL DDL and DML Statements

-- Create the tables and insert data into them
-- The tables are: branch, customer, account, loan, depositor, borrower
 
CREATE TABLE branch (
  branch_name VARCHAR2(15) ,
  branch_city VARCHAR2(12) CONSTRAINT nn_br_ct NOT NULL,
  assets NUMBER(12),
  CONSTRAINT pk_br_nm PRIMARY KEY(branch_name),
  CONSTRAINT chk_as CHECK (assets>=100000)
);

 

-- The customer table has a primary key constraint on customer_id and a unique constraint on cell
-- The cell number must be unique and cannot be null
-- The dob column cannot be null
-- The customer_city column cannot be null
-- The customer_id column must be 5 characters long
-- The customer_name column must be 15 characters long

CREATE TABLE customer (
  customer_id      VARCHAR2(5),
  customer_name    VARCHAR2(15),
  customer_street  VARCHAR2(12),
  customer_city    VARCHAR2(12) CONSTRAINT nn_cust_ct NOT NULL,
  cell             VARCHAR2(11),
  dob              DATE CONSTRAINT nn_dob NOT NULL,
  CONSTRAINT pk_cust_id PRIMARY KEY (customer_id),
  CONSTRAINT unq_cell UNIQUE(cell)
);



-- The account table has a primary key constraint on account_no and a foreign key constraint on branch_name
-- The balance column cannot be null and must be greater than or equal to 0
-- The account_no column must be 5 characters long and start with 'A-'
-- The branch_name column must exist in the branch table
-- The branch_name column must be 15 characters long

CREATE TABLE account (
  account_no    CHAR(5),
  branch_name   VARCHAR2(15),
  balance       NUMBER(10,2) NOT NULL,
  CONSTRAINT prik_acc_no PRIMARY KEY (account_no),
  CONSTRAINT forei_acc_br_nm FOREIGN KEY (branch_name) REFERENCES branch(branch_name),
  CONSTRAINT chk_acc_bal CHECK (balance >= 0),
  CONSTRAINT chk_acc_no CHECK (account_no LIKE 'A-%')
);


-- The loan table has a primary key constraint on loan_no and a foreign key constraint on branch_name   
-- The amount column cannot be null and must be greater than or equal to 0
-- The loan_no column must be 5 characters long and start with 'L-'
-- The branch_name column must exist in the branch table
-- The branch_name column must be 15 characters long
CREATE TABLE loan (
  loan_no       CHAR(5),
  branch_name   VARCHAR2(15),
  amount        NUMBER(10,2) CONSTRAINT nn_am NOT NULL,
  CONSTRAINT pk_loan PRIMARY KEY (loan_no),
  CONSTRAINT forei_br_nm FOREIGN KEY (branch_name) REFERENCES branch(branch_name),
  CONSTRAINT chk_am CHECK (amount >= 0),
  CONSTRAINT chk_loan_no CHECK (loan_no LIKE 'L-%')
);

-- The depositor table has a primary key constraint on customer_id and account_no
-- The customer_id column must exist in the customer table
-- The account_no column must exist in the account table
-- The customer_id column must be 5 characters long

CREATE TABLE depositor (
  customer_id  VARCHAR2(5),
  account_no   CHAR(5),
  CONSTRAINT pk_cust_acc PRIMARY KEY (customer_id, account_no),
  CONSTRAINT forei_cust_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT forei_acc_no FOREIGN KEY (account_no) REFERENCES account(account_no)
);

-- The borrower table has a primary key constraint on customer_id and loan_no
-- The customer_id column must exist in the customer table
-- The loan_no column must exist in the loan table
-- The customer_id column must be 5 characters long

CREATE TABLE borrower (
  customer_id  VARCHAR2(5),
  loan_no      CHAR(5),
  CONSTRAINT pk_cust_loan PRIMARY KEY (customer_id, loan_no),
  CONSTRAINT forei_cust_id_br FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT forei_loan_no FOREIGN KEY (loan_no) REFERENCES loan(loan_no)
);


-- Insert data into the tables
-- The branch table has a primary key constraint on branch_name and a unique constraint on branch_city  


INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Dhanmondi', 'Dhaka', 10000000);

INSERT INTO branch
VALUES ('Banani', 'Dhaka', 100000000);

-- data of the branch table

SELECT * FROM branch;



INSERT INTO account VALUES ('A-101', 'Banani', 1500.00);

INSERT INTO account VALUES ('A-102', 'Banani', 500.00);


-- Insert multiple rows into the branch table using the INSERT ALL statement
-- The branch table has a primary key constraint on branch_name and a unique constraint on branch_city

insert all
  into branch values('Brighton', 'Brooklyn', 7100000)
  into branch values('Downtown', 'Brooklyn', 9000000)
  into branch values('Mianus', 'Horseneck', 400000)
  into branch values('Northtown', 'Rye', 3700000)
  into branch values('Perryridge', 'Horseneck', 1700000)
  into branch values('Pownal', 'Bennington', 300000)
  into branch values('Redwood', 'Palo Alto', 2100000)
  into branch values('Round Hill', 'Horseneck', 8000000)
select * from dual;

select * from branch;

INSERT ALL
  INTO customer VALUES ('C-005', 'Adams', 'Spring', 'Pittsfield', '01552524521', TO_DATE('01-Nov-1971', 'DD-Mon-YYYY'))
  INTO customer VALUES ('C-007', 'Brooks', 'Senator', 'Brooklyn', '01725545895', TO_DATE('05-Dec-1980', 'DD-Mon-YYYY'))
  INTO customer VALUES ('C-001', 'Curry', 'North', 'Rye', '01551425428', TO_DATE('15-May-1984', 'DD-Mon-YYYY'))
  INTO customer VALUES ('C-003', 'Glenn', 'Sand Hill', 'Woodside', '01915475865', TO_DATE('01-Feb-1975', 'DD-Mon-YYYY'))
  INTO customer VALUES ('C-012', 'Green', 'Walnut', 'Stamford', '01715254632', TO_DATE('12-Sep-1985', 'DD-Mon-YYYY'))
  INTO customer VALUES ('C-002', 'Hayes', 'Main', 'Harrison', '01912542548', TO_DATE('18-Jul-1980', 'DD-Mon-YYYY'))
  INTO customer VALUES ('C-004', 'Johnson', 'Alma', 'Palo Alto', '01552986547', TO_DATE('17-May-1978', 'DD-Mon-YYYY'))
  INTO customer VALUES ('C-090', 'Jones', 'Main', 'Harrison', '01754254256', TO_DATE('25-Dec-1974', 'DD-Mon-YYYY'))
  INTO customer VALUES ('C-006', 'Lindsay', 'Park', 'Pittsfield', '01785458565', TO_DATE('18-Jun-1988', 'DD-Mon-YYYY'))
  INTO customer VALUES ('C-008', 'Smith', 'North', 'Rye', '01925654785', TO_DATE('15-Sep-1990', 'DD-Mon-YYYY'))
  INTO customer VALUES ('C-010', 'Turner', 'Putnam', 'Stamford', '19145258745', TO_DATE('11-Mar-1978', 'DD-Mon-YYYY'))
  INTO customer VALUES ('C-009', 'Williams', 'Nassau', 'Princeton', '01724552654', TO_DATE('08-Aug-1992', 'DD-Mon-YYYY'))
SELECT * FROM dual;

select * from customer;

INSERT ALL
  INTO account VALUES ('A-201', 'Brighton', 900)
  INTO account VALUES ('A-215', 'Mianus', 700)
  INTO account VALUES ('A-217', 'Brighton', 750)
  INTO account VALUES ('A-222', 'Redwood', 700)
  INTO account VALUES ('A-305', 'Round Hill', 350)
SELECT * FROM dual;

select * from account;

INSERT ALL
  INTO depositor VALUES ('C-002', 'A-102')
  INTO depositor VALUES ('C-004', 'A-101')
  INTO depositor VALUES ('C-004', 'A-201')
  INTO depositor VALUES ('C-009', 'A-217')
  INTO depositor VALUES ('C-006', 'A-222')
  INTO depositor VALUES ('C-008', 'A-215')
  INTO depositor VALUES ('C-003', 'A-305')
SELECT * FROM dual;

select * from depositor;

INSERT ALL
  INTO loan VALUES ('L-11', 'Round Hill', 900)
  INTO loan VALUES ('L-14', 'Downtown', 1500)
  INTO loan VALUES ('L-15', 'Perryridge', 1500)
  INTO loan VALUES ('L-16', 'Perryridge', 1300)
  INTO loan VALUES ('L-17', 'Downtown', 1000)
  INTO loan VALUES ('L-23', 'Redwood', 2000)
  INTO loan VALUES ('L-93', 'Mianus', 500)
SELECT * FROM dual;

select * from loan;

INSERT ALL
  INTO borrower VALUES ('C-005', 'L-16')
  INTO borrower VALUES ('C-001', 'L-93')
  INTO borrower VALUES ('C-002', 'L-15')
  INTO borrower VALUES ('C-004', 'L-14')
  INTO borrower VALUES ('C-010', 'L-17')
  INTO borrower VALUES ('C-008', 'L-11')
  INTO borrower VALUES ('C-008', 'L-23')
  INTO borrower VALUES ('C-009', 'L-17')
SELECT * FROM dual;

select * from borrower;

-- Queries to test the tables and constraints
-- 1. Find the names of all customers who live in 'Pittsfield'.
-- 2. Find the names of all customers whose cell number starts with '017'.

select * from customer where customer_city='Pittsfield';
select * from customer where substr(cell,1,3)='017';



-- 3. It finds all customers who have taken a loan from a specific branch and displays their loan and branch details. 

select *from branch b, loan l, borrower br, customer c
where b.branch_name = l.branch_name
  and l.loan_no = br.loan_no
  and br.customer_id = c.customer_id;

