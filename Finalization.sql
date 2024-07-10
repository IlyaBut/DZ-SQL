
--1.Название и продолжительность самого длительного трека.
select name_track,max(duration_in_second) 
from music_track mt 
group by name_track
order by max(duration_in_second) desc;

--2.Количество исполнителей в каждом жанре.
select Music_genres."name", count(group_name) as perf_in_mg from music_genres
join first_condition fc on music_genres.id = fc.music_genres_id 
join performers p on fc.performers_id = p.id 
group by music_genres."name" 
order by count(performers_id) desc; 


--3.Средняя продолжительность треков по каждому альбому.
select name_album as album, avg(music_track.duration_in_second) as average_songs_duration from album
join music_track on music_track.album_id = album.id 
group by name_album 
order by avg(music_track.duration_in_second);

--4.все исполнители, которые не выпустили альбомы в 2020 году
select distinct group_name as performers from performers p 
where group_name NOT IN
(select distinct group_name as performers_2 from performers p2 
join Second_condition on p.id = Second_condition.performers_id  
join album on Second_condition.album_id = album.id
where album.year_of_issue = '2020-01-01')
order by p.group_name;

--5. Названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
select name_collection as coll_on, group_name as perf from collection
left join collect_and_track cat on collection.id = cat.collection_id 
left join music_track mt on cat.music_track_id = mt.id 
left join album a on mt.album_id = a.id 
left join second_condition sc on a.id = sc.album_id 
left join performers p on sc.performers_id = p.id 
where p.id = 2
group by p.group_name , name_collection;

--6. название альбомов, в которых присутствуют исполнители более 1 жанра. Не работает, почему? Неверный INSERT?
select name_album as album FROM album
left join second_condition sc on album.id = sc.album_id 
left join performers p on p.id = sc.performers_id 
left join first_condition fc on p.id = fc.performers_id 
left join music_genres mg on mg.id = fc.music_genres_id 
group by name_album 
having count(distinct name_album) > 1
order by name_album;

--7.наименование треков, которые не входят в сборники
select name_track as song from music_track mt 
where not exists 
(select from collect_and_track cat where cat.music_track_id = mt.id);

--8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
select group_name as perf , duration_in_second, name_track as music from music_track mt 
left join album a on a.id = mt.album_id 
left join second_condition sc on sc.album_id = a.id 
left join performers p on p.id = sc.performers_id 
group by group_name, mt.duration_in_second , name_track
having mt.duration_in_second = (select min(duration_in_second) from music_track mt2)
order by group_name;

--7.Название альбомов, содержащих наименьшее количество треков
select distinct name_album as album from album a 
join music_track mt on mt.album_id = a.id 
where mt.album_id in 
(select album_id from music_track mt2 
group by album_id
having count(album_id) = (select count(album_id) from music_track mt2 
group by album_id
order by count(album_id)
limit 1))
order by name_album;