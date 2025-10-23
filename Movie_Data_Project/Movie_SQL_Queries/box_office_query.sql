Select *
From Movies2.[dbo].[box_office]
Where worldwide<= 5000000
and year != 2020
Order by worldwide desc;

Delete 
From Movies2.[dbo].[box_office]
Where worldwide <= 5000000
and year != 2020;

Select * 
From Movies2.[dbo].[box_office_1900s]
Where Worldwide >= 1000000

Delete From Movies2.[dbo].[box_office_1900s]
Where Worldwide <= 1000000;

Select Movies2.[dbo].[box_office].name, Movies2.[dbo].[box_office].year, box_office_rank, worldwide, rating, letterboxd_top_250,
imdb_top_250,letterboxd_top_fans, letterboxd_million,Case
When worldwide>= 1000000000 
Then 'Billion'
When worldwide>= 500000000
Then 'Half Billion'
When worldwide >= 100000000
Then 'Hundred Million'
Else ''
END as billion_dollars
From Movies2.[dbo].[box_office]
Join Movies2.[dbo].[Combined_List]
On Movies2.[dbo].[box_office].name= Movies2.[dbo].[Combined_List].name
and Movies2.[dbo].[box_office].year = Movies2.[dbo].[Combined_List].year
Where worldwide >= 100000000 
and (letterboxd_top_250 = 1
or imdb_top_250 =1)
order by year;

Select Movies2.[dbo].[box_office_1900s].name, Movies2.[dbo].[box_office_1900s].year, box_office_rank, worldwide, rating, letterboxd_top_250,
imdb_top_250, letterboxd_top_fans, letterboxd_million
From Movies2.[dbo].[box_office_1900s]
Join Movies2.[dbo].[Combined_List]
On Movies2.[dbo].[box_office_1900s].name= Movies2.[dbo].[Combined_List].name
and Movies2.[dbo].[box_office_1900s].year = Movies2.[dbo].[Combined_List].year
order by name;

Select * 
From Movies2.[dbo].[Combined_List]
Where year <= 1976
order  by year desc

Select *,Case
When worldwide>= 1000000000 
Then 'Billion'
When worldwide>= 500000000
Then 'Half Billion'
When worldwide >= 100000000
Then 'Hundred Million'
Else ''
END as billion_dollars
From Movies2.[dbo].[box_office]
Union All
Select *,Case
When worldwide>= 1000000000 
Then 'Billion'
When worldwide>= 500000000
Then 'Half Billion'
When worldwide >= 100000000
Then 'Hundred Million'
Else ''
END as billion_dollars
From Movies2.[dbo].[box_office_1900s]
order by name

Alter Table Movies2.[dbo].[box_office_1900s]
Drop Column column7;

Delete
From Movies2.[dbo].[box_office]
Where name Like '%Re-release'

Delete
From Movies2.[dbo].[box_office_1900s]
Where name Like '%Re-release'

Select Movies2.[dbo].[box_office].name, Movies2.[dbo].[box_office].year, box_office_rank, worldwide, rating, letterboxd_top_250, imdb_top_250,
letterboxd_top_fans, letterboxd_million,Case
When worldwide>= 1000000000 
Then 'Billion'
When worldwide>= 500000000
Then 'Half Billion'
When worldwide >= 100000000
Then 'Hundred Million'
Else ''
END as billion_dollars
From Movies2.[dbo].[box_office]
Join Movies2.[dbo].[Combined_List]
On Movies2.[dbo].[box_office].name= Movies2.[dbo].[Combined_List].name
and Movies2.[dbo].[box_office].year = Movies2.[dbo].[Combined_List].year
Union 
Select Movies2.[dbo].[box_office_1900s].name, Movies2.[dbo].[box_office_1900s].year, box_office_rank, worldwide, rating, letterboxd_top_250,
imdb_top_250, letterboxd_top_fans, letterboxd_million,Case
When worldwide>= 1000000000 
Then 'Billion'
When worldwide>= 500000000
Then 'Half Billion'
When worldwide >= 100000000
Then 'Hundred Million'
Else ''
END as billion_dollars
From Movies2.[dbo].[box_office_1900s]
Join Movies2.[dbo].[Combined_List]
On Movies2.[dbo].[box_office_1900s].name= Movies2.[dbo].[Combined_List].name
and Movies2.[dbo].[box_office_1900s].year = Movies2.[dbo].[Combined_List].year
order by year

DELETE 
From Movies2.[dbo].[box_office_1900s]
Where year = 1987

Select * 
From Movies2.[dbo].[box_office_1900s]
where year = 1987
Union
Select *
From movies2.[dbo].[1987_box_office]
Where year = 1987

Insert into Movies2.[dbo].[box_office_1900s]
Select *
From movies2.[dbo].[1987_box_office]

select *
from Movies2.[dbo].[box_office_1900s]
where year = 1987

select * 
From Movies2.[dbo].[combined_list]
Where letterboxd_top_250 = 1;	

Select  Case 
When Movies2.[dbo].[box_office_full].name is Null
Then Movies2.[dbo].[Combined_List].name
Else Movies2.[dbo].[box_office_full].name
End as Name,
Case 
When Movies2.[dbo].[box_office_full].year is Null
Then Movies2.[dbo].[Combined_List].year
Else Movies2.[dbo].[box_office_full].year
End as Year, Box_Office_Rank, Worldwide, Milestone, rating,letterboxd_top_250, imdb_top_250, letterboxd_top_fans, letterboxd_million
From Movies2.[dbo].[box_office_full]
Full Join Movies2.[dbo].[Combined_List]
On Movies2.[dbo].[box_office_full].name= Movies2.[dbo].[Combined_List].name
and Movies2.[dbo].[box_office_full].year = Movies2.[dbo].[Combined_List].year
order by Movies2.[dbo].[box_office_full].name




