USE Samples_Population
GO

 ---TASK 5---
SELECT 
	Name AS Continent,
	CAST((PopulationIn2020 / AreaInKm2 * 0.386102)*100 AS DECIMAL(10,2)) AS Density
FROM Populations
ORDER BY Density DESC



