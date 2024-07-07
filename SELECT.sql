-- Задание 2 

-- 5.Название треков, которые содержат слово «мой» или «my».
select name_track from music_track where name_track like '%My%' or name_track like '%Мой%';
--4.Исполнители, чьё имя состоит из одного слова.
select group_name from performers where group_name not like '% %';
--3.Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name_collection from collection where year_of_issue between '2018-01-01' and '2020-12-31';
--2.Название треков, продолжительность которых не менее 3,5 минут (210 c.).
select name_track from Music_track where duration_in_second >= 210;
--1. Название и продолжительность самого длительного трека.
select name_track,duration_in_second from Music_track order by duration_in_second desc limit 1;

-- задание 3

-- 1. Количество исполнителей в каждом жанре.
select count(performers_id) from first_condition where music_genres_id = 1;
select count(performers_id) from first_condition where music_genres_id = 2;
select count(performers_id) from first_condition where music_genres_id = 3;
select count(performers_id) from first_condition where music_genres_id = 4;

--2. Количество треков, вошедших в альбомы 2019–2020 годов.
select count(name_track) from music_track mt left join album a on mt.album_id = a.id where year_of_issue between '2019-01-01' and '2020-12-31';

--3.Средняя продолжительность треков по каждому альбому.
select avg(duration_in_second) from music_track mt where album_id between 1 and 6; 

--4.Все исполнители, которые не выпустили альбомы в 2020 году.
select p.group_name from performers p join second_condition sc on p.id = sc.album_id join album a on sc.album_id = a.id where year_of_issue not in ('2020-01-01'); 

--5.Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select c.name_collection from collection c join collect_and_track cat on c.id = cat.music_track_id join album a on cat.music_track_id = a.id join second_condition sc on a.id = sc.performers_id where sc.performers_id = 4; 

