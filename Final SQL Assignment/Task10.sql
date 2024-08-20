USE Samples_Population
GO

 ---TASK 10---
WITH PlayerCount AS (
    SELECT
        NAME AS Continent,
        11 AS PlayerCount
    FROM
        Populations
),
Clashes AS (
    SELECT
        A.Continent AS Team_A,
        B.Continent AS Team_B,
        CASE 
            WHEN A.Continent = B.Continent THEN 'NULL'  
            ELSE 'Clash' 
        END AS ClashStatus
    FROM
        PlayerCount A
    CROSS JOIN
        PlayerCount B
)
SELECT
    Team_A AS [Team A],
    ISNULL(Africa, '') AS Africa,
    ISNULL(Antarctica, '') AS Antarctica,
    ISNULL(Asia, '') AS Asia,
    ISNULL([Australia/Oceania], '') AS [Australia/Oceania],
    ISNULL(Europe, '') AS Europe,
    ISNULL([North America], '') AS [North America],
    ISNULL([South America], '') AS [South America]
FROM
    Clashes
PIVOT
    (	MAX(ClashStatus)
        FOR Team_B IN ([Africa], [Antarctica], [Asia], [Australia/Oceania], [Europe], [North America], [South America])
    )	AS PivotTable;






