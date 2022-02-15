/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
SELECT DISTINCT("Actor Name")
FROM (
    SELECT
        unnest(special_features) as special_feature,
        first_name || ' ' || last_name as "Actor Name"
    FROM film f
    JOIN film_actor fa ON(f.film_id = fa.film_id)
    JOIN actor a ON(fa.actor_id = a.actor_id)
) t
WHERE special_feature = 'Behind the Scenes'
ORDER BY "Actor Name";
