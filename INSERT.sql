--Задание 1
--Добавление исполнителей
insert into Performers (group_name)
values ('Sabaton');
insert into Performers (group_name)
values ('Five Finger Death Punch');
insert into Performers (group_name)
values ('Asper X');
insert into Performers (group_name)
values ('Fun Mode');
insert into Performers (group_name)
values ('babe metall');

-- Изменение исполнителей
update performers 
set group_name = 'MyJoy'
where id = 1;
update performers 
set group_name = 'Дикие барды'
where id = 2;
update performers 
set group_name = 'Яростные менестрели'
where id = 3;
update performers 
set group_name = 'Глухие трубадуры'
where id = 4;
update performers 
set group_name = 'Null talant'
where id = 5;
update performers 
set group_name = 'Дикие'
where id = 2;


--Добавление жанров
insert into Music_genres ("name")
values ('Rock and Roll');
insert into Music_genres ("name")
values ('Инструмантал');
insert into Music_genres ("name")
values ('Электронная музыка');
insert into Music_genres ("name")
values ('Попса');

--Добавление альбомов
insert into album (name_album,year_of_issue)
values ('Адская печка','2001-05-23');
insert into album (name_album,year_of_issue)
values ('Мокрая дорога','2014-01-13');
insert into album (name_album,year_of_issue)
values ('Броская женщина','2019-04-18');
insert into album (name_album,year_of_issue)
values ('Шведский пикет','2022-08-31');
insert into album (name_album,year_of_issue)
values ('Жестокая жизнь','2012-05-21');
insert into album (name_album,year_of_issue)
values ('Люблю зефир','2002-03-19');
update album 
set year_of_issue = '2019-05-23'
where id = 1;

--Добавление треков
insert into Music_track (id,name_track,duration_in_second,album_id)
values(1,'My heart',250,4);
insert into Music_track (id,name_track,duration_in_second,album_id)
values(2,'Далекие края',180,2);
insert into Music_track (id,name_track,duration_in_second,album_id)
values(3,'Кривые руки',120,1);
insert into Music_track (id,name_track,duration_in_second,album_id)
values(4,'Хочу спать',210,4);
insert into Music_track (id,name_track,duration_in_second,album_id)
values(5,'Работа бесит',190,5);
insert into Music_track (id,name_track,duration_in_second,album_id)
values(6,'Крутая шутка',190,6);

--Добавление сборников
insert into collection (name_collection,year_of_issue)
values('Baby dud','2012-05-21');
insert into collection (name_collection,year_of_issue)
values('Стронгер ман','2022-08-01');
insert into collection (name_collection,year_of_issue)
values('Про жизнь','2023-06-09');
insert into collection (name_collection,year_of_issue)
values('Люблю спорт','2017-03-11');

update collection 
set year_of_issue = '2019-05-21'
where id = 1;

--Добавление связи исполнителей и жанров
insert into first_condition (music_genres_id,performers_id)
values(1,1);
insert into first_condition (music_genres_id,performers_id)
values(1,2);
insert into first_condition (music_genres_id,performers_id)
values(2,4);
insert into first_condition (music_genres_id,performers_id)
values(3,3);
insert into first_condition (music_genres_id,performers_id)
values(4,1);
insert into first_condition (music_genres_id,performers_id)
values(1,4);
insert into first_condition (music_genres_id,performers_id)
values(4,5);

--Добавление связи исполнителей и альбомов
insert into Second_condition(album_id,performers_id)
values(1,5);
insert into Second_condition(album_id,performers_id)
values(1,1);
insert into Second_condition(album_id,performers_id)
values(2,2);
insert into Second_condition(album_id,performers_id)
values(2,4);
insert into Second_condition(album_id,performers_id)
values(3,5);
insert into Second_condition(album_id,performers_id)
values(3,1);
insert into Second_condition(album_id,performers_id)
values(4,5);
insert into Second_condition(album_id,performers_id)
values(3,2);
insert into Second_condition(album_id,performers_id)
values(6,5);

--Суем треки в сборники
insert into Collect_and_track(music_track_id,collection_id)
values(1,4);
insert into Collect_and_track(music_track_id,collection_id)
values(1,3);
insert into Collect_and_track(music_track_id,collection_id)
values(2,4);
insert into Collect_and_track(music_track_id,collection_id)
values(3,1);
insert into Collect_and_track(music_track_id,collection_id)
values(4,1);
insert into Collect_and_track(music_track_id,collection_id)
values(6,3);
insert into Collect_and_track(music_track_id,collection_id)
values(2,1);
insert into Collect_and_track(music_track_id,collection_id)
values(5,2);
insert into Collect_and_track(music_track_id,collection_id)
values(5,4);



















