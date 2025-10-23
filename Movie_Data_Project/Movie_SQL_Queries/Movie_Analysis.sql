select movie_name, year, Worldwide, Box_Office_Rank, Milestone, rating
From Movies2.[dbo].[Everything_Movies]
Where Milestone like '%illion%'
and letterboxd_top_250 =1
and imdb_top_250 =1
and letterboxd_top_fans=1
and letterboxd_million =1
order by rating desc

Select year, Sum(Worldwide) as year_gross
From Movies2.[dbo].[Everything_Movies]
Where Worldwide is Not Null
Group By year
order by year_gross desc;

Select year, Sum(Case When letterboxd_top_250 =1 then 1 else 0 End) as letterboxd_250_year, Sum(Case When imdb_top_250 =1 then 1 else 0 End) as imdb_250_year,
Sum(Case When letterboxd_top_fans =1 then 1 else 0 End) as letterboxd_fans_year, Sum(Case When letterboxd_million =1 then 1 else 0 End) as letterboxd_million_watched_year,
Sum(Case When Milestone like '%illion%' then 1 else 0 End) as hundred_million_year
From Movies2.[dbo].[Everything_Movies]
Group By year
order by year;

Select * 
From  Movies2.[dbo].[Everything_Movies]
Where letterboxd_million =1 
and year =2025;

Select Year, Avg(Worldwide) as top_ten_gross, Sum(Case When letterboxd_top_250 =1 and Box_Office_Rank <=10 then 1 else 0 End) as letterboxd_250_year, Sum(Case When imdb_top_250 =1 and Box_Office_Rank <=10 then 1 else 0 End) as imdb_250_year,
Sum(Case When letterboxd_top_fans =1 and Box_Office_Rank <=10 then 1 else 0 End) as letterboxd_fans_year, Sum(Case When letterboxd_million =1 and Box_Office_Rank <=10 then 1 else 0 End) as letterboxd_million_watched_year, Sum(Case When Milestone like '%illion%' and Box_Office_Rank <=10 then 1 else 0 End) as hundred_million_year
From  Movies2.[dbo].[Everything_Movies]
Where Box_Office_Rank <=10
Group by year
Order By Avg(Worldwide) desc

Select * 
From  Movies2.[dbo].[Everything_Movies]
Where box_office_rank<=10
order by box_office_rank, Worldwide desc

Select Milestone,Count(movie_name) as total_movies, Sum(Case When letterboxd_top_250 =1 then 1 else 0 End) as letterboxd_250_milestone, Sum(Case When imdb_top_250 =1 then 1 else 0 End) as imdb_250_milestone,
Sum(Case When letterboxd_top_fans =1 then 1 else 0 End) as letterboxd_fans_milestone, Sum(Case When letterboxd_million =1 then 1 else 0 End) as letterboxd_million_watched_milestone
From Movies2.[dbo].[Everything_Movies]
Where Milestone Is Not Null
Group By Milestone
Order by Milestone

Select *
From Movies2.[dbo].[Everything_Movies]
Where Milestone Is Null

Select movie_name, year, Sum(Case When letterboxd_top_250 =1 then 1 else 0 End) + Sum(Case When imdb_top_250 =1 then 1 else 0 End) +
Sum(Case When letterboxd_top_fans =1 then 1 else 0 End) + Sum(Case When letterboxd_million =1 then 1 else 0 End) + Sum(Case When milestone like '%illion' then 1 else 0 End) as total_lists
From Movies2.dbo.Everything_Movies
group by movie_name, year
order by total_lists desc

Select movie_name, year, Sum(Case When letterboxd_top_250 =1 then 1 else 0 End) + Sum(Case When imdb_top_250 =1 then 1 else 0 End) +
Sum(Case When letterboxd_top_fans =1 then 1 else 0 End) + Sum(Case When letterboxd_million =1 then 1 else 0 End) + Sum(Case When milestone like '%illion' then 1 else 0 End) as total_lists
From Movies2.dbo.Everything_Movies
Where rating is null
group by movie_name, year
order by total_lists desc

Select movie_name, year, Worldwide
From Movies2.dbo.Everything_Movies
Where box_office_Rank= 1
order by year;

Select year, Max(worldwide)
From Movies2.dbo.Everything_Movies
Group by year
Having Max(worldwide) is not null
order by year;

Select movie_name, year, worldwide,box_office_rank, milestone
From Movies2.dbo.Everything_Movies
Where imdb_top_250 = 1
and letterboxd_top_250 = 0
and milestone not like '%illion';

Select year, avg(rating) as year_rating, count(rating) as Movies_Seen
From Movies2.dbo.Everything_Movies
Group By year
order by year

Select *
From Movies2.dbo.Everything_Movies
Where (year =1966 or year =1972 or year = 1946 or year =1975 or year= 1948 or year =1954)
and rating is not null

Select* 
From Movies2.dbo.Everything_Movies
Where letterboxd_million=1;

Select * 
From Movies2.dbo.Everything_Movies
Where year <1977
and letterboxd_top_250 =1
and imdb_top_250 =1
and letterboxd_top_fans=1
and letterboxd_million =1


Select Case When imdb_top_250 =1 Then 'imdb' End, AVG(year)
From Movies2.dbo.Everything_Movies
Group by imdb_top_250 
Having imdb_top_250 =1
union 
Select Case When letterboxd_top_250 =1 Then 'letterboxd' End, AVG(year)
From Movies2.dbo.Everything_Movies
Group by letterboxd_top_250
Having letterboxd_top_250=1
Union
Select Case When letterboxd_million =1 Then 'Million' End, AVG(year)
From Movies2.dbo.Everything_Movies
Group By letterboxd_million
Having letterboxd_million=1
Union 
Select Case When letterboxd_top_fans =1 Then 'Favorite' End, AVG(year)
From Movies2.dbo.Everything_Movies
Group By letterboxd_top_fans
Having letterboxd_top_fans=1
order by AVG(year)

