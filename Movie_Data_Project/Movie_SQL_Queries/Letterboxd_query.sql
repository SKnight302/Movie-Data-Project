Select *
From Movies2.[dbo].[sam_ratings]
Where year= 2025 
or year = 2024;

Alter Table [dbo].[sam_ratings]
DROP Column [Letterboxd_URI];

Select Year, AVG(Rating) as Year_rating, Count(Name) as films_in_year
From movies2.[dbo].[sam_ratings]
Group By Year
Having Count(Name) >= 20
Order By Year_Rating desc;

Select *
From movies2.dbo.[sam_ratings]
Where year >= 1995 
And year <=1999
Order By Rating Desc;

Select *
From movies2.[dbo].[imdb_250]

Select *, Case
	When Exists(
	Select *
	From movies2.dbo.[imdb_250]
	Left Join movies2.[dbo].[sam_ratings] ON movies2.dbo.[sam_ratings].name = movies2.[dbo].[imdb_250].name
	Where movies2.dbo.[sam_ratings].name = movies2.[dbo].[imdb_250].name) Then 'True'
	Else 'False'
	End As imdb_top_250
From movies2.[dbo].[sam_ratings];

Select *
From movies2.[dbo].[sam_ratings]
Where Exists( Select Name 
From movies2.[dbo].[imdb_250] 
Where movies2.[dbo].[imdb_250].Name= movies2.[dbo].[sam_ratings].name)
order by name;
 
 With imdb_top AS
 (
 Select *, Case 
 When Exists( Select Name 
From movies2.[dbo].[imdb_250] 
Where movies2.[dbo].[imdb_250].Name= movies2.[dbo].[sam_ratings].name
And movies2.[dbo].[imdb_250].year= movies2.[dbo].[sam_ratings].year)
Then 'True'
Else 'False'
End As imdb_top_250
From movies2.[dbo].[sam_ratings]
Where Exists( Select Name 
From movies2.[dbo].[imdb_250] 
Where movies2.[dbo].[imdb_250].Name= movies2.[dbo].[sam_ratings].name
And movies2.[dbo].[imdb_250].year= movies2.[dbo].[sam_ratings].year)
)
Select * 
From imdb_top
Order by Name;

Alter Table movies2.[dbo].[sam_ratings]
Add imdb_top_250 as (Case 
 When Exists( Select Name 
From movies2.[dbo].[imdb_250] 
Where movies2.[dbo].[imdb_250].Name= movies2.[dbo].[sam_ratings].name
And movies2.[dbo].[imdb_250].year= movies2.[dbo].[sam_ratings].year)
Then 'True'
Else 'False'
End);


Select *
From movies2.[dbo].[sam_ratings]
Where Exists( Select Name 
From movies2.[dbo].[letterboxd_250] 
Where movies2.[dbo].[letterboxd_250].Name= movies2.[dbo].[sam_ratings].name);


With letterboxd_top AS
 (
 Select *, Case 
 When Exists( Select Name 
From movies2.[dbo].[letterboxd_250] 
Where movies2.[dbo].[letterboxd_250].Name= movies2.[dbo].[sam_ratings].name
And movies2.[dbo].[letterboxd_250].year= movies2.[dbo].[sam_ratings].year)
Then 'True'
Else 'False'
End As letterboxd_top_250
From movies2.[dbo].[sam_ratings]
Where Exists( Select Name 
From movies2.[dbo].[letterboxd_250] 
Where movies2.[dbo].[letterboxd_250].Name= movies2.[dbo].[sam_ratings].name
And movies2.[dbo].[letterboxd_250].year= movies2.[dbo].[sam_ratings].year)
)
Select * 
From letterboxd_top;


With letterboxd_top AS
 (
 Select *, Case 
 When Exists( Select Name 
From movies2.[dbo].[letterboxd_250] 
Where movies2.[dbo].[letterboxd_250].Name= movies2.[dbo].[sam_ratings].name
And movies2.[dbo].[letterboxd_250].year= movies2.[dbo].[sam_ratings].year)
Then 'True'
Else 'False'
End As letterboxd_top_250
From movies2.[dbo].[sam_ratings]
), 
imdb_top AS
 (
 Select *, Case 
 When Exists( Select Name 
From movies2.[dbo].[imdb_250] 
Where movies2.[dbo].[imdb_250].Name= movies2.[dbo].[sam_ratings].name
And movies2.[dbo].[imdb_250].year= movies2.[dbo].[sam_ratings].year)
Then 'True'
Else 'False'
End As imdb_top_250
From movies2.[dbo].[sam_ratings]
),
letterboxd_fans AS
 (
 Select *, Case 
 When Exists( Select Name 
From movies2.[dbo].[letterboxd_250_fans] 
Where movies2.[dbo].[letterboxd_250_fans].Name= movies2.[dbo].[sam_ratings].name
And movies2.[dbo].[letterboxd_250_fans].year= movies2.[dbo].[sam_ratings].year)
Then 'True'
Else 'False'
End As letterboxd_top_fans
From movies2.[dbo].[sam_ratings]
),
letterboxd_million_watches AS
 (
 Select *, Case 
 When Exists( Select Name 
From movies2.[dbo].[letterboxd_million_watched] 
Where movies2.[dbo].[letterboxd_million_watched].Name= movies2.[dbo].[sam_ratings].name
And movies2.[dbo].[letterboxd_million_watched].year= movies2.[dbo].[sam_ratings].year)
Then 'True'
Else 'False'
End As letterboxd_million
From movies2.[dbo].[sam_ratings]
)
Select letterboxd_top.Name, letterboxd_top.Year, letterboxd_top.rating, letterboxd_top_250, imdb_top_250, letterboxd_top_fans, letterboxd_million
From letterboxd_top
Join imdb_top ON letterboxd_top.name= imdb_top.name
and letterboxd_top.year= imdb_top.year
Join letterboxd_fans ON letterboxd_top.name = letterboxd_fans.Name
And letterboxd_top.year = letterboxd_fans.year
Join letterboxd_million_watches On letterboxd_top.Name= letterboxd_million_watches.name
And letterboxd_top.year= letterboxd_million_watches.year
Order by letterboxd_top.name ASC;

