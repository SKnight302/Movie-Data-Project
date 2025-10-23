With all_movies As (
Select sam_ratings.Name, sam_ratings.Year, rating
From Movies2.[dbo].[sam_ratings]
Union
Select Name, Year, Null as rating
From Movies2.[dbo].[imdb_250]
Union
Select Name, Year, Null as rating
From Movies2.[dbo].[letterboxd_250] 
Union
Select Name, year, Null as rating
From Movies2.[dbo].[letterboxd_250_fans]
Union
Select Name, Year, Null as rating
From Movies2.[dbo].[letterboxd_million_watched])
Select *, ROW_NUMBER() Over(Partition By Name, year Order by name, year, rating desc) as row_num
From all_movies

Insert into Movies2.[dbo].[sam_staging]
Select sam_ratings.Name, sam_ratings.Year, rating
From Movies2.[dbo].[sam_ratings]
Union
Select Name, Year, Null as rating
From Movies2.[dbo].[imdb_250]
Union
Select Name, Year, Null as rating
From Movies2.[dbo].[letterboxd_250] 
Union
Select Name, year, Null as rating
From Movies2.[dbo].[letterboxd_250_fans]
Union
Select Name, Year, Null as rating
From Movies2.[dbo].[letterboxd_million_watched]

Select * 
From Movies2.[dbo].[sam_staging]
order by name;

With row_extra as(
Select *, ROW_NUMBER() Over(Partition By Name, year Order by name, year, rating desc) as row_num
From Movies2.[dbo].[sam_staging])
Select Name,year, rating
From row_extra
Where row_num= 1
Order By Name;

With row_extra as(
Select *, ROW_NUMBER() Over(Partition By Name, year Order by name, year, rating desc) as row_num
From Movies2.[dbo].[sam_staging])
Select Name,year, rating
From row_extra
Where rating Is Null
and row_num= 1
Order By year;






