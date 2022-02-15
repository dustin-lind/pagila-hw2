/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */
SELECT title
FROM 
(
    SELECT
        f.title,
        count(f.film_id) as num_times
    FROM film f
    JOIN inventory i ON(f.film_id=i.film_id)
    JOIN rental r ON(i.inventory_id=r.inventory_id)
    JOIN customer c ON(r.customer_id=c.customer_id)
    WHERE c.customer_id = 1
    GROUP BY f.film_id
) data
WHERE num_times > 1;
