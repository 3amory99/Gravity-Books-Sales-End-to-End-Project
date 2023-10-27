use gravity_books_DWH
select * from dim_customer

use gravity_books_DWH
select * from dim_book

use gravity_books_DWH
select * from dim_shipping

use gravity_books_DWH
select * from fact_book_sales

use gravity_books
select * from cust_order

----------------------------------------------------

select c.customer_id,c.first_name,ads.address_status 
from customer as c 
join customer_address as ca
on c.customer_id = ca.customer_id
join address_status as ads7
on ca.status_id = ads.status_id

-- boda
select C.customer_id , first_name , 
last_name ,email ,  address_status, 
street_number , street_name, city, country_name
from customer C
LEFT OUTER JOIN customer_address CA
on C.customer_id = CA.customer_id
LEFT OUTER JOIN address_status A_S
on CA.status_id = A_S.status_id 
LEFT OUTER JOIN address A
on CA.address_id = A.address_id
LEFT OUTER JOIN country CO
on CO.country_id = A.country_id
 


select c.customer_id,ads.street_name,ads.street_number,ads.city, co.country_name
from customer as c 
left join customer_address as ca
on c.customer_id = ca.customer_id
left join [address] as ads
on ca.address_id = ads.address_id
left join [country] as co
on ads.country_id = co.country_id




-- delete 10% records in dim_customer
delete from dbo.dim_customer where customer_sk % 10 = 3;

-- update city records in dim_customer to check (Changing SCD Type 1)
update dim_customer set city = 'Alex'
where city = 'London'

-- update phone records in dim_customer to check (Historical SCD Type 2)
UPDATE dim_customer 
SET    phone = Substring(phone, 10, 3) 
               + Substring(phone, 4, 5) + Substring(phone, 9, 1) 
               + Substring(phone, 1, 3) 
WHERE  Len(phone) = 12 AND LEFT(phone, 3) BETWEEN '101' AND '125'; 


-- check
SELECT customer_id, Count(*) 
FROM   dim_customer 
GROUP  BY customer_id 
HAVING Count(*) > 1 

SELECT * 
FROM   dim_customer 
WHERE  customer_id = 11036 

--- customer data
select c.customer_id, c.first_name,c.last_name,c.email, ads.address_status, ad.street_name, ad.street_number, ad.city, co.country_name
from customer as c 
left join customer_address as ca
on c.customer_id = ca.customer_id
left join address_status as ads
on ca.status_id = ads.status_id
left join [address] as ad
on ca.address_id = ad.address_id
left join country as co
on ad.country_id = co.country_id

-- Book data 
select b.book_id, b.title, b.isbn13,b.num_pages,b.publication_date,l.language_code,l.language_name,p.publisher_name,au.author_name
from book as b
left join publisher as p
on b.publisher_id = p.publisher_id
left join book_language as l
on b.language_id = l.language_id
left join book_author as a
on b.book_id = a.book_id
left join author as au
on a.author_id = au.author_id
 
-- fact table joins
select co.customer_id, b.book_id, co.shipping_method_id,ol.price,s.cost,format(co.order_date ,'yyyy-MM-dd 00:00:00.000') as order_date
from cust_order as co
left join order_line as ol
on co.order_id = ol.order_id
left join book as b
on ol.book_id = b.book_id 
left join shipping_method s
on s.method_id = co.shipping_method_id

-- boda fact joins
select customer_id , price , OL.book_id  , cost ,format(order_date ,'yyyy-MM-dd 00:00:00.000')
from cust_order CO
inner join order_line OL
on CO.order_id = OL.order_id
inner join book B
on OL.book_id = B.book_id
inner join shipping_method SM
on CO.shipping_method_id = SM.method_id