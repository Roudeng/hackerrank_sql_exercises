SET NOCOUNT ON;


WITH start AS (
    -- 不是個別start_date一組不加PARTITION BY，按照日期排序
    SELECT Task_ID, Start_Date, ROW_NUMBER() OVER (ORDER BY Start_Date) AS rn FROM Projects
    -- start_date不在所有end_date集合中
    WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)
),
ends AS (
    SELECT Task_ID, End_Date, ROW_NUMBER() OVER (ORDER BY End_Date) AS rn FROM Projects
    WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)
)

SELECT s.Start_Date AS Start_Date, e.End_Date AS End_Date
FROM start AS s
JOIN ends AS e
ON s.rn = e.rn
ORDER BY DATEDIFF(day, s.Start_Date, e.End_Date), s.Start_Date;

go