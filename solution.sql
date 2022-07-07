-- Select the first name, last name, and email address of all the customers who have rented a movie.
select DISTINCT c.first_name,c.last_name,c.email
from  sakila.customer c
inner join sakila.rental r
on c.customer_id = r.customer_id ;

-- What is the average payment made by each customer (display the customer id, customer name (concatenated), and the average payment made).
select c.customer_id,concat(c.first_name,c.last_name) as cutomer_name,avg(p.amount) as payment
from  sakila.customer c
inner join sakila.payment p
on c.customer_id = p.customer_id 
group by c.customer_id;

-- Select the name and email address of all the customers who have rented the "Action" movies.

select distinct c.customer_id,concat(c.first_name,c.last_name) as cutomer_name,ca.name
from  sakila.customer c
inner join sakila.film_category f
on date_format(c.last_update,'%y')= date_format(f.last_update,'%y')
inner join sakila.category ca
on f.category_id = ca.category_id
where ca.name= 'Action'
group by c.customer_id;

-- Use the case statement to create a new column classifying existing columns as either or high value transactions based on the amount of payment. If the amount is between 0 and 2, label should be low and if the amount is between 2 and 4, the label should be medium, and if it is more than 4, then it should be high.
select payment_id, amount,(case when amount < 2 then "low"
							when amount > 2 and amount < 4 then "medium"
							when amount > 4 then "high" end) as column1
from sakila.payment;