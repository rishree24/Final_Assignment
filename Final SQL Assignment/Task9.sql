USE Samples_Population
GO

 ---TASK 9---
WITH GrowthData AS (
SELECT 
    NAME AS Continent,
    CASE 
        WHEN PopulationIn2000 = 0 THEN 0 
        ELSE CAST(((PopulationIn2020 - PopulationIn2000) * 100.0 / PopulationIn2000) AS DECIMAL(10,2))
    END AS GrowthPercentage
FROM 
    Populations
)
SELECT 
    CONCAT('In ', Continent, ', Between years 2000 and 2020 there is ',
           CASE 
               WHEN GrowthPercentage = 0 THEN 'no population growth.'
               WHEN GrowthPercentage <= 10 THEN 'a small population growth of ' + CAST(GrowthPercentage AS NVARCHAR(50)) + '%.'
               WHEN GrowthPercentage <= 50 THEN 'a medium population growth of ' + CAST(GrowthPercentage AS NVARCHAR(50)) + '%.'
               ELSE 'a high population growth of ' + CAST(GrowthPercentage AS NVARCHAR(50)) + '%.'
           END) AS Comment,
    GrowthPercentage AS Growth
FROM 
    GrowthData;






