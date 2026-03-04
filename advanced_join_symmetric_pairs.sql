SET NOCOUNT ON;

WITH diff_pair AS (
    -- X <> Y
    SELECT f1.X, f1.Y FROM Functions AS f1
    JOIN Functions AS f2
    ON f1.X = f2.Y AND f2.X = f1.Y
    WHERE f1.X < f1.Y
    UNION ALL
    -- X == Y
    SELECT X, Y FROM Functions
    WHERE X = Y
    GROUP BY X, Y
    HAVING COUNT(*) > 1
)

SELECT DISTINCT X, Y FROM diff_pair
ORDER BY X;

go