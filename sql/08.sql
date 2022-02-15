/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
SELECT title
FROM
(
    SELECT
        title,
        rating,
        unnest(special_features) as special_feature
    FROM film
) t
WHERE special_feature='Trailers' AND rating='G'
ORDER BY title;
