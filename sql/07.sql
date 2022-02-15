/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */
-- create query that finds the customers who live live in US

SELECT DISTINCT(title)
FROM film f
JOIN inventory i USING(film_id)
WHERE f.film_id NOT IN (
    SELECT film_id
    FROM inventory i
    JOIN rental r ON(i.inventory_id = r.inventory_id)
    JOIN customer cu ON(r.customer_id = cu.customer_id)
    JOIN address a ON(cu.address_id = a.address_id)
    JOIN city ci ON(a.city_id = ci.city_id)
    JOIN country co ON(ci.country_id = co.country_id)
    WHERE country = 'United States'
)
ORDER BY title;
