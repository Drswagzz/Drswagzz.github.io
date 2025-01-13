--QUEST 10 -- Write a query to calculate the average height of players at each position.


select*
from [dbo].['Football Players Data$']
 
select "Pos", 
Avg(Inches) as Avg_Height_Inches
from [dbo].[FOOTBALL PLAYER 45K]
group by "Pos";
 
--QUEST 11 -- Write a query to find the heaviest player for each position.
 
select Pos,
max ("Wt") as [Heaviest Player]
from [dbo].[FOOTBALL PLAYER 45K]
group by Pos;
 
 
select
"Pos", 
"Name", 
"Wt", 
"Team"
from [dbo].[FOOTBALL PLAYER 45K]
Where "Wt" = 
(select max("Wt")
from [dbo].[FOOTBALL PLAYER 45K]
Where "Pos" = "Pos")
Order by  "Pos";
 
select
"Pos", 
"Name", 
"Team",
max("Wt") as Heaviest_Weight
from [dbo].[FOOTBALL PLAYER 45K]
group by "Pos", "Name", "Team"
order by  Heaviest_Weight desc;
 
 
--QUEST 12 -- Write a query to rank players by age within their team. If two players have the same age, rank them by their weight.
 
select
"Team", 
"Name", 
"Age",
"Wt" ,
rank() over (partition by "Team" order by "Age" desc, "Wt" desc) as Rank
from [dbo].[FOOTBALL PLAYER 45K]
order by "Team", Rank;
 
select
"Team", 
"Name", 
"Age",
"Wt" ,
row_number() over (partition by "Team" order by "Age" desc, "Wt" desc) as Rank
from [dbo].[FOOTBALL PLAYER 45K]
order by "Team", Rank;
 
--QUEST 13 -- Write a query to calculate the average height (in inches) for all players older than 25 years.
 
 
select*
from [dbo].[FOOTBALL PLAYER 45K]
 
select
Avg("Inches") as Avg_Height_Inches
from [dbo].[FOOTBALL PLAYER 45K]
where  "Age" > '25';
 
select
"Team", 
"Name", 
"Age",
Avg("FT" * 12 + "In") as Avg_Height_Inches
from [dbo].['Football Players Data$']
group by "Team", "Name", "Age"
having "Age" > '25'
 
 
-- QUEST 14 -- Write a query to find all players whose height is greater than the average height of their respective team.
 
select
"Team", 
"Name", 
"Pos", 
"Ft", 
"In", 
("Ft" * 12 + "In") as Player_Height_Inches
from [dbo].[FOOTBALL PLAYER 45K]
where "Ft" * 12 + "In" > (
select avg ("Ft" * 12 + "In")
from [dbo].[FOOTBALL PLAYER 45K]
where "Team" = "Team")
order by "Team", ("Ft" * 12 + "In") desc;
 
--QUEST 15 -- Write a query to find all players who share the same last name.
 
select 
"Name", 
"LastName",
"Team",
"Pos"
from [dbo].[FOOTBALL PLAYER 45K]
where "LastName" in (select
"LastName"
from [dbo].[FOOTBALL PLAYER 45K]
group by "LastName"
having count ("LastName") > 1)
order by "LastName";
 
--QUEST 16 -- Write a query to find the players with the minimum height for each position.
 
select
"Team", 
"Name", 
"Pos", 
"Ft", 
"In", 
("Ft" * 12 + "In") as Player_Height_Inches
from [dbo].[FOOTBALL PLAYER 45K]
where "Ft" * 12 + "In" = (
select min ("Ft" * 12 + "In")
from [dbo].[FOOTBALL PLAYER 45K]
where "Pos" = "Pos")
order by "Pos", ("Ft" * 12 + "In");
 
select
Pos as Position,
min ("Ft" * 12 + "In") as [Minimum Height]
from [dbo].[FOOTBALL PLAYER 45K]
group by Pos
order by min ("Ft" * 12 + "In") asc;
 
--QUEST 17 -- Write a query to get the number of players for each team grouped by their experience level.
 
select
*
from [dbo].[FOOTBALL PLAYER 45K]
 
select
"Team", 
"Exp" as [Experience Level], 
count (*) as [No of Player]
from [dbo].[FOOTBALL PLAYER 45K]
group by "Team", "Exp"
order by Team;
 
--QUEST 18 -- Write a query to find the tallest and shortest players from each college.
 
select
College,
Max ("Ft" * 12 + "In") as [Tallest Players],
min ("Ft" * 12 + "In") as [Shortest Players]
from [dbo].[FOOTBALL PLAYER 45K]
group by College
order by College asc;
 
--QUEST 19 -- Write a query to find all players whose weight is above the average weight for their respective position.
 
select *
from [dbo].['Football Players Data$']
 
select
"Team", 
"Name", 
"Pos", 
("Wt") as [Players Weight]
from [dbo].[FOOTBALL PLAYER 45K]
where "Wt" > (
select avg ("Wt")
from [dbo].[FOOTBALL PLAYER 45K]
where "Pos" = "Pos")
order by "Team", Wt desc;
 
select avg ("Wt")
from [dbo].[FOOTBALL PLAYER 45K]
