USE Samples_Population
GO

 ---TASK 7---
 WITH ContinentList AS 
(
    SELECT 
        NAME AS Continent
    FROM 				
        Populations
),
Numbers AS 
(
    SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS Rn_Number
    FROM sys.columns
)
SELECT 
    Continent,
    (
        SELECT 
            SUBSTRING(c.Continent, LEN(c.Continent) - Rn_Number + 1, 1) 
        FROM 
            ContinentList as c
        CROSS JOIN 
            Numbers
        WHERE 
            Rn_Number <= LEN(c.Continent)
            AND ContinentList.Continent = c.Continent
        FOR XML PATH(''), TYPE 
	).value('.', 'VARCHAR(MAX)') AS Reversed_Name
FROM 
    ContinentList;




