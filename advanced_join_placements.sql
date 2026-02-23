SET NOCOUNT ON;

WITH fri_sal AS (
    SELECT f.ID, p.Salary FROM Friends AS f
    JOIN Packages AS p
    ON f.Friend_ID = p.ID
),
self_sal AS (
    SELECT s.Name, s.ID, p.Salary FROM Students AS s
    JOIN Packages AS p
    ON s.ID = p.ID
)

SELECT s.Name FROM self_sal AS s
JOIN fri_sal AS f
ON s.ID = f.ID
WHERE f.Salary > s.Salary
ORDER BY f.Salary;

go