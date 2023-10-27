USE gravity_books_DWH
-- Drop foregin Keys if exists
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_shipping_sales_dim_book'
                  AND parent_object_id = Object_id('fact_book_sales'))
  ALTER TABLE fact_book_sales
    DROP CONSTRAINT fk_fact_shipping_sales_dim_book;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'dim_shipping')
	DROP TABLE dim_shipping
go
CREATE TABLE dim_shipping
  (
     shipping_sk            INT NOT NULL IDENTITY(1, 1),             -- Surrogate key
     shipping_id            INT NOT NULL,                            -- Business key
     shipping_method		NVARCHAR(100) NULL,
	 start_date             DATETIME NOT NULL DEFAULT (Getdate()),    -- SCD
     end_date               DATETIME NULL,							  -- SCD
     is_current             TINYINT NOT NULL DEFAULT (1),             -- SCD
     CONSTRAINT pk_dim_shipping PRIMARY KEY CLUSTERED (shipping_sk)
  );

-- Create Foreign Keys
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'fact_book_sales'
                  AND type = 'u')
  ALTER TABLE fact_book_sales
    ADD CONSTRAINT fk_fact_shipping_sales_dim_book FOREIGN KEY (shipping_sk)
    REFERENCES dim_shipping(shipping_sk);

-- Create Indexes
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_shipping_shipping_id'
                  AND object_id = Object_id('dim_shipping'))
	DROP INDEX dim_shipping.dim_shipping_shipping_id
go
CREATE INDEX dim_shipping_shipping_id
ON dim_shipping(shipping_id);

IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_shipping_method'
                  AND object_id = Object_id('dim_shipping'))
	DROP INDEX dim_shipping.dim_shipping_method
go
CREATE INDEX dim_shipping_method
ON dim_shipping(shipping_method); 