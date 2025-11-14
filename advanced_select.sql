SET NOCOUNT ON;

-- 聚合函數MAX()只取1個且會忽略NULL
-- 用CASE WHEN取欄位將表格由直轉橫
SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Docter,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
    -- 子查詢: 給予各職業組別每個人編號
    SELECT Name, Occupation, ROW_NUMBER() OVER (
        PARTITION BY Occupation
        ORDER BY Name
    ) AS number
    FROM OCCUPATIONS
) AS o
GROUP BY o.number
ORDER BY o.number;

go