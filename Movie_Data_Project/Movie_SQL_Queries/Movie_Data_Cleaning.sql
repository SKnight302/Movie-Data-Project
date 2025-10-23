USE [Movies2]
GO

/****** Object:  Table [dbo].[box_office]    Script Date: 8/12/2025 10:03:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE Movies2.[dbo].[box_office_full](
	[Year] [smallint] NOT NULL,
	[Box_Office_Rank] [tinyint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Worldwide] [money] NOT NULL,
	[Domestic] [money] NULL,
	[Foreign] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

Insert Into Movies2.[dbo].[box_office_full]
Select *
From Movies2.[dbo].box_office

Insert Into Movies2.[dbo].[box_office_full]
Select *
From Movies2.[dbo].[box_office_1900s]

Select * 
From Movies2.[dbo].[box_office_full]
order by year

Alter Table Movies2.[dbo].[box_office_full]
Add Milestone as Case
When worldwide>= 1000000000 
Then 'Billion'
When worldwide>= 500000000
Then 'Half Billion'
When worldwide >= 100000000
Then 'Hundred Million'
Else ''
END;

Select * 
From Movies2.[dbo].[Combined_List]
Where Not Exists (Select Name
From Movies2.[dbo].[box_office_full]
Where movies2.[dbo].[Combined_List].Name= movies2.[dbo].[box_office_full].name
And movies2.[dbo].[Combined_List].year= movies2.[dbo].[box_office_full].year)
and year >= 1977
and name Like '%?%'
order by year desc

select *
From movies2.dbo.[Combined_List]
Where name Like '%?%'

Update Movies2.[dbo].[combined_list]
Set name= Replace(name,'?','-')
From Movies2.[dbo].[combined_list]
Where Name Like 'Mission: Impossible%'

Update Movies2.[dbo].[combined_list]
Set name= Replace(name,'?','-')
From Movies2.[dbo].[combined_list]
Where Name Like '%? part%'


Update Movies2.[dbo].[combined_list]
Set name= Replace(name,'?','-')
From Movies2.[dbo].[combined_list]
Where Name Like '%Episode%?%'

Update Movies2.[dbo].[combined_list]
Set name= Replace(name,'?','-')
From Movies2.[dbo].[combined_list]
Where name Like 'John Wick: Chapter 3 ? Parabellum'

Update Movies2.[dbo].[combined_list]
set name = 'WALL·E'
where name Like 'WALL-E'

name Like 'WALL?E'
Update Movies2.[dbo].[combined_list]
Set name= Replace(name,'?','é')
From movies2.dbo.[Combined_List]
Where name Like 'Am?lie'
or name Like 'Les Mis?rables'
or name Like 'L?on: The Professional'
or name Like 'Pok?mon Detective Pikachu'

Update Movies2.[dbo].[combined_list]
Set name= Replace(name,'?','ï')
From movies2.dbo.[Combined_List]
Where name Like 'Le Samoura?'

Update Movies2.[dbo].[combined_list]
Set name= Replace(name,'?','½')
From movies2.dbo.[Combined_List]
Where name = '8?'
or name Like 'The lion king 1?'

Update Movies2.[dbo].[combined_list]
Set name= Replace(name,'?','Á')
From movies2.dbo.[Combined_List]
Where name Like 'T?R'

Update Movies2.[dbo].[combined_list]
Set name= Replace(name,'?','¡')
From movies2.dbo.[Combined_List]
Where name Like '?Three Amigos!'

Update Movies2.[dbo].[combined_list]
Set name= 'Y Tu Mamá También'
From movies2.dbo.[Combined_List]
Where name Like 'Y Tu Mam? Tambi?n'

Update Movies2.[dbo].[combined_list]
Set name= 'Déjá Vu'
From movies2.dbo.[Combined_List]
Where name Like 'D?j? Vu'

Update Movies2.[dbo].[combined_list]
Set name= 'The Accountant²'
From movies2.dbo.[Combined_List]
Where name Like 'The Accountant?'

Update Movies2.[dbo].[combined_list]
Set name= 'Life, and Nothing More…'
From movies2.dbo.[Combined_List]
Where name Like 'Life, and Nothing More?'

Update Movies2.[dbo].[combined_list]
Set letterboxd_top_250= 1
Where name = 'Life, and Nothing More…'
or name = 'Y Tu Mamá También'
or name = '8½'

select *
From Movies2.[dbo].[combined_list]
where imdb_top_250=1
Select *
From Movies2.[dbo].[imdb_250]
order by name;

Select *
From Movies2.[dbo].[imdb_250]
where Not Exists( Select Name 
From Movies2.[dbo].[combined_list]
Where Movies2.[dbo].[imdb_250].name= Movies2.[dbo].[combined_list].name
and Movies2.[dbo].[imdb_250].year= Movies2.[dbo].[combined_list].year)
order by name

Update Movies2.[dbo].[combined_list]
Set imdb_top_250= 1
Where name Like 'Gangs of Wasseypur%'
or name Like 'WALL·E'
or name like 'Amélie'
or name like 'Léon: The Professional'

select * 
From Movies2.[dbo].[Combined_List] 
Where letterboxd_top_fans = 1
order by name

select *
From Movies2.[dbo].[letterboxd_250_fans]
order by name

Select *
From Movies2.[dbo].[letterboxd_250_fans]
where Not Exists( Select Name 
From Movies2.[dbo].[combined_list]
Where Movies2.[dbo].[letterboxd_250_fans].name= Movies2.[dbo].[combined_list].name
and Movies2.[dbo].[letterboxd_250_fans].year= Movies2.[dbo].[combined_list].year)
order by name

Update Movies2.[dbo].[Combined_List]
Set letterboxd_top_fans = 1
Where name Like 'WALL·E'
or name like 'Amélie'
or name like 'Léon: The Professional'
or name like 'Star Wars: Episode III%'
or name like 'Y Tu Mamá También'

Update Movies2.[dbo].[Combined_List]
Set letterboxd_million = 1
Where name Like 'WALL·E'
or name like 'Amélie'
or name like 'Léon: The Professional'
or name like 'Star Wars: Episode III%'