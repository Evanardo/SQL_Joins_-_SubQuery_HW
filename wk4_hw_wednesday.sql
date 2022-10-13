-- 1. List all customers who live in Texas (use
-- JOINs)
-- 5 customers in the Texas District

-- SELECT country_id, country
-- FROM country
-- WHERE country = 'United States';

-- SELECT city_id, city, country_id
-- FROM city
-- WHERE country_id = 103;

-- SELECT address_id,address, district
-- FROM address
-- WHERE district = 'Texas';

-- SELECT *
-- FROM city
-- ORDER BY country_id;

SELECT customer_id, first_name, last_name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';


-- SELECT first_name, last_name, title
-- FROM actor
-- INNER JOIN film_actor
-- ON actor.actor_id = film_actor.actor_id
-- INNER JOIN film
-- ON film.film_id = film_actor.film_id
-- ORDER BY title DESC;

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
select first_name, last_name, amount
from customer
inner join payment
on payment.customer_id = customer.customer_id
where amount > 6.99
-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM (amount) > 175
ORDER BY SUM (amount) DESC;
-- get customer info
SELECT first_name, last_name
FROM customer;
SELECT first_name, last_name
FROM customer
WHERE customer_id in(
    SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM (amount) > 175
ORDER BY SUM (amount) DESC
);
-- 4. List all customers that live in Nepal (use the city
-- table)


SELECT first_name, last_name
FROM customer
WHERE country_id = (
SELECT country_id
FROM country
WHERE country = 'Nepal'
);

-- 5. Which staff member had the most
-- transactions?
SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id
ORDER BY COUNT(*) DESC;
SELECT first_name, last_name
FROM staff
WHERE staff_id in (
    SELECT COUNT(payment_id)
    FROM payment
    GROUP BY staff_id
    ORDER BY COUNT(*) DESC
);
SELECT first_name, last_name, staff_id
FROM staff
-- 6. How many movies of each rating are
-- there?
SELECT COUNT(title), rating
FROM film
GROUP BY rating;
-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id in (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 6.99
);
-- 8. How many free rentals did our stores give away?
-- No Data
select amount
from payment
where amount = 0;