USE gravity_books_DWH
go
-- Drop foregin Keys if exists
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_book_sales_dim_customer'
                  AND parent_object_id = Object_id('fact_book_sales'))
  ALTER TABLE fact_sales
    DROP CONSTRAINT fk_fact_book_sales_dim_customer;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'dim_customer')
	DROP TABLE dim_customer;
go
CREATE TABLE dim_customer
  (
     customer_sk        INT NOT NULL IDENTITY(1, 1),             -- Surrogate key
     customer_id        INT NOT NULL,                            -- Business key
     first_name         NVARCHAR(200),
	 last_name          NVARCHAR(200),
	 email			    NVARCHAR(350),
     address_status     NVARCHAR(30),
	 street_number      NVARCHAR(10),
     street_name        NVARCHAR(200),
     city               NVARCHAR(100),
	 country			NVARCHAR(200),
	 is_current         TINYINT NOT NULL DEFAULT (1),            -- SCD
	 start_date         DATETIME NOT NULL DEFAULT (Getdate()),   -- SCD
     end_date           DATETIME NULL,							 -- SCD
     CONSTRAINT pk_dim_customer PRIMARY KEY CLUSTERED (customer_sk)
  );

-- Create Foreign Keys
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'fact_book_sales'
                  AND type = 'u')
  ALTER TABLE fact_sales
    ADD CONSTRAINT fk_fact_book_sales_dim_customer FOREIGN KEY (customer_sk)
    REFERENCES dim_customer(customer_sk);

-- Create Indexes
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_customer_customer_id'
                  AND object_id = Object_id('dim_customer'))
	DROP INDEX dim_customer.dim_customer_customer_id
go
CREATE INDEX dim_customer_customer_id
ON dim_customer(customer_id);

IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_customer_city'
                  AND object_id = Object_id('dim_customer'))
	DROP INDEX dim_customer.dim_customer_city
go
CREATE INDEX dim_customer_city
ON dim_customer(city); 