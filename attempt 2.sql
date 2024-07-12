-- название и продолжительность самого длительного трека
select name_track
from music_track mt 
where duration_in_second = 
(select max(duration_in_second) 
from music_track mt2);


-- Названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
select name_collection as coll_on, group_name as perf from collection
left join collect_and_track cat on collection.id = cat.collection_id 
left join music_track mt on cat.music_track_id = mt.id 
left join album a on mt.album_id = a.id 
left join second_condition sc on a.id = sc.album_id 
left join performers p on sc.performers_id = p.id 
where p.id = 2;

--название альбомов, в которых присутствуют исполнители более 1 жанра.
select name_album as album FROM album
left join second_condition sc on album.id = sc.album_id 
left join performers p on p.id = sc.performers_id 
left join first_condition fc on p.id = fc.performers_id 
left join music_genres mg on mg.id = fc.music_genres_id 
group by name_album 
having count(distinct mg."name") > 1
order by name_album;

-- исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
select group_name as perf , duration_in_second, name_track as music from music_track mt 
left join album a on a.id = mt.album_id 
left join second_condition sc on sc.album_id = a.id 
left join performers p on p.id = sc.performers_id 
where mt.duration_in_second = (
select min(duration_in_second) 
from music_track mt2)
order by group_name;

-- Название альбомов, содержащих наименьшее количество треков
select name_album, count(name_track) as track_count from album a 
join music_track mt on a.id = mt.album_id 
group by a.id 
having count(mt.name_track) = (  
	select count(mt.name_track) 
	from album a2 
	join music_track mt2 on a2.id = mt2.album_id 
	group by a2.id 
	order by count(mt2.name_track) 
	limit 1);
