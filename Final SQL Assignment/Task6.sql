USE Samples_Population
GO

 ---TASK 6---

 declare @current_percentage_land int = 29
 declare @estimate_percentage_land int = 58

 declare @populationIn2020 decimal(20,2) = (select sum(PopulationIn2020) from Populations)

 select @populationIn2020 * (@estimate_percentage_land/ @current_percentage_land) as Estimated_People


