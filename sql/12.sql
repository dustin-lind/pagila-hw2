/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
SELECT *
FROM (
    SELECT 
        title
    FROM (
        SELECT
            title,
            unnest(special_features) as special_feature
        FROM film
    ) bts
    WHERE special_feature = 'Behind the Scenes'
) data1
JOIN ( 
    SELECT
        title
    FROM (
        SELECT
            title,
            unnest(special_features) as special_feature
        FROM film
    ) t
    WHERE special_feature = 'Trailers'
) data2 USING(title)  
ORDER BY title;
