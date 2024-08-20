USE Samples_Population
GO

 ---TASK 3---
declare @table table (t INT);
DECLARE @counter INT =1

while (@counter <= (select max(len(name)) from Populations))
begin
insert into @table values (@counter)
set @counter = @counter + 1
end
--select * from @table

select upper(substring(name,t,1)) as letter,count(*) as count
from Populations
cross apply
@table
where SUBSTRING(name,t,1) like '[A-Z]'
group by UPPER(substring(name,t,1))