-- Lab | SQL Join (Part I)
-- In this lab, you will be using the Sakila database of movie rentals.

Use Sakila;

-- Instructions
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT n.name, Count(DISTINCT(fi.film_id))
FROM sakila.film_category fi
JOIN sakila.category n
ON (fi.category_id = n.category_id)
GROUP BY n.name;

-- Display the total amount rung up by each staff member in August of 2005.

SELECT f.first_name, Sum(p.amount) AS 'Total_amount'
FROM sakila.staff f
JOIN sakila.payment p
ON (f.staff_id = p.staff_id)
GROUP BY f.first_name;

-- Which actor has appeared in the most films?
SELECT f.first_name, Count(DISTINCT(fa.film_id))
FROM sakila.film_actor fa
JOIN sakila.actor f
ON (fa.actor_id = f.actor_id)
GROUP BY f.first_name
ORDER BY COUNT(fa.film_id);

-- Most active customer (the customer that has rented the most number of films)

SELECT f.first_name, Count(rental_id)
FROM sakila.rental sr
JOIN sakila.customer f
ON (sr.customer_id = f.customer_id)
GROUP BY f.first_name 
ORDER BY COUNT(rental_id);


-- Display the first and last names, as well as the address, of each staff member.

SELECT f.first_name AS First_name, f.last_name AS Last_Name, a.address AS Address
FROM sakila.staff f
JOIN sakila.address a
ON (f.address_id = a.address_id)
GROUP BY f.first_name, f.last_name, a.address;




-- List each film and the number of actors who are listed for that film.
SELECT t.title, Count(a.actor_id)
FROM sakila.film t
JOIN sakila.film_actor a
ON (t.film_id = a.film_id)
GROUP BY (t.title)
ORDER BY COUNT(a.actor_id) 
desc;


-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT f.first_name, f.last_name, Sum(p.amount) AS Total_Payment
FROM sakila.payment p
JOIN sakila.customer f
ON p.customer_id = f.customer_id
GROUP BY f.first_name, f.last_name
ORDER BY f.last_name ASC; 


-- List number of films per category.
SELECT n.name, Count(DISTINCT(fc.film_id))
FROM sakila.film_category fc
JOIN sakila.category n
ON fc.category_id = n.category_id
GROUP BY n.name;




