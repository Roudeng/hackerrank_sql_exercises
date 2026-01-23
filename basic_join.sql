SET NOCOUNT ON;

WITH count AS (
    SELECT h.hacker_id, h.name,
    COUNT(*) AS amountChan
    FROM Hackers AS h
    JOIN Challenges AS c
    ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
        
),
freq AS (
    SELECT amountChan,
    COUNT(*) AS freq_cn
    FROM count
    GROUP BY amountChan

)

SELECT hacker_id, name, c.amountChan
FROM count AS c
JOIN freq AS f
ON c.amountChan = f.amountChan
WHERE freq_cn = 1 OR c.amountChan = (
    SELECT MAX(amountChan) FROM count
)
ORDER BY c.amountChan DESC, hacker_id
;

go