SET NOCOUNT ON;

WITH mScore AS (
    SELECT hacker_id, challenge_id, MAX(score) AS maxScore
    FROM Submissions
    GROUP BY hacker_id, challenge_id
),
total AS (
    SELECT hacker_id, SUM(maxScore) AS totalScore FROM mScore
    GROUP BY hacker_id
)

SELECT h.hacker_id, h.name, t.totalScore 
FROM Hackers AS h
JOIN total AS t
ON h.hacker_id = t.hacker_id
WHERE t.totalScore != 0
ORDER BY t.totalScore DESC, h.hacker_id;

go