/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
SELECT special_feature as "special_features", "count" 
FROM
(
    SELECT
        unnest(special_features) as special_feature,
        count(*) as "count"
    FROM film
    GROUP BY special_feature
) t
ORDER BY special_feature;
