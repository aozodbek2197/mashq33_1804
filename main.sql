-- 1-mashq
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM logs l1
JOIN logs l2 ON l1.id = l2.id - 1 AND l1.num = l2.num
JOIN logs l3 ON l1.id = l3.id - 2 AND l1.num = l3.num;
-- 2-mashq
WITH ranked AS (
    SELECT 
        username,
        activity,
        start_date,
        ROW_NUMBER() OVER (PARTITION BY username ORDER BY start_date DESC) AS rn
    FROM user_activity
)
SELECT username, activity, start_date
FROM ranked
WHERE rn = 2;
