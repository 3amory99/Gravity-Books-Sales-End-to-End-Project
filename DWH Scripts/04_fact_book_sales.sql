USE gravity_books_DWH
GO
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'fact_book_sales')
	DROP TABLE fact_book_sales;


CREATE TABLE fact_book_sales
  (
     customer_sk     INT NOT NULL,    -- surrogate key as a forigen key
     book_sk         INT NOT NULL,                  -- surrogate key as a forigen key
	 shipping_sk     INT NOT NULL,                  -- surrogate key as a forigen key
     date_sk         INT NOT NULL,                  -- surrogate key as a forigen key

     price           INT,					        -- Measure
     shipping_cost   INT,					        -- Measure

     
     CONSTRAINT fk_fact_book_sales_dim_customer FOREIGN KEY (customer_sk) REFERENCES dim_customer(customer_sk),
     CONSTRAINT fk_fact_sales_dim_book FOREIGN KEY (book_sk) REFERENCES dim_book(book_sk),
	 CONSTRAINT fk_fact_sales_dim_shipping FOREIGN KEY (shipping_sk) REFERENCES dim_shipping(shipping_sk),
     CONSTRAINT fk_fact_sales_dim_date FOREIGN KEY (date_sk) REFERENCES dim_date(DateSK)
  );


-- Create Indexes on forigen keys

-- Create Indexes for Customer key
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_book_sales_dim_customer'
                  AND object_id = Object_id('fact_book_sales'))
	DROP INDEX fact_book_sales.fact_book_sales_dim_customer;

CREATE INDEX fact_book_sales_dim_customer
ON fact_book_sales(customer_sk);

-- Create Indexes for Territor key
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_sales_dim_book'
                  AND object_id = Object_id('fact_book_sales'))
  DROP INDEX fact_book_sales.fact_book_sales_dim_book;

CREATE INDEX fact_sales_dim_territory
ON fact_book_sales(book_sk);

-- Create Indexes for Order Date key
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_sales_dim_date'
                  AND object_id = Object_id('fact_book_sales'))
  DROP INDEX fact_book_sales.fact_book_sales_dim_date;

CREATE INDEX fact_sales_dim_date
ON fact_book_sales(date_sk); 