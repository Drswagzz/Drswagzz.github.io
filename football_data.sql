USE [November_cohort_data]
GO

SELECT [Year]
      ,[Team]
      ,[NAME ]
      ,[No#]
      ,[Pos]
      ,[Ht]
      ,[Wt]
      ,[Age]
      ,[Exp]
      ,[College]
      ,[FirstName]
      ,[LastName]
      ,[Ft]
      ,[In]
      ,[Inches]
      ,[NumGrp]
  FROM [dbo].['Football Players Data$']

GO

--DDL + DML
DELETE FROM [dbo].['Football Players Data$']
WHERE YEAR IS NULL

--Write a query to find all the players in the "Arizona" team.
select
		team
		,name
		,college
		,age
from [dbo].['Football Players Data$']
where team = 'arizona'

--Write a query to find all the players who play as a "WR" (Wide Receiver).
select *
from [dbo].['Football Players Data$']
where pos = 'wr'

--Write a query to list all players taller than 6 feet 2 inches.
select *
from [dbo].['Football Players Data$']
where ht > '6-2'

--Write a query to find all players who attended the "Washington" college.
select 
		name
		,college
from [dbo].['Football Players Data$']
where college = 'washington'

--Write a query to list players who are 25 years old or younger.
select *
from [dbo].['Football Players Data$']
where age <= '25'

--Write a query to find all players with missing Age data.
select *
from [dbo].['Football Players Data$']
where age like 'n/a'

--Write a query to find players who are rookies (Exp = 'R').
select *
from [dbo].['Football Players Data$']
where exp = 'r'

--Write a query to find the tallest player on the "New Orleans" team.
select TOP 6 NAME,[Team],[Ht]
from [dbo].['Football Players Data$']
where team = 'new orleans'
order by [Ht] desc

--Write a query to find players weighing more than 250 pounds.
select *
from [dbo].['Football Players Data$']
where wt > '250'

--Write a query to calculate the average height of players at each position.

SELECT [NAME ],
		[Team],
		[Pos],
		AVG([Inches]) OVER(PARTITION BY [Pos] ) AS [AVG HT BY POSITION]
FROM [dbo].['Football Players Data$']
