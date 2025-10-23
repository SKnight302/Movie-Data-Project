Select *
From movies2.[dbo].[film_list]

With letterboxd_top AS
 (
 Select *, Case 
 When Exists( Select Name 
From movies2.[dbo].[letterboxd_250] 
Where movies2.[dbo].[letterboxd_250].Name= movies2.[dbo].[film_list].name
And movies2.[dbo].[letterboxd_250].year= movies2.[dbo].[film_list].year)
Then 'True'
Else 'False'
End As letterboxd_top_250
From movies2.[dbo].[film_list]
), 
imdb_top AS
 (
 Select *, Case 
 When Exists( Select Name 
From movies2.[dbo].[imdb_250] 
Where movies2.[dbo].[imdb_250].Name= movies2.[dbo].[film_list].name
And movies2.[dbo].[imdb_250].year= movies2.[dbo].[film_list].year)
Then 'True'
Else 'False'
End As imdb_top_250
From movies2.[dbo].[film_list]
),
letterboxd_fans AS
 (
 Select *, Case 
 When Exists( Select Name 
From movies2.[dbo].[letterboxd_250_fans] 
Where movies2.[dbo].[letterboxd_250_fans].Name= movies2.[dbo].[film_list].name
And movies2.[dbo].[letterboxd_250_fans].year= movies2.[dbo].[film_list].year)
Then 'True'
Else 'False'
End As letterboxd_top_fans
From movies2.[dbo].[film_list]
),
letterboxd_million_watches AS
 (
 Select *, Case 
 When Exists( Select Name 
From movies2.[dbo].[letterboxd_million_watched] 
Where movies2.[dbo].[letterboxd_million_watched].Name= movies2.[dbo].[film_list].name
And movies2.[dbo].[letterboxd_million_watched].year= movies2.[dbo].[film_list].year)
Then 'True'
Else 'False'
End As letterboxd_million
From movies2.[dbo].[film_list]
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

Select * 
From movies2.[dbo].[Combined_List]
Where letterboxd_million = 1
And letterboxd_top_250 = 0
And letterboxd_top_fans = 0
And imdb_top_250 = 0
And rating IS NULL
Order by Year;

Update movies2.[dbo].[Combined_List]
Set rating = '4.5'
Where name = 'Superman'
and year = 2025;

Select *
From movies2.[dbo].[Combined_List]
Where  rating IS NULL
Order By year asc;

