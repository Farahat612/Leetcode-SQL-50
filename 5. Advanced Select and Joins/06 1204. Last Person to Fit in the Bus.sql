SELECT person_name 
FROM 
(
  SELECT person_name, SUM(weight) OVER(ORDER BY turn) as com_weight
  FROM queue
) alias
WHERE com_weight <= 1000
ORDER BY com_weight DESC
LIMIT 1



-- Better soltion:
SELECT person_name
FROM (
    SELECT person_name, 
           weight,
           turn,
           SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
) AS cumulative
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
