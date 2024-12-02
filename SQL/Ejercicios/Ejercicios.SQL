-- Ejercicio 1
SELECT 
  tweet_count_per_user AS tweet_bucket, 
  COUNT(user_id) AS users_num 
FROM (
  SELECT 
    user_id, 
    COUNT(tweet_id) AS tweet_count_per_user 
  FROM tweets 
  WHERE tweet_date BETWEEN '2022-01-01' 
    AND '2022-12-31'
  GROUP BY user_id) AS total_tweets 
GROUP BY tweet_count_per_user;

-- Ejercicio 2
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3;

-- Ejercicio 3
SELECT pages.page_id
FROM pages
LEFT JOIN page_likes
ON pages.page_id = page_likes.page_id
WHERE page_likes.page_id IS NULL;

-- Ejercicio 4
SELECT part, assembly_step
FROM parts_assembly
where finish_date IS NULL;

-- Ejercicio 5
SELECT 
    COUNT(CASE WHEN device_type = 'laptop' THEN 1 END) AS laptop_reviews,
    COUNT(CASE WHEN device_type = 'tablet' OR device_type = 'phone' THEN 1 END) AS mobile_views
FROM viewership;


-- Ejercicio 6
SELECT user_id, 
       DATE(MAX(post_date)) - DATE(MIN(post_date)) AS days_between
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id
HAVING COUNT(post_id) >= 2;

-- Ejercicio 7
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_listings j1
WHERE EXISTS (
    SELECT 1
    FROM job_listings j2
    WHERE j1.company_id = j2.company_id
    AND j1.title = j2.title
    AND j1.description = j2.description
    AND j1.id != j2.id
);