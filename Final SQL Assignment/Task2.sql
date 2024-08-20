USE Samples_Population
GO

 ---TASK 2---

SELECT 
    '2000' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2000 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2001' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2001 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2002' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2002 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2003' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2003 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2004' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2004 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2005' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2005 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2006' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2006 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2007' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2007 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2008' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2008 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2009' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2009 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2010' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2010 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2011' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2011 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2012' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2012 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2013' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2013 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2014' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2014 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2015' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2015 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2016' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2016 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2017' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2017 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2018' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2018 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2019' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2019 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations
UNION ALL
SELECT 
    '2020' AS Year,
    (SELECT 
            Name AS Continent,
            CAST(PopulationIn2020 / AreaInKm2 AS DECIMAL(10,2)) AS Density
        FROM 
            Populations
        FOR JSON PATH
    ) AS YearData
FROM 
    Populations;