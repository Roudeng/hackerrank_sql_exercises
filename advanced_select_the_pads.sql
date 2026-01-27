SET NOCOUNT ON;


SELECT CONCAT(Name, '(',UPPER(SUBSTRING(Occupation,1,1)),')') FROM OCCUPATIONS
ORDER BY Name;

SELECT CONCAT('There are a total of ',CAST(COUNT(*) AS varchar(100)),' ',LOWER(Occupation),'s.') FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;


go